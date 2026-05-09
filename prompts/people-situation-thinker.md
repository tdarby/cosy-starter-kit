# Prompt: People Situation Thinker

Part of the **Org Decision Toolkit** (2 of 4).

Use this when you're navigating a people situation that has more going on than
the surface-level ask. The goal is to map the full terrain before you act:
what each person is actually feeling, what's driving their behavior, where the
leverage points are, and what moves are available to you.

Not every people interaction needs this. Most 1:1s, feedback conversations, and
coaching moments can be handled with direct instinct. Save this for situations
where you're unsure what move to make, where multiple people's interests
conflict, where the emotional stakes are high, or where a wrong read could
damage trust.

---

## When to Use

- Someone's reaction doesn't match the situation (overreacting, shutting down,
  deflecting)
- You need to deliver news or make a decision that will land differently for
  different people
- A conflict has multiple threads (interpersonal, structural, political) tangled
  together
- You're managing a transition that threatens someone's identity, status, or
  career trajectory
- You're about to have a conversation and you're not sure what's underneath
  the surface topic

**Not needed for:** routine 1:1 prep (use your 1:1 notes), straightforward
feedback (use SBI directly), or relationship maintenance (use relationship
check).

---

## How to Invoke

Say any of:
- "think through this people situation"
- "help me read this situation"
- "what's really going on here"
- "people thinker on [name/situation]"

CoSy will work through the five layers below. If Tramaine provides her read
first, CoSy builds on it. If she asks CoSy to start cold, CoSy drafts the
read from context files and then pressure-tests its own interpretation.

---

## The Five Layers

Work through each one. The layers build: you can't map the right move (Layer 5)
without understanding the terrain (Layers 1-4).

### Layer 1: What's the surface situation?

State what's happening in plain terms. Who is involved, what triggered this,
what's the visible problem or tension. Keep it factual. One paragraph.

