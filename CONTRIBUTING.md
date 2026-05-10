# Contributing to CoSy Starter Kit

Thanks for your interest in contributing! This project is a template for building a personal Chief of Staff system with Claude Code. Contributions that improve the framework, fix bugs, or add useful prompts are welcome.

## What's in scope

- New prompts in `prompts/` that solve real workflow problems
- Improvements to existing prompts (clarity, reliability, edge cases)
- Setup and onboarding improvements
- Documentation fixes and clarifications
- Bug fixes in scripts

## What's out of scope

- Changes that are specific to one person's workflow rather than generally useful
- Adding dependencies beyond `curl`, `jq`, and `python3`
- Features that require paid services or proprietary tools (the starter kit should work with Claude Code alone)

## How to contribute

1. **Fork the repo** and create a branch from `main`.
2. **Make your changes.** Keep commits focused and messages clear.
3. **Test your changes.** If you're adding or modifying a prompt, run it through Claude Code and confirm it behaves as expected.
4. **Open a pull request** against `main`. Fill out the PR template and explain what your change does and why.

## Pull request expectations

- One concern per PR. Don't bundle unrelated changes.
- Describe the problem you're solving, not just the code you changed.
- If adding a new prompt, include a brief example of the output it produces.
- Keep the existing style: direct, minimal, no filler language.

## Style notes

The project follows specific writing conventions (see `CLAUDE.md` for the full list). The short version:

- No em dashes
- No filler phrases ("It's worth noting", "This ensures that")
- No corporate-speak ("leverage", "synergy", "circle back")
- Prefer sentences over bullets when the content reads naturally as prose

## Questions?

Open a Discussion if you're unsure whether something is in scope before putting in the work.
