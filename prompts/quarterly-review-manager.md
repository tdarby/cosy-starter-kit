# Prompt: Quarterly Review -- Manager Evaluation

Review a direct report's quarterly self-review and draft your manager evaluation.

---

## Prompt

```
CoSy, review [Name]'s quarterly review for [Q# YYYY].
```

Provide the review text inline, as a file path, or as a document link.

---

## Context Layer

Load before reviewing:

- `team/roster.md` -- role, team, reporting line
- `team/context/[name].md` -- individual context (if exists)
- `work/priorities.md` -- team priorities for the quarter
- `work/roadmap.md` -- delivery commitments

**Evidence sources (to validate claims):**
- Issue tracker: issues resolved by or assigned to the person
- Code platform: PRs authored/reviewed by the person
- Chat: recognition given to/about the person
- `briefs/daily/` and `briefs/weekly/` -- mentions of the person's work

---

## Review Process

### Step 1: Read and Assess

**Accomplishments:**
- Are claims supported by evidence?
- Is anything significant missing?
- Does the person describe HOW, not just WHAT?

**Priorities:**
- Do they align with team priorities?
- Any gaps?

**Development:**
- Is the self-assessment honest and specific?
- Are there development areas you've observed that aren't mentioned?

**Career:**
- Are aspirations realistic given current performance?

### Step 2: Draft Manager Evaluation

```markdown
# Manager Evaluation: [Name] -- Q[#] [YYYY]

## Accomplishments
**Rating:** [Aligned / Partially aligned / Not aligned] with priorities

**Response:**
[2-4 sentences. Acknowledge specific accomplishments. Note what stood out
and anything that could be stronger.]

## Priorities
**Rating:** [Correct, no changes needed / Need revision]

**Response:**
[1-3 sentences. Confirm alignment or suggest adjustments.]

## Development
**Response:**
[2-3 sentences. Respond to self-assessment. Add your observations.
Be specific about growth areas.]

## Career Growth
**Response:**
[2-3 sentences. Respond to aspirations honestly. Connect to what they
need to demonstrate.]

## Support
**Response:**
[1-2 sentences. Commit to specific actions or set expectations.]
```

---

## Drafting Instructions

1. **Validate before evaluating.** Cross-reference claims against evidence.
2. **Be specific.** Name the accomplishment, the behavior, or the gap.
3. **Be direct about development areas.** Don't soften gaps to the point of uselessness.
4. **Note patterns across quarters.** Flag recurring issues or clear growth.
5. **Voice:** Supportive, direct, invested in their growth.

---

## Save Output

Save draft to: `qc/reviews/YYYY-Q#-[firstname].md`