Then ask: is this the whole picture, or is this the presenting problem? People
rarely bring you the real issue directly. The stated concern ("I'm worried about
my leveling") often masks the actual concern ("I don't trust that leadership has
my interests in mind").

### Layer 2: What is each person actually experiencing?

For every person involved, map:

- **What they're feeling.** Not what they should be feeling. Not what they're
  saying they feel. What the situation likely triggers given what you know about
  them.
- **What's at stake for them.** Job title, scope, team identity, career
  trajectory, reputation, relationships, sense of competence, autonomy. People
  react most strongly when identity or status is threatened.
- **What they need from you.** Validation? Information? Agency? Protection?
  A clear answer? To be heard? To be left alone? These are different, and
  giving the wrong one makes things worse.

Don't project your own reactions. A Principal Engineer who's told "we're
splitting your team" may feel relieved (less scope to manage) or devastated
(loss of influence), depending on what their team represents to them. Your
job is to figure out which one, not assume.

### Layer 3: What are the structural forces?

People situations happen inside systems. Map the forces that are shaping
behavior beyond individual personalities:

- **Incentive structures.** What does the org reward? What does it punish? If
  someone is acting in a way that seems irrational, check whether the incentives
  make it rational.
- **Power dynamics.** Who has formal authority? Who has informal influence? Who
  has information the others don't? Power asymmetry shapes what people say and
  what they withhold.
- **History.** Has something similar happened before? How did it go? People carry
  pattern memory. If the last reorg went badly, the next one starts with a trust
  deficit regardless of your intentions.
- **Timing pressures.** Deadlines, review cycles, bonus windows, reorg
  announcements. External timing can amplify or suppress people's willingness
  to engage honestly.

### Layer 4: What are the threads?

Most complex people situations have multiple threads tangled together. Name them
separately. Common thread types:

- **Interpersonal** (A and B have friction, misread each other, or have
  unresolved history)
- **Structural** (the org chart, role definition, or process creates the
  problem regardless of who's in the role)
- **Identity** (someone's sense of who they are professionally is being
  challenged or diminished)
- **Political** (there are interests, alliances, or narratives at play above
  or beside you)
- **Informational** (people are operating on different facts, or key
  information hasn't been shared)

Untangling the threads matters because the intervention for each thread is
different. Coaching fixes interpersonal friction. Restructuring fixes structural
problems. Coaching cannot fix a structural problem, and restructuring cannot
fix a trust deficit.

### Layer 5: What are your moves?

Given Layers 1-4, map the options. For each move, assess:

- **What does this move accomplish?** Which threads does it address?
- **What does it leave unresolved?** Which threads does it not touch?
- **What's the risk?** Could this backfire? How?
- **What's the timing?** Does this need to happen now, or does waiting
  change the dynamics (for better or worse)?
- **Who else needs to be involved?** Do you need Jay, Jen, HR, or a peer
  manager before you act?

Common move categories:

| Move | When it fits |
|------|-------------|
| **Direct conversation** | Interpersonal thread, and you have enough trust to go straight |
| **Coaching** | The person has the capability but needs a reframe, skill, or accountability structure |
| **Structural fix** | The problem is the role, the process, or the org chart, not the person |
| **Information sharing** | People are acting on incomplete or wrong information |
| **Creating space** | Someone needs time to process before they can engage constructively |
| **Triangulation (intentional)** | You need a third party (peer, skip-level, HR) to either validate your read or deliver a message you can't |
| **Absorb and wait** | The situation is resolving on its own, or acting now would make it worse. Active inaction is a valid move when the dynamics are shifting. |

---

## Output Format

CoSy produces the people situation analysis as a structured artifact:

```
# People Situation: [Short Title]

_Date: YYYY-MM-DD_
_People involved: [Names]_

## Surface (Layer 1)
[What's happening. One paragraph, factual.]

## What Each Person Is Experiencing (Layer 2)

### [Name]
- **Feeling:** [emotional state]
- **At stake:** [what they stand to lose or gain]
- **Needs from you:** [what kind of response they're looking for]

### [Name]
...

## Structural Forces (Layer 3)
[Incentives, power dynamics, history, timing]

## Threads (Layer 4)
1. **[Thread type]:** [description]
2. **[Thread type]:** [description]
...

## Available Moves (Layer 5)

| Move | Addresses | Leaves unresolved | Risk | Timing |
|------|-----------|-------------------|------|--------|
| ... | ... | ... | ... | ... |

## Recommended Sequence
[Which moves, in what order, with what spacing between them.
Not every thread needs to be resolved at once.]
```

---

## After the Analysis

1. If the situation involves a conversation you need to have, draft the
   opening and key points. Don't script it word-for-word; script the
   frame and the 2-3 things you need to land.
2. If the analysis changes your understanding of someone, update their
   context file in `team/context/` or `relationships/context/`.
3. If it surfaces an open thread (something you need to follow up on,
   information you need to gather), add it to `memory/open-threads.md`.
4. If the situation resolves, note the outcome in the relevant context
   file. People situations have a tendency to recur in patterns;
   recording the resolution helps you recognize the pattern faster
   next time.

---

## Relationship to Other Prompts

- **Team Pulse** monitors ongoing team health at a cadence. People Situation
  Thinker goes deep on a specific situation that Team Pulse might flag.
- **Relationship Check** tracks touchpoint frequency and open commitments.
  People Situation Thinker analyzes what's going on beneath the surface of
  a specific relationship.
- **Pressure Test** stress-tests a decision. People Situation Thinker helps
  you navigate the human dynamics of implementing or communicating that
  decision. They pair well: Pressure Test tells you whether to proceed;
  People Situation Thinker tells you how to bring people along.
- **Quarterly Connection** evaluates performance and growth. People Situation
  Thinker helps you understand someone's current state; the QC evaluates
  their trajectory over a quarter.

---

## Design Notes

The five layers are ordered from observable to interpretive. Layer 1 is facts.
Layer 2 is empathy. Layer 3 is systems. Layer 4 is synthesis. Layer 5 is
action. Jumping to Layer 5 before working through 1-4 produces moves that
solve the wrong problem or catch the person at the wrong moment.

The hardest part is Layer 2. It's tempting to project your own reactions onto
others ("I'd be fine with this, so they should be too") or to accept the stated
concern at face value ("they said they're fine"). The prompt pushes past both
by asking what the situation likely triggers given what you know about the
specific person. This requires using the team context files, not generic
assumptions about how people respond to change.

The "absorb and wait" move in Layer 5 is intentional. Not every situation
needs an intervention. Sometimes the best move is to let the dynamics shift,
keep your read updated, and act when the moment is right. Including it
explicitly prevents the bias toward action that managers often default to
under pressure.
