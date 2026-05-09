# Prompt: Pressure Test

Part of the **Org Decision Toolkit** (1 of 4).

Use this before committing to a significant decision. The goal is to find the
weak points before they find you. Not every decision needs this; save it for
ones where the cost of being wrong is high, where you're feeling confident
quickly (that's often when you're missing something), or where multiple
stakeholders will be affected.

---

## When to Use

- You're about to propose something to leadership (Jen, Sherard, Jay)
- A decision affects team structure, headcount, process, or cross-team boundaries
- You're resolving a contentious technical or organizational disagreement
- The stakes are high enough that reversing course later would be expensive
- You notice yourself moving fast toward an answer without resistance

**Not needed for:** routine prioritization (use Eisenhower), tactical sprint
decisions, or choices with easy rollback.

---

## How to Invoke

Say any of:
- "pressure test this"
- "stress test this decision"
- "poke holes in this"
- "run the pressure test on [decision]"

CoSy will walk through the six lenses below. If Tramaine provides the decision
framing, CoSy applies the lenses. If she asks CoSy to generate the framing
too, CoSy drafts it and then pressure tests its own draft.

---

## The Six Lenses

Work through each one. Skip a lens only if it genuinely does not apply; note
why you're skipping it.

### 1. What problem does this actually solve?

State the problem in one sentence. Then ask:
- Is this the root problem, or a symptom?
- Would someone outside your context describe the problem the same way?
- What evidence do you have that this problem is real and current (not assumed
  or stale)?

Red flag: if you can't state the problem without referencing the solution,
the framing may be backwards.

### 2. What are you optimizing for, and what are you trading away?

Every decision optimizes for something at the expense of something else.
Name both sides explicitly.

- What does this decision make easier or better?
- What does it make harder, slower, or more expensive?
- Are you trading short-term relief for long-term cost (or vice versa)?
- Who bears the cost of the tradeoff? Is it the same person who gets the
  benefit?

Red flag: if you can only articulate the upside, you haven't finished thinking.

### 3. What has to be true for this to work?

List the assumptions the decision depends on. For each one:
- Is this assumption verified, or are you hoping it's true?
- What happens if this assumption breaks?
- Which assumption, if wrong, would make you choose differently?

This is the most important lens. Decisions fail on hidden assumptions
more than bad logic.

### 4. What does this look like in 90 days?

Project forward. If this decision plays out as planned:
- What's different in 90 days? Be concrete.
- What new problems does it create?
- Will you still be defending or explaining this decision, or will it be
  settled?
- If it hasn't worked by then, what would you see?

Red flag: if you can't describe what success looks like in 90 days, the
decision may be premature or the scope unclear.

### 5. Who disagrees, and are they wrong?

- Who would push back on this if they were in the room?
- What's the strongest version of their argument (steelman, not strawman)?
- Are they wrong on the facts, or do they have different priorities?
- Have you actually heard their perspective, or are you guessing?

Red flag: if no one would disagree, either the decision is obvious (and
doesn't need a pressure test) or you're not talking to the right people.

### 6. What's the reversal cost?

- If this turns out to be the wrong call, how hard is it to undo?
- Is the reversal cost technical, political, or both?
- What's the blast radius if you need to reverse? (One team? Multiple teams?
  Customers? Leadership?)
- Does the reversal cost change if you wait 2 weeks? 90 days?

Low reversal cost = decide faster, run the experiment. High reversal cost =
spend more time on lenses 1-5 before committing.

---

## Output Format

CoSy produces the pressure test as a structured artifact:

```
# Pressure Test: [Decision Title]

_Date: YYYY-MM-DD_
_Decision owner: [Name]_

## The Decision
[One paragraph: what's being proposed and why]

## Pressure Test Results

### Problem (Lens 1)
[Root problem statement + evidence assessment]

### Tradeoffs (Lens 2)
| Optimizing for | Trading away |
|----------------|--------------|
| ... | ... |

### Assumptions (Lens 3)
| Assumption | Verified? | If wrong... |
|------------|-----------|-------------|
| ... | ... | ... |

### 90-Day Projection (Lens 4)
[Concrete description of what success and failure look like]

### Dissent (Lens 5)
[Strongest counterargument + assessment]

### Reversal Cost (Lens 6)
[Low / Medium / High] — [why]

## Verdict
[One of:]
- **Proceed** — pressure test passed; risks are understood and acceptable
- **Proceed with guardrails** — viable but needs [specific conditions]
- **Pause** — [lens N] surfaced an issue that needs resolution first
- **Rethink** — the framing or assumptions don't hold up; reframe before deciding
```

---

## After the Pressure Test

1. If the decision proceeds, capture it in `work/decisions/` using the
   decision log template. Reference the pressure test in the "Options
   Considered" section.
2. If the pressure test surfaced new assumptions to verify, add them to
   `memory/open-threads.md` as follow-up items.
3. If the decision is paused or rethought, note why and what needs to
   change before revisiting.

---

## Design Notes

This prompt is deliberately opinionated. The six lenses are ordered to build
on each other: problem framing first, then tradeoffs, then assumptions (the
core), then projection, then dissent, then reversal cost. Skipping to "who
disagrees" before you've clarified "what problem does this solve" produces
shallow objection-handling, not real stress testing.

The prompt works best when Tramaine brings a decision she's already leaning
toward. The point isn't to generate options (that's the Prioritization Frame's
job) or map stakeholder reactions (that's the Stakeholder Anticipator). The
point is to find the cracks in a decision you're about to commit to.
