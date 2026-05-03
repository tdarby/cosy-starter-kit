# Prompt: EOD Debrief

Run this at the end of the day to capture what happened, what shifted, and what carries forward.

---

## Prompt

```
CoSy, run my EOD debrief.
```

Trigger phrases: "end of day", "eod debrief", "wrap up my day", "close out", "what happened today"

---

## Context Layer

Load these files before generating the debrief:

- `memory/open-threads.md` -- check for threads that moved or need updating
- `work/priorities.md` -- assess whether today moved the needle on top priorities
- The morning's daily brief (`briefs/daily/YYYY-MM-DD.md`) -- compare what was planned vs what actually happened

---

## Data Collection

Lightweight -- pull only what's needed to see what changed since the morning brief.

### 1. Tasks
Check all task lists for tasks completed today.

### 2. Calendar -- what actually happened
Pull today's events and compare against the morning brief's schedule to note
skipped, added, or rescheduled meetings.

### 3. Chat
Check for anything dropped during the day in key channels or DMs.

---

## Debrief Output Format

Keep it tight. This should take under 60 seconds to read.

```
# EOD Debrief -- [Weekday, Month Day]

## Decisions Made
- Decision or outcome -- context [link if applicable]
...
(or "None captured today")

## Threads That Moved
- Thread description -- what changed [link]
...
(or "No movement on open threads")

## New Items Captured
- Item -- source (chat, meeting, email) [link]
...
(or "Nothing new")

## Tomorrow's Top 3
1. Highest-leverage thing for tomorrow morning
2. Second priority
3. Third priority

## Updates to Log
- [ ] Update open-threads.md: [specific change]
- [ ] Update [other file]: [specific change]
...
(or "Nothing to update")
```

---

## Post-Debrief Actions

After generating the debrief:

1. **Apply all updates** listed in "Updates to Log" -- update `memory/open-threads.md` and any other files
2. **Update the interaction log** -- add any 1:1s, key meetings, or notable async conversations to `memory/interactions.md`
3. **Sync direct report context files** -- for each direct report, check if today's interactions should be reflected in their `team/context/[name].md` file
4. **Save the debrief** to `briefs/daily/YYYY-MM-DD-eod.md`

---

## Tone & Voice

Same as daily brief -- direct, no filler, scannable. This is a wrap-up, not a retrospective.
