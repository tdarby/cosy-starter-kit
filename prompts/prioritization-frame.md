# Prompt: Prioritization Frame

Part of the **Org Decision Toolkit** (4 of 4).

Use this when you're choosing between competing initiatives, resource
allocations, or strategic bets. Not tasks (that's the Eisenhower matrix).
Not whether a single decision is sound (that's the Pressure Test). This is
for when you have three good ideas and bandwidth for one, or five asks
coming at your team and you need to decide which two get real investment.

The Eisenhower matrix asks "what do I do today?" The Prioritization Frame
asks "where do I place my bets this quarter?"

---

## When to Use

- You're choosing between competing initiatives that all have legitimate
  claims on your team's time
- Leadership has added a new ask and something has to come off the plate
- You're preparing for a roadmap review, planning conversation, or
  resource negotiation with Jay/Jen
- You need to explain why you chose X over Y in a way that holds up to
  scrutiny
- Sprint or quarter boundaries where the portfolio needs rebalancing

**Not needed for:** daily/weekly task ordering (use Eisenhower), evaluating
a single decision (use Pressure Test), or understanding people dynamics
around a prioritization choice (use People Situation Thinker after this).

---

## How to Invoke

Say any of:
- "help me prioritize these"
- "which of these should I bet on"
- "run the prioritization frame"
- "I have [N] things competing for bandwidth"
- "something has to come off the plate"

CoSy will walk through the framework below. Tramaine provides the
candidates; CoSy applies the evaluation and produces a ranked
recommendation with explicit rationale.

---

## The Framework

### Step 1: Name the candidates

List every initiative competing for the same pool of bandwidth. Be honest
about what's actually on the table, including things you're doing out of
habit or obligation that haven't been examined recently.

For each candidate, state in one sentence: what is it, and what does
success look like?

### Step 2: Score on three dimensions

Evaluate each candidate on three dimensions. These are not equal; they're
weighted based on your current context.

#### Dimension 1: Strategic Alignment (weight: high)

Does this connect to a Q2 priority, a stated leadership directive, or a
goal in `profile/goals.md`?

| Score | Meaning |
|-------|---------|
| **Direct** | Explicitly named as a Q2 priority or leadership directive |
| **Enabling** | Not a priority itself, but unblocks or accelerates one |
| **Adjacent** | Related to a priority but not on the critical path |
| **Unconnected** | No current Q2 connection |

Pull from `work/priorities.md` (Q2 Priorities table) and `profile/goals.md`
(Active Projects table) for the scoring anchor. If it's not in either place,
it starts with a handicap.

#### Dimension 2: Leverage (weight: high)

How much does this multiply your impact relative to the effort invested?
Leverage is not the same as importance. Something can be important but
low-leverage (it matters, but doing it yourself doesn't change anything).
Something can seem minor but high-leverage (a 30-minute conversation that
unblocks three teams).

| Score | Meaning |
|-------|---------|
| **Multiplier** | Enables others to move faster, removes a bottleneck, creates a reusable asset |
| **Linear** | Effort in, proportional result out. Valuable but doesn't compound |
| **Diminishing** | Additional effort produces less and less return. May have already captured most of the value |
| **Negative** | Continuing to invest here actively prevents you from doing higher-value work |

Ask: if I do this, what else becomes possible that isn't possible today?
If the answer is "nothing else changes," it's linear at best.

#### Dimension 3: Cost of Delay (weight: moderate)

What happens if you don't do this now? Not "is it important" but
specifically what changes if you wait 2 weeks, 4 weeks, a quarter?

| Score | Meaning |
|-------|---------|
| **Irreversible** | Waiting closes a window permanently (headcount expires, deadline passes, relationship opportunity disappears) |
| **Degrading** | Gets harder or more expensive the longer you wait, but the option remains |
| **Stable** | Equally doable now or later. No penalty for waiting |
| **Improving** | Actually gets easier if you wait (more information coming, dependency resolving, someone else may pick it up) |

This dimension prevents two common mistakes: treating everything as urgent
(if nothing has a real cost of delay, you have more room than you think)
and ignoring genuine time sensitivity (some windows do close).

### Step 3: Check for dependencies and conflicts

Before ranking, map the interactions between candidates:

- **Does A enable B?** If so, A might need to go first regardless of
  individual scores. Sequencing constraints override pure priority ranking.
- **Does A conflict with B?** If investing in A makes B harder or
  impossible, name that tradeoff. You're choosing a path, not just a list.
- **Is anyone else working on this?** If another team or person is
  already making progress, your investment may be redundant or could be
  redirected to the gap they're not covering.

### Step 4: Apply the cut

Given the scores and dependencies, divide into three buckets:

**Invest:** Gets real bandwidth this cycle. Named owner, time blocked,
expected output defined. Maximum 2-3 items. If you have more than 3 in
Invest, you haven't actually prioritized.

**Maintain:** Keep it alive with minimal effort. No new investment, but
don't let it die. Check in periodically. Be honest about what "maintain"
means in practice (often it means "nobody is working on this but we
haven't admitted it yet").

**Park:** Explicitly set aside. Not now, and that's okay. Name the
trigger that would bring it back (a dependency resolving, a quarter
boundary, a leadership ask). Parking is a decision, not a failure.

### Step 5: Stress-test the ranking

Before finalizing, run two checks:

**The calendar check:** Look at your actual calendar for the next 2 weeks.
Do the items in Invest have real time allocated, or are they competing
with wall-to-wall meetings? If there's no time on the calendar, the
prioritization is aspirational, not operational. Either block the time or
demote something to Maintain.

**The explanation check:** Can you explain each ranking decision in one
sentence to Jay? If you can't articulate why X is in Invest and Y is in
Park without a paragraph of caveats, the reasoning isn't clean enough.
The explanation should reference a Q2 priority, a concrete tradeoff, or
a timing constraint, not a general sense of importance.

---

## Output Format

```
# Prioritization Frame: [Context/Cycle]

_Date: YYYY-MM-DD_
_Bandwidth pool: [who/what team, how much capacity]_
_Deciding for: [time horizon — sprint, month, quarter]_

## Candidates

| # | Initiative | Success looks like | Alignment | Leverage | Cost of Delay |
|---|-----------|-------------------|-----------|----------|---------------|
| 1 | ... | ... | Direct | Multiplier | Degrading |
| 2 | ... | ... | Enabling | Linear | Stable |
| ... | | | | | |

## Dependencies
[A enables B, C conflicts with D, etc.]

## The Cut

### Invest
1. **[Initiative]** — [one sentence: why this, why now]
   Owner: [name]. Time blocked: [when]. Expected output: [what].
2. ...

### Maintain
- **[Initiative]** — [what "maintain" means in practice]

### Park
- **[Initiative]** — [trigger to revisit: date, dependency, or event]

## Explanation Check
[For each Invest item: one sentence explaining the ranking to Jay]

## What Changed
[If this is a re-prioritization: what moved up, what moved down, why]
```

---

## After the Prioritization

1. Update `work/priorities.md` with the new ranking. Items in Invest
   go to Do Now or Schedule. Items in Park go to Deprioritize.
2. If something moved from Invest to Park, update any related entries
   in `memory/open-threads.md` to reflect the pause.
3. If the prioritization revealed a conflict with a leadership ask (you're
   parking something Jay or Jen expects you to be working on), flag it
   immediately rather than letting it surface as a surprise. "I'm choosing
   X over Y because of Z" is a conversation. "I wasn't working on that"
   is a problem.
4. Block the actual time on your calendar for Invest items. A priority
   without time blocked is a wish.

---

## Relationship to Other Prompts

- **Eisenhower Matrix (Task Prioritization)** operates on tasks and
  commitments with a weekly cadence. The Prioritization Frame operates
  on initiatives and bets with a sprint or quarter cadence. They
  complement each other: the Frame decides which initiatives get
  investment; the Eisenhower matrix decides which tasks within those
  initiatives get done today.
- **Pressure Test** evaluates a single decision. If the Prioritization
  Frame surfaces a close call between two candidates, run a Pressure
  Test on the one you're leaning toward to make sure the reasoning holds.
- **Stakeholder Anticipator** helps you communicate prioritization
  decisions. If you're parking something that a stakeholder cares about,
  run the Anticipator before telling them.

---

## Design Notes

Three dimensions, not four or five, because each additional dimension
dilutes the signal. Strategic alignment and leverage are weighted high
because they answer the two questions that matter most: "does this connect
to what the org cares about?" and "does my involvement actually change
the outcome?" Cost of delay is moderate weight because it prevents false
urgency but shouldn't override strategic misalignment.

The "maximum 2-3 items in Invest" constraint is the teeth of this
framework. Most prioritization exercises fail not because the ranking
is wrong but because the cut is too generous. Having 6 things in Invest
is the same as having 0, because bandwidth spreads too thin to move any
of them meaningfully. The discomfort of parking something legitimate is
the point. If it doesn't hurt a little, you haven't actually prioritized.

The explanation check at the end exists because prioritization decisions
that can't survive a one-sentence summary in a 1:1 with your manager
aren't decisions yet. They're preferences that haven't been pressure-
tested against the organizational context. If the best you can say is
"it felt important," the ranking needs more work.
