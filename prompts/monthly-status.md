# Prompt: Monthly Status Report

---

## Prompt

```
CoSy, draft my monthly status report for [Month Year].

Pull from:
- briefs/weekly/ -> all weekly reports from this month
- work/roadmap.md -> progress against committed deliverables
- work/priorities.md -> quarterly priority progress
- memory/changelog.md -> significant context changes this month
- team/roster.md + team/context/ -> notable team moments

Write in my voice. Audience: [specify -- manager, leadership, skip-level].
This is a narrative document, not a bullet dump.

Structure:

## [Month Year] -- Monthly Status

**The Month in One Paragraph**
A crisp executive summary. Lead with business impact and strategic
outcomes -- not a list of things that happened. This paragraph should
answer: "What changed for the business because of this team's work?"

**Progress Against Quarterly Priorities**
For each priority: where we started the month, where we ended, what
changed.

**Team**
Significant contributions, growth moments, or situations worth
highlighting. Keep it positive and specific -- this is a leadership
visibility document.

**Challenges & How We Addressed Them**
What got hard, how the team responded. Shows resilience, not just wins.

**Risks Heading Into Next Month**
1-3 things to watch. Be honest. Include what you need from leadership.

**Focus for Next Month**
Top priorities heading into [next month].
```

---

## Save Output

Save to: `briefs/monthly/YYYY-MM.md`
