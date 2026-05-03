# Prompt: Task Prioritization (Eisenhower Matrix)

---

## Cadence

This prompt operates at two levels:

### Daily (Light) -- embedded in the daily brief
Every daily brief applies Eisenhower logic when rendering the Tasks section. Tasks
from your task management system and `memory/open-threads.md` are classified into
quadrants and surfaced accordingly.

### Weekly (Full Reorder) -- triggered automatically or on demand

**Automatic trigger:** At the start of any CoSy session, check:
1. Current day and time
2. Last full reprioritization date (stored in `work/priorities.md` header)

If **all three** conditions are true, prompt the user before proceeding:
- It is Monday morning (before noon) OR Friday afternoon (after noon)
- The last full reprioritization was **more than 6 days ago**
- The user has not already declined this session

> "It's been [N days] since your last full reprioritization (last done [date]).
> Want me to run a full Eisenhower reorder of your commitments now, or skip this week?"

If declined, note the date so it doesn't re-prompt in the same session.

**Manual trigger:** "reprioritize", "reorder my tasks", "run the Eisenhower matrix",
"what should I focus on"

---

## Full Reprioritization Prompt

```
CoSy, pull my open commitments from:
- memory/open-threads.md (My Commitments section)
- [Your task management system -- all lists/projects]

Deduplicate across sources. For each item, evaluate using the Eisenhower matrix
against my quarterly priorities and goals.

Cross-reference against:
- work/priorities.md -> quarterly priorities (the scoring anchor)
- profile/goals.md -> which items move my goals forward?
- memory/open-threads.md -> which items unblock or close open threads?
- Calendar (next 5 business days) -> which items have a meeting dependency?
```

---

## Eisenhower Matrix Definitions

### Q1: DO NOW -- Urgent + Important
Has a hard deadline within 5 business days, blocks someone, gates a priority,
or carries real consequences if delayed.
-> Do these first. No delegation. Max 5 items -- if more qualify, force-rank.

### Q2: SCHEDULE -- Important, Not Urgent
Moves priorities or goals forward but has no immediate deadline pressure.
-> Block time this week. Protect these from Q1/Q3 crowding.

### Q3: TIMEBOX -- Urgent, Not Important
Has a deadline or someone is waiting, but doesn't require you specifically
or doesn't connect to priorities.
-> Timebox to 15 min max, or delegate with a name.

### Q4: DEPRIORITIZE -- Neither Urgent nor Important
Doesn't connect to current priorities or goals. May have been relevant once.
-> Park on a backlog or remove. Note why it's deprioritized.

---

## Scoring Logic

For each item, assess two dimensions:

**Importance** (does it connect to quarterly priorities or goals?):
- Direct priority -> High
- Supports a priority (enables, unblocks) -> Medium
- Nice-to-have, no connection -> Low

**Urgency** (is there time pressure?):
- Hard deadline within 5 business days -> High
- Soft deadline or someone waiting -> Medium
- No deadline, no one waiting -> Low

| | Urgent (High) | Not Urgent (Low/Med) |
|---|---|---|
| **Important (High/Med)** | Q1: Do Now | Q2: Schedule |
| **Not Important (Low)** | Q3: Timebox | Q4: Deprioritize |

---

## Output Format

```
# Priority Reorder -- [Date]

## Q1: Do Now (Urgent + Important)
1. **Item** -- [due date/deadline]. [One-line rationale linking to priority].
2. ...
(max 5)

## Q2: Schedule (Important, Not Urgent)
6. **Item** -- [priority it supports]. [Suggested: block time for X].
7. ...

## Q3: Timebox (Urgent, Not Important)
- **Item** -- [who's waiting]. Timebox: 15 min. (or: delegate to [name])

## Q4: Deprioritize
- **Item** -- [why deprioritized]. -> Move to backlog / Remove.

---

## Changes Since Last Reorder
- [PROMOTED] Item -- moved from Schedule -> Do Now because [reason]
- [DEMOTED] Item -- moved from Do Now -> Schedule because [reason]
- [NEW] Item -- added since last reorder
- [CLOSED] Item -- completed or no longer relevant
```

---

## After the Reorder

1. Update `work/priorities.md` with the new Eisenhower-ordered sections
2. Update the `_Last updated` date in `work/priorities.md`
3. Flag any items that shifted quadrants since last reorder
4. Call out Q2 items at risk of neglect (sitting in Schedule for 2+ weeks)
5. Note any duplicates found across sources
