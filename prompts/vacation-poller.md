# Prompt: Vacation Poller

Run this daily while the user is on PTO. Produces a lightweight summary of
high-signal activity -- no action required, just context preservation.

This prompt is designed to run headlessly via `scripts/vacation-poller.sh`.

---

## Prompt

```
CoSy, run the vacation poller for [today's date].
```

---

## Context Layer

### Date Verification (mandatory first step)

Run `date +"%A, %B %-d, %Y"` to get the exact day of the week from the system clock.

### Load Context

Load these files to filter signals by relevance:

- `work/priorities.md` -- what mattered before PTO
- `memory/open-threads.md` -- what was unresolved when the user left
- `team/roster.md` -- team members for attribution
- `work/vacation.md` -- PTO dates and delegate info

---

## Data Collection

Focus on high-signal sources only. Skip low-signal sources (Docs, GitHub, Tasks)
that produce noise without the user present to act on them.

Customize the sources below to match your integrations (see `setup/integrations.md`).

### 1. Issue Tracker (Jira, Linear, GitHub Issues)

Pull:
- Blocker and Critical issues in the current sprint
- Issues that transitioned to Blocked in the last 24 hours
- Issues assigned to the user that others may be waiting on

Example (Jira via curl):
```bash
source ~/.config/jira-report.conf

# Blockers and Criticals in current sprint
curl -s -G -u "${JIRA_EMAIL}:${JIRA_API_TOKEN}" \
  "https://YOUR_INSTANCE.atlassian.net/rest/api/3/search/jql" \
  --data-urlencode "jql=project = YOUR_PROJECT AND sprint in openSprints() AND (priority = Blocker OR priority = Critical OR status = Blocked) ORDER BY priority DESC" \
  --data-urlencode "maxResults=20" \
  --data-urlencode "fields=summary,status,priority,assignee,issuetype,updated" | jq .

# Newly blocked items
curl -s -G -u "${JIRA_EMAIL}:${JIRA_API_TOKEN}" \
  "https://YOUR_INSTANCE.atlassian.net/rest/api/3/search/jql" \
  --data-urlencode "jql=project = YOUR_PROJECT AND sprint in openSprints() AND status changed to Blocked AFTER -1d ORDER BY priority DESC" \
  --data-urlencode "maxResults=10" \
  --data-urlencode "fields=summary,status,priority,assignee" | jq .
```

Adapt the JQL, project key, and component filters to your team.

### 2. Team Chat (Slack, Teams)

Scan channels where decisions happen or escalations surface. Replace channel names
with your own.

**Manager & leadership channels:**
```
in:#your-manager-channel after:YESTERDAY_DATE
in:#your-skip-level-channel after:YESTERDAY_DATE
```

**Team-wide channels:**
```
in:#your-team-channel after:YESTERDAY_DATE
```

**Direct mentions:**
```
@your-handle after:YESTERDAY_DATE
```

**What to surface:**
- Decisions being discussed or made
- Escalation threads, blockers
- Direct mentions or questions directed at the user

**What to ignore:**
- Bot messages, automated notifications
- Routine standup posts without escalation signals

### 3. Email

Pull unread messages from key people, filtering out automation and newsletters.

Example (Gmail via gws CLI):
```bash
gws gmail users messages list \
  --params '{"userId": "me", "q": "is:unread newer_than:1d -category:promotions -category:social -category:updates -from:noreply", "maxResults": 15}'
```

**What to surface:**
- Emails from direct reports, manager, peer managers, senior leadership
- HR/people-cycle announcements
- Anything flagged urgent or requesting a response

---

## Output Format

Keep it tight. This is a daily log entry, not a full briefing.

```
# Vacation Summary -- [Weekday, Month Day]

_Day [N] of PTO ([start_date] to [end_date])_

## Escalations & Blockers
Items requiring attention or that the user should know about immediately.
- [Priority] [ISSUE-KEY](link) -- summary -- assignee -- status
...
(or "None today")

## Decisions & Discussions
Decisions being made or discussed in manager/team channels.
- [Channel/Source] Summary of decision or discussion [link]
...
(or "Nothing significant")

## Team Activity
Notable movement from the team -- not routine, just signal.
- What happened -- who -- context [link]
...
(or "Quiet day")

## Direct Mentions & Requests
Things directed at the user specifically.
- [Source] Who asked what [link]
...
(or "No direct requests")

## Email Highlights
Key emails that arrived today.
- From: [sender] -- Subject -- [action needed / FYI]
...
(or "Nothing notable")

## Open Thread Connections
Items from memory/open-threads.md that connect to today's signals.
- Thread: [description] -- what changed [link]
...
(or "No connections")
```

---

## Synthesis Instructions

1. **Cross-reference against open threads** -- if a blocker or discussion connects
   to an item in `memory/open-threads.md`, note the connection explicitly.

2. **Weight by role impact** -- a message from the user's manager outranks routine
   team chatter. A blocked direct report outranks a routine sprint update.

3. **Flag delegate-relevant items** -- if `work/vacation.md` has a delegate listed,
   note items that should be routed to them.

4. **No action recommendations** -- this is a log, not a decision brief. The user
   will review on return. Just capture what happened.

5. **Always include links** -- every issue, thread, and email reference must be
   clickable.

6. **Keep it short** -- aim for a 60-second read. Skip anything that's just noise.

---

## Error Handling

- If an integration is unavailable or auth fails, note it and continue with
  remaining sources.
- Never fabricate data -- if a source is down, skip it and note why.

---

## Output

Save to:

```
briefs/vacation/YYYY-MM-DD.md
```

Create the directory if it doesn't exist.

---

## Tone

Even more concise than the daily brief. This is a record, not a conversation.
No filler. No analysis. Just signal.
