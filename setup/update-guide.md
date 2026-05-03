# CoSy Update Guide

_How to keep CoSy's context fresh -- the discipline that makes it useful._

---

## The Rule: Context In, Intelligence Out

CoSy is only as smart as its context files. Stale files = stale output.
The goal is low-friction updates that take 2-3 minutes, not 20.

---

## Update Triggers

| Trigger | What to Update |
|---------|---------------|
| After a 1:1 with a direct report | `team/context/[name].md` + `memory/open-threads.md` |
| After a stakeholder conversation | `relationships/context/[name].md` + `memory/interactions.md` |
| Priorities shift | `work/priorities.md` + `memory/changelog.md` |
| Roadmap changes | `work/roadmap.md` + `memory/changelog.md` |
| Significant decision made | New file in `work/decisions/` |
| You accomplished something notable | `profile/accomplishments.md` |
| Goals evolve | `profile/goals.md` + `memory/changelog.md` |
| End of week | Commit everything, check `memory/open-threads.md` |

---

## The 2-Minute 1:1 Capture

Right after a 1:1, say to CoSy:

```
CoSy, update [name]'s context file with these notes from our 1:1 today:
[paste your raw notes]

Also update open-threads.md with any new commitments.
```

CoSy will structure the update for you. Review and commit.

---

## Weekly Maintenance (5 minutes, end of week)

```
CoSy, let's do a weekly context refresh:
1. Review open-threads.md -- what can we close? What's overdue?
2. Update work/priorities.md for next week
3. Flag anything in the team context files that's gone stale
```

---

## Git Commit Rhythm

```bash
# After any context update
git add .
git commit -m "context: update [what changed] - [date]"
git push
```

Suggested commit message prefixes:
- `context:` -- updating knowledge files
- `brief:` -- saving a daily/weekly brief
- `prompt:` -- improving a prompt
- `memory:` -- updating threads, interactions, changelog
