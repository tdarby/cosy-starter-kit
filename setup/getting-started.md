# Getting Started with CoSy

---

## Prerequisites

- [Claude Code installed](https://docs.anthropic.com/en/docs/claude-code)
- Git
- A private GitHub (or GitLab) repo

---

## Setup

```bash
# 1. Clone your repo
git clone git@github.com:[your-username]/cosy.git
cd cosy

# 2. Start a CoSy session
claude

# That's it. Claude Code reads CLAUDE.md automatically.
```

---

## Your First Session

Once you're in Claude Code, start with:

```
CoSy, load my profile and give me a brief on what I should focus on today.
```

CoSy will read your context files and respond as your Chief of Staff.

---

## Common Session Starters

```bash
# Daily brief
"CoSy, run my daily brief"

# Before a 1:1
"CoSy, I have a 1:1 with [name] in 30 minutes. What should I cover?"

# After a 1:1
"CoSy, update [name]'s context file. Here's what we covered: [notes]"

# Task triage
"CoSy, here are my open tasks: [list]. What should I focus on?"

# Weekly status
"CoSy, draft my weekly status report for the week of [date]"

# Person lookup
"CoSy, what is [name] working on right now?"

# Roadmap check
"CoSy, how is the roadmap looking? Anything at risk?"
```

---

## Keeping Claude Code Focused on CoSy

Claude Code will read `CLAUDE.md` automatically. If CoSy ever feels off-context, say:

```
Re-read CLAUDE.md and all files in profile/ and work/ before continuing.
```

---

## Pro Tips

- **Update after 1:1s** -- 2 minutes of context capture after a 1:1 is worth hours later
- **Keep `open-threads.md` honest** -- this is CoSy's most time-sensitive file
- **Run a weekly brief before your manager 1:1** -- CoSy will surface what you'd otherwise forget to mention
- **Commit regularly** -- git history is CoSy's long-term memory
