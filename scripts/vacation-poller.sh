#!/bin/bash
# CoSy Vacation Poller -- cron wrapper
#
# Checks work/vacation.md for active PTO status. If today falls within the
# PTO range, runs the vacation-poller prompt headlessly via Claude Code and
# saves the output to briefs/vacation/YYYY-MM-DD.md.
#
# Setup:
#   1. Update COSY_DIR below to your CoSy repo path
#   2. Update ALLOWED_TOOLS to match your integrations
#   3. Make executable: chmod +x scripts/vacation-poller.sh
#   4. Add to crontab (runs weekdays at ~9 AM your local time):
#      crontab -e
#      7 13 * * 1-5 /path/to/cosy/scripts/vacation-poller.sh >> /path/to/cosy/logs/vacation-poller.log 2>&1
#
#      Adjust the hour (13 = 1 PM UTC = 9 AM EDT) to match your timezone.
#      The script exits immediately if PTO is not active, so it's safe to
#      leave installed permanently.

set -euo pipefail

# ----- CONFIGURE THESE -----
COSY_DIR="$HOME/repos/cosy"

# Tools to pre-approve for headless execution. Bash, Read, and Write are the
# minimum. Add MCP tool names for your integrations. To find your MCP tool
# names, run: claude mcp list
# See setup/integrations.md for details.
ALLOWED_TOOLS="Bash,Read,Write"
# Common additions (uncomment what you use):
# ALLOWED_TOOLS="${ALLOWED_TOOLS},mcp__slack__search_messages,mcp__slack__get_channel_history"
# ALLOWED_TOOLS="${ALLOWED_TOOLS},mcp__github__search_pull_requests,mcp__github__list_pull_requests"
# ---------------------------

VACATION_FILE="${COSY_DIR}/work/vacation.md"
PROMPT_FILE="${COSY_DIR}/prompts/vacation-poller.md"
OUTPUT_DIR="${COSY_DIR}/briefs/vacation"
LOG_DIR="${COSY_DIR}/logs"
LOG_PREFIX="[$(date '+%Y-%m-%d %H:%M:%S')]"

log() { echo "${LOG_PREFIX} $1"; }

# Ensure directories exist
mkdir -p "${OUTPUT_DIR}" "${LOG_DIR}"

# Check vacation config exists
if [[ ! -f "${VACATION_FILE}" ]]; then
    log "No vacation config found at ${VACATION_FILE}. Exiting."
    exit 0
fi

# Parse status, start_date, end_date from the markdown table
STATUS=$(grep -oP '(?<=\*\*Status\*\* \| )\S+' "${VACATION_FILE}" || echo "inactive")
START_DATE=$(grep -oP '(?<=\*\*Start date\*\* \| )\S+' "${VACATION_FILE}" || echo "--")
END_DATE=$(grep -oP '(?<=\*\*End date\*\* \| )\S+' "${VACATION_FILE}" || echo "--")

# Exit if not active
if [[ "${STATUS}" != "active" ]]; then
    log "Vacation status is '${STATUS}'. Exiting."
    exit 0
fi

# Validate dates
if [[ "${START_DATE}" == "--" || "${END_DATE}" == "--" ]]; then
    log "ERROR: Vacation is active but dates are missing. Exiting."
    exit 1
fi

# Check if today falls within the PTO range
TODAY=$(date +%Y-%m-%d)
if [[ "${TODAY}" < "${START_DATE}" || "${TODAY}" > "${END_DATE}" ]]; then
    log "Today (${TODAY}) is outside PTO range (${START_DATE} to ${END_DATE}). Exiting."
    exit 0
fi

log "PTO is active (${START_DATE} to ${END_DATE}). Running vacation poller."

OUTPUT_FILE="${OUTPUT_DIR}/${TODAY}.md"

# Run Claude Code headlessly with the vacation poller prompt
cd "${COSY_DIR}"
claude -p "Run the vacation poller for $(date +'%A, %B %-d, %Y'). Follow the instructions in prompts/vacation-poller.md exactly. Save the output to briefs/vacation/${TODAY}.md." \
    --allowedTools "${ALLOWED_TOOLS}" \
    > "${OUTPUT_DIR}/${TODAY}-raw.log" 2>&1

# Check if the brief was created
if [[ -f "${OUTPUT_FILE}" ]]; then
    log "Vacation summary saved to ${OUTPUT_FILE}"
    rm -f "${OUTPUT_DIR}/${TODAY}-raw.log"
else
    log "WARNING: Claude ran but no summary file was created. Check ${OUTPUT_DIR}/${TODAY}-raw.log"
fi

log "Done."
