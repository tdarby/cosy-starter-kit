# Automated Daily Brief

_Wake up to your daily brief in your inbox._

---

## What It Does

A cron job runs Claude Code headlessly each weekday morning, executes your daily
brief prompt, and emails the result. By the time you open your inbox, your brief
is waiting.

**What it produces:**
- A markdown brief saved to `briefs/daily/YYYY-MM-DD.md`
- An HTML email sent to your work address
- Any proposed context updates appended to `memory/pending-updates.md`
- A plain text session log in `logs/`

**What it skips:**
- Interactive questions (runs fully unattended)
- Context file updates (saved as pending for your review)
- Days when vacation mode is active (the vacation poller handles those)

---

## Setup

### 1. Customize the daily brief prompt

Make sure `prompts/daily-brief.md` is configured with your data sources, channels,
and integrations. The cron script runs this prompt headlessly, so everything it
needs must be specified in the prompt file.

### 2. Configure the cron script

Edit `scripts/daily-brief-cron.sh`:

1. Set `COSY_DIR` to the absolute path of your CoSy repo
2. Set `EMAIL` to your work email address
3. Adjust `--allowedTools` to match the tools your daily brief needs:
   - `Bash` -- for curl (Jira), gws (Gmail, Calendar, Tasks, Docs)
   - `Read`, `Write` -- for reading context files and saving output
   - MCP tools -- add any MCP server tools your brief uses (Slack, GitHub, etc.)

4. **Keyring access** -- if your CLI tools use the system keyring (e.g., `gws` with
   OAuth), cron won't have access to the desktop session. Uncomment the `DBUS` and
   `XDG_RUNTIME_DIR` export lines in the script.

5. Make it executable:
   ```bash
   chmod +x scripts/daily-brief-cron.sh
   ```

### 3. Choose your schedule

The brief takes roughly 10-15 minutes to generate (varies by number of data sources
and API response times). Start the cron job 15 minutes before you want the email
to arrive.

| Want email by | Cron time (UTC) | Cron time (EDT) | Cron entry |
|---------------|-----------------|-----------------|------------|
| 7:00 AM EDT | 10:45 UTC | 6:45 AM | `45 10 * * 1-5` |
| 8:00 AM EDT | 11:45 UTC | 7:45 AM | `45 11 * * 1-5` |
| 7:00 AM PDT | 13:45 UTC | 6:45 AM | `45 13 * * 1-5` |

### 4. Install the cron job

```bash
crontab -e
```

Add the line (adjust time for your timezone):

```cron
45 10 * * 1-5 /path/to/cosy/scripts/daily-brief-cron.sh >> /path/to/cosy/logs/daily-brief-cron.log 2>&1
```

### 5. Test it

```bash
# Run the script manually
./scripts/daily-brief-cron.sh

# Check the output
cat briefs/daily/$(date +%Y-%m-%d).md

# Check pending updates
cat memory/pending-updates.md

# Check the session log
cat logs/daily-brief-$(date +%Y-%m-%d).log

# Check your email inbox
```

---

## Pending Context Updates

When running headlessly, the daily brief can't ask you to approve context updates
interactively. Instead, it appends proposed changes to `memory/pending-updates.md`.

When you start your next interactive CoSy session, CoSy checks this file and
walks you through approving or skipping each update. This keeps your context
files accurate without the cron job making unsupervised changes.

The pending updates file accumulates entries across days. Each entry is dated
and labeled with its source (Daily Brief, Vacation Poller, etc.).

---

## Files

| File | Purpose |
|------|---------|
| `scripts/daily-brief-cron.sh` | Cron wrapper script |
| `prompts/daily-brief.md` | The daily brief prompt (customize for your sources) |
| `memory/pending-updates.md` | Proposed context updates for review |
| `briefs/daily/` | Saved daily briefs |
| `logs/daily-brief-*.log` | Session logs (tool usage and outcome) |
| `logs/daily-brief-cron.log` | Cron execution log (start/stop timestamps) |

---

## Troubleshooting

**Brief not generated:**
Check the session log at `logs/daily-brief-YYYY-MM-DD.log`. Common issues:
- Auth failures (keyring not accessible -- uncomment the dbus exports)
- MCP server not available in headless mode
- Permission denied on a tool (add it to `--allowedTools`)

**Email not arriving:**
- Verify your email tool works from the command line first
- Check the session log for email-related errors
- Make sure the daily brief prompt includes email instructions

**Brief arrives late:**
- Check the session log for total duration
- Start the cron earlier to compensate
- Reduce the number of data sources if runtime is consistently long

**Vacation mode conflict:**
The daily brief cron automatically skips when `work/vacation.md` Status is `active`.
The vacation poller handles context collection during PTO instead.
