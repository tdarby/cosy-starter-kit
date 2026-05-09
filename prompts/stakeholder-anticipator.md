# Prompt: Stakeholder Anticipator

Part of the **Org Decision Toolkit** (3 of 4).

Use this before you pitch, propose, or communicate something that matters to
people who weren't in the room when you decided it. The goal is to predict
how each stakeholder will receive your message and prepare for the
conversations that follow.

The Pressure Test asks "is this the right decision?" The People Situation
Thinker asks "what are people experiencing?" The Stakeholder Anticipator
asks "how will this land when I bring it to each person, and what do I
need to adjust?"

---

## When to Use

- You're about to present a proposal, recommendation, or decision to
  leadership or peers
- A change you're driving will affect people who have different priorities,
  incentive structures, or information than you do
- You need to socialize something before a meeting where the decision
  will be made
- You're writing an email, doc, or Slack message to a mixed audience where
  different readers will focus on different things
- You've run a Pressure Test and the verdict was "proceed" or "proceed with
  guardrails," and now you need to figure out the rollout

**Not needed for:** updates to people who are already aligned, routine status
reporting, or conversations where you already know how the other person will
react.

---

## How to Invoke

Say any of:
- "anticipate how this lands"
- "stakeholder map this"
- "who do I need to bring along"
- "how will [name] react to this"
- "anticipator on [proposal/decision]"

CoSy will work through the framework below. If Tramaine has already
identified the stakeholders, CoSy maps reactions. If she hasn't, CoSy
identifies who matters from context files and asks her to confirm or
adjust the list before proceeding.

---

## The Framework

### Step 1: What's the message?

State what you're communicating in one paragraph. Be specific about the
ask, the decision, or the change. Not "I'm proposing a restructuring" but
"I'm proposing path-based CODEOWNERS for the operator repo so component
teams can self-approve manifest updates, reducing external PR latency from
5-20 days to 1-2."

Then state the desired outcome: what do you need from stakeholders? Approval?
Buy-in? Information? Passive awareness? The answer shapes everything else.

### Step 2: Map the stakeholders

For each person or group who will hear this message, fill in:

**Who they are and what they care about:**
- What are they measured on? What does success look like in their role?
- What are they currently worried about or focused on?
- What's their relationship to the topic? (Owner, contributor, affected
  party, audience)

Pull from `relationships/context/` and `relationships/stakeholders.md`.
If a stakeholder doesn't have a context file, note it and work from what
you know.

**How they'll likely react:**
- **First reaction:** What's the gut response when they hear this? Not the
  considered response, the first one. This is what you'll see in their face
  or in the first sentence of their reply.
- **Underlying concern:** What's driving that reaction? Is it about the
  proposal itself, or about what it implies (scope change, loss of control,
  more work, political risk)?
- **What they'll ask:** The specific question or challenge they'll raise.
  Not a generic "they might push back" but the actual words.

**What they need from you:**
- **Before the pitch:** Do they need a heads-up? Pre-read? A private
  conversation before the group setting? Some people need to process
  before they can engage productively in a meeting.
- **In the moment:** What framing makes this land? What words or data
  points address their specific concern? What do you NOT say that would
  trigger resistance?
- **After:** What follow-up closes the loop? Do they need to see results?
  Get a role in the execution? Hear from someone else who validates the
  direction?

### Step 3: Identify the sequence

Not everyone hears this at the same time. Map the order:

1. **Pre-wire:** Who needs to hear it first, privately, before any group
   discussion? Usually your manager, a key ally, or the person most
   likely to object.
2. **Propose:** Who's in the room for the decision or pitch?
3. **Inform:** Who hears about it after the decision is made? What's
   their channel (email, Slack, meeting, 1:1)?
4. **Skip:** Who does NOT need to hear this from you? Sometimes the
   right move is to let their manager communicate it.

Order matters because each conversation changes the landscape for the
next one. If Jay is on board before you talk to Jen, Jen hears "Jay and
I discussed this" rather than "I came up with this." If Ramesh hears it
from you before the group meeting, he arrives as an ally rather than
someone processing in real time.

