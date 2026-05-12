# Context Audit

Run this audit on demand to catch stale files, aging threads, and items
that need attention. Trigger it any time you want a health check on your
context files.

---

## 1. Orient on time
Use the `currentDate` value from the system context. Do NOT run `date` in Bash.

## 2. Staleness sweep
One pass across all date-sensitive files. Scan `_Last updated` dates and
flag anything that needs attention:

| File/path | Staleness threshold | Extra trigger |
|---|---|---|
| `work/priorities.md` | 14 days | If Mon/Fri AND 6+ days stale, prompt for Eisenhower reorder (see `prompts/task-prioritization.md`) |
| `work/roadmap.md` | 14 days | Also flag committed deliverables due within 14 days with no recent update |
| `memory/open-threads.md` | 14 days | -- |
| `team/context/*` | 14 days per file | Flag any direct report whose most recent 1:1 note is 14+ days old |

## 3. Open thread scan
Read `memory/open-threads.md`. Flag:
- Any item in "My Commitments" that is past its target date
- Any item in "Waiting On" with no update in 7+ days
- Any thread that should probably be closed based on elapsed time

## 4. Relationship recency
Scan `relationships/context/` files. Flag anyone with no interaction
logged in 21+ days.

## 5. Roadmap pulse
Read `work/roadmap.md`. Flag any committed deliverable whose target date
is within 14 days and has no recent status update.

---

## Tool constraints

Use only built-in tools: **Read**, **Grep**, **Glob**. Do not use Bash.
Get today's date from `currentDate` in system context.

## Output format

Keep it tight. Only surface items that need attention. Group findings
under short headers (e.g., "Stale context," "Overdue threads"). If
nothing needs attention, say so in one line.
