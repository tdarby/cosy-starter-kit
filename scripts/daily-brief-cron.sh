#!/bin/bash
# CoSy Daily Brief -- cron wrapper
#
# Runs the daily brief headlessly via Claude Code and emails the result.
# Context updates are saved to memory/pending-updates.md for review.
# Full session output is kept in logs/.
#
# Setup:
#   1. Update COSY_DIR below to your CoSy repo path
#   2. Update EMAIL below to your work email
#   3. Make executable: chmod +x scripts/daily-brief-cron.sh
#   4. Add to crontab (starts ~15 min before you want the email):
#      crontab -e
#      45 10 * * 1-5 /path/to/cosy/scripts/daily-brief-cron.sh >> /path/to/cosy/logs/daily-brief-cron.log 2>&1
#
#      Adjust the hour for your timezone (45 10 = 10:45 UTC = 6:45 AM EDT).
#      The brief takes ~10 minutes to generate, so start 15 min before your
#      target delivery time.

set -euo pipefail

# ----- CONFIGURE THESE -----
COSY_DIR="$HOME/repos/cosy"
EMAIL="you@company.com"
# ---------------------------

# If your CLI tools (e.g., gws) use the system keyring for OAuth tokens,
# cron won't have access to the desktop session's dbus. Uncomment these
# lines to fix keyring access in cron:
# export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$(id -u)/bus"
# export XDG_RUNTIME_DIR="/run/user/$(id -u)"

LOG_DIR="${COSY_DIR}/logs"
TODAY=$(date +%Y-%m-%d)
LOG_PREFIX="[$(date '+%Y-%m-%d %H:%M:%S')]"

log() { echo "${LOG_PREFIX} $1"; }

mkdir -p "${LOG_DIR}"

# Skip if vacation mode is active
VACATION_FILE="${COSY_DIR}/work/vacation.md"
if [[ -f "${VACATION_FILE}" ]]; then
    STATUS=$(grep -oP '(?<=\*\*Status\*\* \| )\S+' "${VACATION_FILE}" || echo "inactive")
    if [[ "${STATUS}" == "active" ]]; then
        log "Vacation mode is active. Skipping daily brief (vacation poller handles this)."
        exit 0
    fi
fi

log "Running daily brief."

cd "${COSY_DIR}"
claude -p "Run my daily brief for $(date +'%A, %B %-d, %Y'). Follow the instructions in prompts/daily-brief.md exactly. Save the briefing to briefs/daily/${TODAY}.md AND email it to ${EMAIL} as HTML.

HEADLESS MODE INSTRUCTIONS (this is running unattended via cron):
- Do NOT ask interactive questions or wait for confirmation.
- For the Context Maintenance section: instead of asking 'Apply these updates?',
  append the proposed updates to memory/pending-updates.md under a date header.
  Use this format:

  ## ${TODAY} - Daily Brief

  **open-threads.md**
  - [CLOSE] / [UPDATE] / [NEW] entries...

  **interactions.md**
  - [LOG] entries...

  **priorities.md**
  - [SHIFT] / [NEW] entries...

  ---

  If memory/pending-updates.md doesn't exist, create it with a header:
  '# Pending Context Updates'

- If any data source fails, note it in the brief and continue." \
    --allowedTools "Bash,Read,Write,mcp__slack__search_messages,mcp__slack__get_channel_history,mcp__github__search_pull_requests" \
    > "${LOG_DIR}/daily-brief-${TODAY}.log" 2>&1

# Check if the brief was created
if [[ -f "${COSY_DIR}/briefs/daily/${TODAY}.md" ]]; then
    log "Daily brief saved and emailed."
    log "Session log: ${LOG_DIR}/daily-brief-${TODAY}.log"
else
    log "WARNING: Claude ran but no brief file was created. Check ${LOG_DIR}/daily-brief-${TODAY}.log"
fi

log "Done."
