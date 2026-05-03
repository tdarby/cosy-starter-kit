# Quarterly Reviews

Your quarterly review artifacts and history.

## Process

The quarterly review ensures regular conversations between you and your manager
about performance, development, and career trajectory.

**Cadence:** Once per quarter.

### Suggested Questions

1. What accomplishments are you most proud of? Reflect not only on WHAT you've
   accomplished but also on HOW you've accomplished it.
2. What are your top priorities for next quarter?
3. What feedback have you received recently?
4. What are the key takeaways from that feedback, including top strengths and
   opportunities for development?
5. How do you see yourself continuing to make an impact? What are your career
   aspirations, both short term (1-2 years) and long term (3-5 years)?
6. What support do you need from your manager to be successful?

Adapt these questions to match your company's review process.

## History

| Quarter | File | Notes |
|---------|------|-------|
| [Q# YYYY] | [link](history/YYYY-Q#.md) | [Context] |

## Your Two QC Roles

### 1. Author -- Write your own review
**Prompt:** `prompts/quarterly-review.md`
**Trigger:** `CoSy, draft my quarterly review for Q# YYYY.`
**Output:** `qc/history/YYYY-Q#.md`

### 2. Reviewer -- Evaluate direct reports' reviews
**Prompt:** `prompts/quarterly-review-manager.md`
**Trigger:** `CoSy, review [Name]'s quarterly review for Q# YYYY.`
**Output:** `qc/reviews/YYYY-Q#-[firstname].md`

## Sources for Review Generation

CoSy pulls from:
- `profile/identity.md` and `profile/goals.md` -- career context and aspirations
- `work/priorities.md` -- quarter priorities
- `work/roadmap.md` -- team roadmap
- `team/roster.md` -- team composition
- `team/context/[name].md` -- individual context (for manager reviews)
- `briefs/` -- daily and weekly briefs for accomplishment evidence
- `qc/history/` -- prior reviews for voice, arc, and continuity
- Issue tracker, code platform, chat -- live data for evidence