### Step 4: Find the fault lines

Look across all stakeholders for:

- **Conflicting interests:** Where does what Person A wants directly
  conflict with what Person B wants? You can't satisfy both. Name the
  tradeoff and decide whose priority wins.
- **Information asymmetry:** Who knows something the others don't? Should
  you level-set before the discussion, or does the asymmetry work in
  your favor?
- **Audience contamination:** Are you sending one message to a mixed
  audience that will hear it differently? If so, you may need separate
  communications rather than one email or one meeting.
- **The person who's not in the room:** Who should be included but
  isn't? Their absence creates a gap you'll have to fill later, often
  at higher cost.

---

## Output Format

CoSy produces the stakeholder analysis as a structured artifact:

```
# Stakeholder Anticipator: [Proposal/Decision Title]

_Date: YYYY-MM-DD_
_Desired outcome: [What you need from stakeholders]_

## The Message
[One paragraph: what you're communicating]

## Stakeholder Map

### [Name] — [Role/Relationship]
- **Cares about:** [what they're measured on, focused on]
- **First reaction:** [gut response]
- **Underlying concern:** [what's driving the reaction]
- **Will ask:** "[specific question]"
- **Before:** [pre-wire needs]
- **In the moment:** [framing that lands]
- **After:** [follow-up needed]

### [Name] — [Role/Relationship]
...

## Sequence
1. **Pre-wire:** [who, when, channel]
2. **Propose:** [forum, attendees]
3. **Inform:** [who, channel]

## Fault Lines
[Conflicting interests, information gaps, audience risks]

## Adjusted Message
[If the stakeholder mapping revealed that the original framing
needs to change, draft the adjusted version here. Sometimes the
message you started with isn't the message that will land.]
```

---

## After the Analysis

1. If the anticipator reveals you need to pre-wire someone, schedule or
   draft that conversation before the main pitch.
2. If you discover a fault line (conflicting interests between two
   stakeholders), decide how you'll handle it before you're in the
   room. Don't improvise on a known conflict.
3. If the adjusted message is substantially different from the original,
   that's a signal. The substance might be right, but the framing was
   off. Take that seriously.
4. After the actual conversations happen, note where your predictions
   were right and wrong in the relevant context file. Calibrating your
   stakeholder reads over time is the skill.
5. Update `relationships/context/` files if you learned something new
   about what a stakeholder cares about or how they process information.

---

## Relationship to Other Prompts

- **Pressure Test** decides whether to proceed. Stakeholder Anticipator
  decides how to roll it out. Run the Pressure Test first.
- **People Situation Thinker** goes deep on one person's experience.
  Stakeholder Anticipator goes wide across everyone who needs to hear
  the message. If the Anticipator flags a person whose reaction is
  complex enough to warrant Layer 2-5 analysis, spin up the People
  Situation Thinker on that individual.
- **Relationship Check** tracks touchpoint cadence. Stakeholder
  Anticipator uses relationship context for a specific proposal. If
  the Anticipator reveals you haven't talked to a key stakeholder
  recently, that's a signal to reconnect before pitching.

---

## Design Notes

The key insight behind this prompt is that the same proposal lands
differently depending on who hears it, in what order, and with what
framing. A reverse Conway analysis presented as "here's what I found"
is insight-sharing. The same analysis presented as "we should restructure"
is a political event. The substance is identical; the stakeholder
experience is completely different.

Step 2 pushes for "first reaction" rather than "considered position"
because first reactions drive meeting dynamics. If someone's gut
response is defensive, they'll spend the meeting protecting their
position instead of evaluating yours, regardless of how good your
argument is. Anticipating and defusing the gut reaction (often through
pre-wiring or framing) is the difference between a proposal that gets
debated on its merits and one that gets killed by the room's emotional
temperature.

Step 4 (fault lines) exists because stakeholder mapping done person-by-
person can miss the interactions between stakeholders. Two people who
are each individually reasonable can create an impossible dynamic when
their interests collide in the same meeting. Mapping fault lines
before you're in the room is cheaper than discovering them live.
