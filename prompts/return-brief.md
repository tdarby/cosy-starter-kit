# Prompt: Return Brief

Run this on the user's first session back from PTO. Synthesizes the daily vacation
summaries into a single prioritized brief so they can get up to speed fast.

---

## Prompt

```
CoSy, I'm back. Generate my return brief.
```

Trigger phrases: "I'm back", "back from PTO", "return brief", "what did I miss",
"catch me up on PTO"

---

## Context Layer

### Date Verification

Run `date +"%A, %B %-d, %Y"` for today's date.

### Load Context

- `work/vacation.md` -- PTO dates (to scope the summary range)
- `memory/open-threads.md` -- state of threads when the user left
- `work/priorities.md` -- priorities before PTO (to assess what shifted)
- `team/roster.md` -- team attribution
- `profile/goals.md` -- for weighting signals against goals

### Load Vacation Summaries

Read all files in `briefs/vacation/` with dates falling between the start and end
dates in `work/vacation.md`. These are the daily snapshots from the vacation poller.

---

## Synthesis

This is not a concatenation of daily summaries. It's a synthesis -- deduplicate,
prioritize, and connect the dots across the full PTO period.

### Steps

1. **Aggregate all items** from vacation summaries into categories
2. **Deduplicate** -- the same issue or thread may appear across multiple days;
   show its current state and trajectory, not every daily mention
3. **Rank by urgency** -- Blockers > Decisions made > Open thread movement > New items > FYI
4. **Cross-reference against pre-PTO state:**
   - Which open threads moved, resolved, or escalated?
   - Which priorities shifted or got new blockers?
   - What's genuinely new that wasn't on the radar before PTO?
5. **Identify proposed context updates** -- what should change in open-threads.md,
   interactions.md, or priorities.md based on what happened

---

## Output Format

```
# Return Brief -- [Weekday, Month Day]

_Covering PTO from [start_date] to [end_date] ([N] business days)_

## Top 5: Needs Your Attention

Ranked by urgency. These are the things to act on today.

1. **[Title]** -- What happened, why it matters, what to do [links]
2. ...
3. ...
4. ...
5. ...

## Decisions Made While You Were Out

Decisions that landed without your input. Know them before your first meeting.

- [Date] Decision summary -- who decided, where [link]
...
(or "No significant decisions")

## Open Threads: What Moved

Items from memory/open-threads.md that changed during PTO.

| Thread | Pre-PTO Status | Current Status | Key Change |
|--------|---------------|----------------|------------|
| Description | Status before | Status now | What happened [link] |
...
(or "No movement on tracked threads")

## New Items That Landed

Things that weren't on your radar before PTO.

- [Priority] [Source] Description -- why it matters [link]
...
(or "Nothing new")

## Team Pulse

Quick snapshot of how the team operated while you were out.

- **Blockers handled:** [count] -- [brief summary of resolution]
- **Sprint health:** [on track / some slippage / needs attention]
- **Notable wins:** [any features shipped, issues resolved]
- **People signals:** [anyone flagged as blocked, overloaded, or needing support]

## Email & Chat Backlog

Items still waiting for your response.

- [Source] From [who] -- [subject/topic] -- [date received] [link]
...
(or "Inbox clear")

## Proposed Context Updates

Changes to apply to context files based on what happened during PTO.
Review and approve before CoSy applies them.

**open-threads.md**
- [CLOSE] Thread -- reason
- [UPDATE] Thread -- new status
- [NEW] Thread -- source
...

**interactions.md**
- [LOG] Person -- medium -- key outcome
...

**priorities.md**
- [SHIFT] Priority change -- reason
- [NEW] New priority -- source
...

(or "No changes needed")

Apply these updates? (yes / skip / edit)
```

---

## Post-Return Actions

After the user reviews the return brief:

1. **Apply approved context updates** to the relevant files
2. **Set `work/vacation.md` status to `inactive`** -- this prevents the cron poller
   from running
3. **Run a regular daily brief** for today -- the return brief covers the PTO period,
   but today's fresh signals need the standard daily brief treatment
4. **Archive vacation summaries** -- the daily files in `briefs/vacation/` are kept
   for reference but the return brief is the canonical summary

---

## Tone

Direct and prioritized. The user is coming back to a full inbox and a packed
calendar. Every word should earn its place. Lead with what matters most.
Don't rehash -- synthesize.

The Top 5 section should be actionable enough that they can start working
through it immediately, before even opening their chat or email.
