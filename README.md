# CoSy Starter Kit

**CoSy** (Chief of Staff) is a personal AI assistant built on [Claude Code](https://docs.anthropic.com/en/docs/claude-code). It acts as your chief of staff, execution partner, and institutional memory.

CoSy is not a generic chatbot. It's a context-rich system tuned to *you* -- your role, your team, your goals, your rhythm. The more context you feed it, the more useful it becomes.

## What's in this kit

```
CLAUDE.md              <- The system prompt. Claude Code reads this automatically.
profile/               <- Your professional identity, goals, preferences
team/                  <- Your team roster, org context, individual context files
work/                  <- Priorities, roadmap, decisions, projects
memory/                <- Open threads, interaction log, changelog
relationships/         <- Stakeholder context and interaction history
prompts/               <- Reusable prompt templates (daily brief, status reports, etc.)
briefs/                <- Output directory for generated briefs and reports
qc/                    <- Quarterly review artifacts
setup/                 <- Getting started guide, integrations, update guide
scripts/               <- Utility scripts (includes vacation cron poller)
```

## Quick start

1. Clone or copy this directory into a private repo
2. Fill in `profile/identity.md`, `profile/goals.md`, and `profile/preferences.md`
3. Add your team to `team/roster.md`
4. Set your current priorities in `work/priorities.md`
5. Run `claude` in the repo directory
6. Say: `CoSy, load my profile and give me a brief on what I should focus on today.`

See `setup/getting-started.md` for the full walkthrough. For PTO automation,
see `setup/vacation-mode.md`.
## Your first 30 days

CoSy gets more useful the more context she has. Don't try to fill everything at once —
build the habit in layers. Here's a realistic ramp:

### Week 1 — Foundation
*Goal: Get CoSy running and prove value on the simplest use cases.*

**Setup (Day 1, ~30 min):**
- Fill in `profile/identity.md` — career arc, current role, skills
- Fill in `profile/goals.md` — what you're working toward this quarter
- Fill in `profile/preferences.md` — how you work, what drains you, what energizes you
- Add your team to `team/roster.md` — names, roles, focus areas
- Set this week's priorities in `work/priorities.md`

**Daily habit (Days 2–5):**
```
"CoSy, run my daily brief."
```
That's it. One prompt, every morning. Let CoSy surface priorities, open threads,
and team signals. Adjust the output format in `prompts/daily-brief.md` until it
feels right.

**End of week:**
```
"CoSy, draft my weekly status report for the week of [date]."
```
Review the draft. Note where CoSy had thin context — those gaps tell you what to
fill in next.

---

### Week 2 — Team intelligence
*Goal: CoSy knows your team well enough to answer "what is X working on?"*

- Create a context file for each direct report using `team/context/_template.md`
- After every 1:1, spend 2 minutes updating that person's file:
  ```
  "CoSy, update [name]'s context file. Here's what we covered: [notes]"
  ```
- Try the team pulse prompt:
  ```
  "CoSy, give me a team pulse for this week."
  ```

---

### Week 3 — Close the loop daily
*Goal: CoSy captures what happened, not just what's planned.*

- Add the EOD debrief to your end-of-day routine:
  ```
  "CoSy, run my EOD debrief."
  ```
  This compares what you planned (morning brief) against what actually happened,
  updates open threads, and sets up tomorrow's top 3.

- Start logging significant interactions in `memory/interactions.md`. CoSy can do
  this for you after the EOD debrief.

---

### Week 4 — Priorities and roadmap
*Goal: CoSy understands the work deeply enough to flag risk.*

- Fill in `work/roadmap.md` with your team's current quarter commitments
- Run a roadmap review:
  ```
  "CoSy, how is the roadmap looking? Anything at risk?"
  ```
- Try task prioritization with a real task list:
  ```
  "CoSy, here are my open tasks: [list]. Rank them by leverage."
  ```

---

### Month 2 — Relationships and signals
*Goal: CoSy tracks the people and information landscape around you.*

- Add key stakeholders to `relationships/stakeholders.md` and create context files
  for the ones that matter most
- Run a relationship check:
  ```
  "CoSy, who haven't I connected with recently that I should?"
  ```
- Try the signal scan:
  ```
  "CoSy, run a signal scan. What's worth my attention this week?"
  ```
- Start your reading list in `memory/tabs/reading-list.md` — drop links when you
  don't have time to read something now

---

### End of quarter — Review
*Goal: CoSy helps you reflect and prepare.*

- Draft your quarterly self-review:
  ```
  "CoSy, draft my quarterly review for Q[#] [YYYY]."
  ```
- If you manage people, review their submissions:
  ```
  "CoSy, review [Name]'s quarterly review for Q[#] [YYYY]."
  ```

---

### The compound effect

CoSy's value isn't in any single prompt — it's in accumulated context.
A daily brief on Day 1 is useful. A daily brief on Day 60, backed by two months
of team context, interaction history, and open threads, is a different tool entirely.

**The one habit that matters most:** update context files after significant moments.
Two minutes after a 1:1. One minute after a key decision. That's the investment
that makes everything else work.

---

## Your first 30 days

CoSy gets more useful the more context she has. Don't try to fill everything at once —
build the habit in layers. Here's a realistic ramp:

### Week 1 — Foundation
*Goal: Get CoSy running and prove value on the simplest use cases.*

**Setup (Day 1, ~30 min):**
- Fill in `profile/identity.md` — career arc, current role, skills
- Fill in `profile/goals.md` — what you're working toward this quarter
- Fill in `profile/preferences.md` — how you work, what drains you, what energizes you
- Add your team to `team/roster.md` — names, roles, focus areas
- Set this week's priorities in `work/priorities.md`

**Daily habit (Days 2–5):**
```
"CoSy, run my daily brief."
```
That's it. One prompt, every morning. Let CoSy surface priorities, open threads,
and team signals. Adjust the output format in `prompts/daily-brief.md` until it
feels right.

**End of week:**
```
"CoSy, draft my weekly status report for the week of [date]."
```
Review the draft. Note where CoSy had thin context — those gaps tell you what to
fill in next.

---

### Week 2 — Team intelligence
*Goal: CoSy knows your team well enough to answer "what is X working on?"*

- Create a context file for each direct report using `team/context/_template.md`
- After every 1:1, spend 2 minutes updating that person's file:
  ```
  "CoSy, update [name]'s context file. Here's what we covered: [notes]"
  ```
- Try the team pulse prompt:
  ```
  "CoSy, give me a team pulse for this week."
  ```

---

### Week 3 — Close the loop daily
*Goal: CoSy captures what happened, not just what's planned.*

- Add the EOD debrief to your end-of-day routine:
  ```
  "CoSy, run my EOD debrief."
  ```
  This compares what you planned (morning brief) against what actually happened,
  updates open threads, and sets up tomorrow's top 3.

- Start logging significant interactions in `memory/interactions.md`. CoSy can do
  this for you after the EOD debrief.

---

### Week 4 — Priorities and roadmap
*Goal: CoSy understands the work deeply enough to flag risk.*

- Fill in `work/roadmap.md` with your team's current quarter commitments
- Run a roadmap review:
  ```
  "CoSy, how is the roadmap looking? Anything at risk?"
  ```
- Try task prioritization with a real task list:
  ```
  "CoSy, here are my open tasks: [list]. Rank them by leverage."
  ```

---

### Month 2 — Relationships and signals
*Goal: CoSy tracks the people and information landscape around you.*

- Add key stakeholders to `relationships/stakeholders.md` and create context files
  for the ones that matter most
- Run a relationship check:
  ```
  "CoSy, who haven't I connected with recently that I should?"
  ```
- Try the signal scan:
  ```
  "CoSy, run a signal scan. What's worth my attention this week?"
  ```
- Start your reading list in `memory/tabs/reading-list.md` — drop links when you
  don't have time to read something now

---

### End of quarter — Review
*Goal: CoSy helps you reflect and prepare.*

- Draft your quarterly self-review:
  ```
  "CoSy, draft my quarterly review for Q[#] [YYYY]."
  ```
- If you manage people, review their submissions:
  ```
  "CoSy, review [Name]'s quarterly review for Q[#] [YYYY]."
  ```

---

### The compound effect

CoSy's value isn't in any single prompt — it's in accumulated context.
A daily brief on Day 1 is useful. A daily brief on Day 60, backed by two months
of team context, interaction history, and open threads, is a different tool entirely.

**The one habit that matters most:** update context files after significant moments.
Two minutes after a 1:1. One minute after a key decision. That's the investment
that makes everything else work.

---

## Design principles

1. **Context before answers** -- every output is grounded in your actual situation
2. **Proactive, not passive** -- surfaces what you didn't think to ask
3. **Output-first** -- produces artifacts (briefs, drafts, plans), not just analysis
4. **Your voice** -- drafts sound like you, not like an AI
5. **Memory is sacred** -- tracks what happened, updates files, doesn't let context decay
6. **Earn trust in reps** -- start with daily briefs and task prioritization; expand scope as confidence builds

## Customization

This kit is a starting point. Adapt everything to your role, tools, and workflow:

- **Prompts** are generic templates -- add your specific data sources, channels, and tools
- **Integrations** depend on what you have access to (Slack, Jira, GitHub, Google Workspace, etc.)
- **The CLAUDE.md** is the heart of the system -- tune the persona, capabilities, and operating principles to match how you work
- **Templates** in `team/context/`, `relationships/context/`, and `work/decisions/` define the structure for your knowledge base

## Requirements

- [Claude Code](https://docs.anthropic.com/en/docs/claude-code) installed
- Git
- A private repository (this contains personal and team information)
