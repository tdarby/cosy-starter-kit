# Vacation Mode

_Keep CoSy's context fresh while you're on PTO._

---

## What It Does

When you go on PTO, your context decays fast: open threads go stale, priorities
shift, blockers land. Vacation mode runs a lightweight poller while you're away
and generates a synthesized return brief when you come back.

**While you're out:**
- A cron job runs daily (weekdays), invoking Claude Code headlessly
- It polls high-signal sources: issue tracker, team chat, email
- Each day's results are saved to `briefs/vacation/YYYY-MM-DD.md`

**When you return:**
- CoSy detects that PTO ended and offers to generate a return brief
- The return brief synthesizes all daily summaries into a single prioritized view
- It proposes context file updates (open-threads, interactions) for your approval

---

## Setup

### 1. Customize the vacation poller prompt

Edit `prompts/vacation-poller.md` to match your integrations:

- **Issue tracker** -- replace the example Jira queries with your project, instance,
  and component filters. If you use Linear or GitHub Issues, swap the curl commands
  for your tool's CLI or API.
- **Chat channels** -- replace the example Slack channel names with your manager
  channel, team channel, and any release/project channels worth monitoring.
- **Email** -- adjust the Gmail query or replace with your email tool's CLI.

### 2. Configure the cron script

Edit `scripts/vacation-poller.sh`:

1. Set `COSY_DIR` to the absolute path of your CoSy repo
2. Adjust `--allowedTools` to match the tools your vacation poller needs:
   - If you use MCP Slack: include `mcp__slack__search_messages`, `mcp__slack__get_channel_history`
   - If you use other MCP tools: add them to the list
   - `Bash`, `Read`, and `Write` are needed for Jira/email queries and saving output

3. Make it executable:
   ```bash
   chmod +x scripts/vacation-poller.sh
   ```

### 3. Install the cron job

```bash
crontab -e
```

Add this line (adjust the hour for your timezone):

```cron
7 13 * * 1-5 /path/to/cosy/scripts/vacation-poller.sh >> /path/to/cosy/logs/vacation-poller.log 2>&1
```

**Timezone note:** Cron uses the system timezone (usually UTC). The example above
runs at 13:07 UTC = 9:07 AM EDT. Adjust the hour to match your morning.

The script checks `work/vacation.md` on every run and exits immediately if PTO
is not active. It's safe to leave the cron job installed permanently.

### 4. Test it

```bash
# 1. Set vacation mode to active with today's date
#    Edit work/vacation.md: Status = active, dates = today

# 2. Run the script manually
./scripts/vacation-poller.sh

# 3. Check the output
cat briefs/vacation/$(date +%Y-%m-%d).md

# 4. Reset vacation mode to inactive
#    Edit work/vacation.md: Status = inactive
```

---

## How to Use

### Going on PTO

Tell CoSy:
```
I'm going on PTO from May 15 to May 22.
```

CoSy will:
1. Update `work/vacation.md` with the dates and set Status to `active`
2. Confirm the setup and remind you about the cron job

### Coming back

Tell CoSy:
```
I'm back.
```

CoSy will:
1. Offer to generate your return brief from the daily vacation summaries
2. Present proposed context file updates for your approval
3. Set `work/vacation.md` Status to `inactive`
4. Suggest running a regular daily brief for today's fresh signals

---

## Files

| File | Purpose |
|------|---------|
| `work/vacation.md` | PTO config -- status, dates, delegate |
| `prompts/vacation-poller.md` | Daily vacation summary prompt (runs headlessly) |
| `prompts/return-brief.md` | Return synthesis prompt (runs in-session) |
| `scripts/vacation-poller.sh` | Cron wrapper script |
| `briefs/vacation/` | Output directory for daily summaries and return briefs |
| `logs/vacation-poller.log` | Cron execution log |

---

## Customization

**Sources:** The default poller covers three source types (issue tracker, chat,
email). Add or remove sources in `prompts/vacation-poller.md` based on what's
useful for your role. Some managers may want GitHub PR activity; others may want
calendar changes or doc edits.

**Frequency:** The cron runs weekdays only. If your work involves weekend activity,
change `1-5` to `*` in the crontab entry.

**Delegate routing:** If you set a delegate in `work/vacation.md`, the poller will
flag items that should be routed to them. This is informational only -- it doesn't
send anything automatically.

**Return brief depth:** The return brief aims for a Top 5 prioritized list. If
you were out for more than a week, you may want to increase this or add
section-specific detail. Edit `prompts/return-brief.md` to adjust.
