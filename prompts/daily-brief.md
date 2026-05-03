# Prompt: Daily Brief

Run this each morning to generate CoSy's daily brief.

---

## Prompt

```
CoSy, generate my daily brief for [today's date].
```

Trigger phrases: "morning briefing", "catch me up", "what do I need to know today",
"what's on my plate", "what needs my attention", or any request for a synthesized
view across communication and work systems.

---

## Context Layer

### Date Verification (mandatory first step)

Before anything else, run `date +"%A, %B %-d, %Y"` to get the exact day of the week
from the system clock. Use this output verbatim in the briefing header and all
day-of-week references. Never infer the day of the week from the date alone -- always
compute it.

### Load Context

Before collecting external data, load CoSy's context files to ground synthesis:

- `work/priorities.md` -- what matters most right now
- `memory/open-threads.md` -- what's unresolved or needs follow-up
- `team/roster.md` -- team members and their focus areas
- `work/roadmap.md` -- anything due or at risk this week
- `profile/goals.md` -- quarterly goals for priority weighting

These files inform the **Prep for Today** section and help weight signals by
relevance to actual priorities -- not just recency or volume.

### Weekly Reprioritization Check

At session start (before running the daily brief), check whether a full Eisenhower
reprioritization is due. See `prompts/task-prioritization.md` for trigger logic.
If triggered, prompt the user before proceeding with the brief.

---

## Data Collection

Run all source pulls before synthesizing. Adapt the sources below to your
available integrations. Common sources include:

### Email
- Unread messages from the last 24 hours (filter out promotions, social, automated)
- Starred/flagged threads
- Threads needing a response from key people (direct reports, manager, peers)

### Calendar
- Full meeting schedule with times, titles, and attendee count
- Flag meetings where you're the organizer
- Flag 1:1s with direct reports or manager
- Identify back-to-back blocks with no breaks

### Task Lists
- Pull incomplete tasks from your task management system
- Auto-flag overdue items
- Cross-reference tasks against today's calendar

### Chat (Slack, Teams, etc.)
- Unanswered DMs from direct reports, peers, or leadership
- @mentions you haven't responded to
- Escalation threads, blockers in team channels
- Decisions being made in leadership channels

### Issue Tracker (Jira, GitHub Issues, Linear, etc.)
- Blocker/Critical issues on your team
- Issues assigned to you
- Sprint health signals

### Code (GitHub, GitLab, etc.)
- PRs waiting for your review
- PRs you authored with new reviews or comments
- Notable merges from the team

---

## Briefing Output Format

Always use this exact structure. Keep each section tight -- bullet points, not prose.
Scannable in under 3 minutes.

**Links are required on every item.** Every issue, PR, chat thread, and doc reference
must be a clickable link. An item without a link forces the user to go hunting.

```
# Daily Briefing -- [Weekday, Month Day]

## Needs Your Attention Now
[Source] Brief description -> what action is needed [link]
...
(max 5 items -- if more exist, note "X more items flagged" at the bottom)

## Today's Schedule
HH:MM - HH:MM  Meeting Title [organizer|attendee] (N attendees)
...
Flag: [back-to-back blocks, 1:1s with DRs, meetings you're driving]

## Situational Awareness
Things moving that don't need action yet but you should know about. [links]
...
(max 5 items)

## Sprint & Code Pulse
- Blockers/Criticals: [count] active ([linked list])
- PRs awaiting your review: [count] ([linked list])
- PRs you authored needing attention: [count] ([linked list])
- Notable merges: [linked list, 1-2 significant ones]
- Sprint momentum: [moving well | some stalling | needs attention]

## Tasks
**Urgent** (action required)
- Task title [due: date | no due date]
...

**Upcoming**
- Task title -- due today|tomorrow
...

**Other**
- Overdue or flagged items from lower-priority lists
...
(or "Nothing flagged" if all clear)

## Docs with Recent Activity
- [Doc Title](link) -- last edited by [Name], [timeago] ([edit/comment])
...

## Open Threads Watch
Items from memory/open-threads.md that connect to today's signals.
...
(or "No open thread connections today" if none)

## Prep for Today
2-3 sentences. What's the theme of the day? What decisions or conversations are
likely coming? What's the one thing worth protecting time for? Reference specific
meetings, priorities, and goals.
```

---

## Synthesis Instructions

After collecting raw data, apply judgment before writing the briefing:

1. **Cross-reference signals carefully** -- if a chat thread, an issue tracker blocker,
   and a calendar meeting are about the same topic, surface them together under one item.

   **Guard against misattribution:** verify connections through concrete evidence --
   matching issue keys, doc titles, or person names -- not topic-level similarity.

2. **Weight by role impact** -- a message from your manager or a VP outranks 10 issue
   tracker notifications. A blocked direct report outranks a doc edit on a low-priority
   project.

3. **Weight by priorities** -- cross-reference signals against `work/priorities.md`.
   Items that connect to a current top priority get elevated.

4. **Calendar-aware prioritization** -- if there's a 1:1 with a direct report and that
   person has a blocked issue, surface both together.

5. **Open thread connections** -- scan `memory/open-threads.md` for items that connect
   to today's signals.

6. **Always include links** -- every reference must be clickable.

7. **Bias self-check** -- before writing the final output, pause and ask:
   - **Anchoring:** Which source did I process first, and did it set the frame for
     everything else? Would the "Needs Your Attention Now" list look different if I'd
     started with a different source?
   - **Recency/volume:** Am I elevating something because it generated the most raw
     data (e.g., a noisy chat channel) rather than because it's the highest-impact
     signal?
   - **Confirmation:** Am I surfacing what I already know the user cares about while
     underweighting a signal that doesn't fit their usual pattern but still matters?
   - **Omission:** Scan each source's results one more time. Is there a signal from a
     later-processed source that deserves top-of-brief placement but got buried because
     an earlier source set the narrative?

   If the self-check surfaces a reordering, adjust before writing the output. If it
   doesn't change anything, move on -- don't manufacture false corrections.

8. **Write the Prep for Today section last** -- synthesize the full picture.

9. **If nothing is flagged in a section** -- write "Nothing flagged" rather than
   padding with low-signal items.

10. **Propose context updates** -- after writing the full briefing, review all signals
    for items that should update `memory/open-threads.md` or `memory/interactions.md`.
    List specific proposed changes. Do not apply changes without confirmation.

---

## Context Maintenance

```
## Context Maintenance

Proposed updates to context files based on today's signals:

**open-threads.md**
- [CLOSE] Thread description -- reason
- [UPDATE] Thread description -- new status
- [NEW] Thread description -- source
...
(or "No changes")

**interactions.md**
- [LOG] Person -- medium -- key outcome
...
(or "No new interactions to log")

Apply these updates? (yes / skip / edit)
```

---

## Tone & Voice

- Direct. Skip filler phrases like "It looks like..." or "Based on my review..."
- Assume the reader is smart and time-constrained
- Lead with what matters most, not what's easiest to find
- Flag uncertainty: "(unconfirmed)" or "(needs context)"
- Should sound like a trusted chief of staff, not a data dump

---

## Output

### Default: Local Markdown File

Save the briefing to:

```
briefs/daily/YYYY-MM-DD.md
```

Create the directory if it doesn't exist. Always display the full briefing in the
conversation so the user can read it immediately.

---

## Error Handling

- If a data source is unavailable: note "[Source]: unavailable" at the top and continue
- Never fabricate or infer data that wasn't returned by an API
- If credentials are missing, tell the user which tool needs authentication
