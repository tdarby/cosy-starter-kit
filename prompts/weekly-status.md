# Prompt: Weekly Status Report

---

## Prompt

```
CoSy, draft my weekly status report for the week of [date].

Pull from:
- briefs/daily/ -> what happened each day this week
- work/priorities.md -> what we were focused on
- work/roadmap.md -> progress against commitments
- memory/open-threads.md -> anything newly resolved or newly opened
- team/roster.md -> notable team activity

Write it in my voice -- direct, specific, no corporate filler.
Audience: [manager / leadership / team -- specify].

Structure:

## Week of [Date] -- Status Report

**Impact This Week**
Lead with outcomes, not activities. What moved the business forward?
What risk was reduced? What decision was made that sets direction?
2-3 sentences max.

**Progress Against Priorities**
For each quarterly priority: one-line status update. Use text labels
(GREEN / YELLOW / RED / ON HOLD / DONE), not emoji.

**Metrics**
2-3 quantitative data points that anchor the narrative. Pull from your
issue tracker and code platform for the reporting period:
- Blocker/Critical count: [current] (vs. [last week]) -- trend direction
- Sprint completion rate: [X]% of committed points delivered
- Notable: [one other relevant number]

Keep to 3 lines max. These support the narrative, not replace it.

**Team**
Notable team activity, contributions, or situations worth surfacing.

**Blockers & Risks**
Anything that needs attention or escalation. Include what you're
asking leadership to do (not just informing them).

**Next Week**
Top 3 things we're focused on next week.
```

---

## Save Output

Save to: `briefs/weekly/YYYY-WNN.md`
