# Prompt: Quarterly Self-Review

Draft your quarterly self-review for your manager conversation.

---

## Prompt

```
CoSy, draft my quarterly review for [Q# YYYY].
```

---

## Context Layer

Load these files before drafting:

**Core context:**
- `profile/identity.md` -- role, background, professional identity
- `profile/goals.md` -- career aspirations, active projects, success criteria
- `profile/preferences.md` -- voice, working style

**Quarter evidence:**
- `work/priorities.md` -- what the quarter's priorities were
- `work/roadmap.md` -- team roadmap and delivery commitments
- `team/roster.md` -- team composition, changes, reporting lines
- `memory/open-threads.md` -- things in flight

**Historical reviews:**
- `qc/history/` -- prior review responses for voice, arc, and continuity
- Read the most recent one first, then scan earlier ones for narrative threads

**Accomplishment evidence:**
- `briefs/daily/` -- daily briefs from the quarter (scan for themes)
- `briefs/weekly/` -- weekly status reports from the quarter
- Issue tracker: sprint completions, blocker resolutions, notable deliverables
- Code platform: significant merges, team activity
- Chat: recognition given/received, cross-team coordination moments

---

## Review Structure

```markdown
# Q[#] [YYYY] Quarterly Review

## What accomplishments are you most proud of?

[Opening sentence that frames the quarter's theme -- one line connecting it
to the arc from prior reviews.]

**[Category 1: e.g., Delivery]**
- Bullet accomplishments with specifics: what shipped, what was hard,
  what the impact was

**[Category 2: e.g., Process Improvement]**
- ...

**HOW I accomplished this:** [2-3 sentences on approach -- what was
different this quarter, what principles guided decisions]

## What are your top priorities for next quarter?

- Priority 1 -- brief description
- Priority 2 -- brief description
- ...

## What feedback have you received?

**From [Manager]:**
- [Specific feedback with context]
- **Takeaway:** [What it means and what changed]

**From team interactions:**
- [Recognition, peer feedback, signals]

**Key Development Areas Identified:**
- [Honest self-assessment]

## How do you see yourself continuing to make an impact?

**Short term (1-2 years):**
- [Pull from profile/goals.md, connect to quarter's evidence]

**Long term (3-5 years):**
- [Bigger ambitions, connect to demonstrated capabilities]

## What support do you need from your manager?

- [Specific, actionable requests]
```

---

## Drafting Instructions

1. **Read the prior review first.** Every review builds on the last. Show progression.
2. **Lead with evidence, not claims.** Every accomplishment should be traceable.
3. **Balance team and individual contributions.** Show what the team delivered AND
   how you drove, coordinated, or enabled it.
4. **Be honest about development areas.** Name what needs work and connect it to a plan.
5. **Voice:** Direct, specific, confident without being boastful. Not corporate-speak.
6. **Length:** Target 800-1200 words total.

---

## After Drafting

1. Present the draft for review
2. Flag any sections where evidence was thin or assumed
3. Ask if there are accomplishments, feedback, or aspirations to add or adjust

---

## Save Output

Save draft to: `qc/history/YYYY-Q#.md`
