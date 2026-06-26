---
name: example-mapping
description: >-
  Turn a raw user story or feature request into a shared, testable specification
  BEFORE coding starts: clarifying questions, concrete examples, acceptance
  criteria as Given/When/Then, conditions of satisfaction, a ripple-effect impact
  list, and a "ready / not ready" verdict. Use this whenever someone is refining,
  grooming, or kicking off a story; writing or reviewing acceptance criteria;
  preparing a three-amigos / example-mapping session; checking a Definition of
  Ready; or asking "what should this feature actually do" or "is this story ready
  to build". Trigger even if the user only pastes a story and asks for tests or
  scenarios — the right first move is to map examples, not jump to test cases.
origin: "badquality-lab"
---

# Example Mapping

You help a team turn a vague story into a **shared understanding that is concrete
enough to test** — the conversation that should happen before a line of code is
written. These are "business-facing tests that support the team"
(Quadrant 2). The output is the agreement, expressed as examples and acceptance
criteria, that lets development start in the right direction.

The core move: **don't ask for requirements, ask for examples.**
People struggle to state what they want in the abstract, but they can almost
always give you a concrete example of how it should work. Examples expose the
rules; the rules become acceptance criteria; the criteria become tests.

## When to use

Refining/grooming a story, writing acceptance criteria, preparing for a
three-amigos session, checking if a story is ready, or any time a story is too
thin to safely estimate or build. If the user pastes a story and asks for "test
cases" or "BDD scenarios," still start here — jumping to tests before the examples
are agreed just encodes one person's guess.

## Inputs to gather

Work with whatever the user gives you. If the story is thin, that's expected — the
gaps you find ARE part of the output. Useful context if available:
- The story / feature text (even one sentence is fine)
- Who the customer/end user is, and the business problem
- Any mock-ups, constraints, or existing related functionality

If something critical is missing, surface it as an open question rather than
inventing an answer. A confident-looking spec built on guesses is worse than an
honest list of unknowns.

## The procedure

Produce the artifact in this order. Each section builds on the last.

### 1. Restate the story and its purpose
One or two lines: what the story is, **the problem it solves**, and **who gets
value**. If you can't state the problem, that is the first finding. The
framing: a story that doesn't solve a stated problem is a red flag.

### 2. Ask the questions
Generate the clarifying questions a good tester asks — the ones that expose hidden
assumptions. Draw from these, tailored to the story:
- What problem is this solving? Could we ship something that *doesn't* solve it?
- Who are the end users? What value do they get?
- What does the user do right *before* and right *after* using this?
- How will we know we're done?
- **What's the worst thing that could happen?** (surfaces risk and edge cases)
- **What's the best thing that could happen?** (surfaces the happy path and hidden
  assumptions)

Keep questions specific to THIS story. Generic questions are noise; the value is
in the ones that make someone go "...huh, good question."

### 3. Conditions of Satisfaction
The business's acceptance conditions — what must be true for the customer to
accept this story. Beyond the feature itself, deliberately probe the wider impact
(a typical product-owner checklist):
- Impact on existing functions (other screens, documents, invoices, reports)
- Legal / compliance considerations
- Scheduled/background processes affected
- Help text and internal/external communication
- Data migration
Only list the ones that actually apply. Mark assumptions explicitly.

### 4. Rules and Examples (the map)
This is the heart. For each **rule** (a single acceptance condition), give one or
more **concrete examples** that illustrate it — in business language, with real
values. Cover the happy path, boundaries, and at least one "undesired behavior"
example. Use a table:

| Rule | Example (concrete, with real values) |
|------|--------------------------------------|
| Shipping cost is based on weight and destination | A 2 kg order to Berlin shows €7.50 for 5-day delivery |
| Continental destinations only | An order to Hawaii is rejected with "destination not serviced" |

An **example** is a narrative ("I add a $20.25 item, then a $5.38 item, the cart
shows $25.63"). It is *not yet* a test — it is the raw material a test is built
from. Keep examples in the customer's language so a business person could read and
confirm them.

If you discover a rule nobody can give an example for, flag it — that's an
unknown, not a rule.

### 5. Acceptance criteria as Given/When/Then
Now translate the agreed examples into executable-style acceptance tests. These
are the high-level tests that kick off the story. Format:

```
Scenario: <name>
  Given <context>
  When <action>
  Then <observable outcome>
```

Include both desired and undesired behavior. Keep them at story-kickoff altitude —
enough to point development the right way, not an exhaustive boundary matrix (that
comes later, during coding). Map each scenario back to a rule so coverage is
visible.

### 6. Ripple effects (impact list)
A small story can drop like a stone and send waves across the system. List the
parts of the system this story might touch beyond the obvious — integrations,
shared data, downstream reports, scheduled jobs. This is where stories that "look
small" turn out not to be. Each touch point may generate more test cases or even
more task cards.

### 7. Readiness verdict
Close with a clear judgment:
- **READY** — rules and examples are agreed, criteria are testable, impacts are
  understood. Safe to estimate and build.
- **NOT READY** — and exactly what's missing (which questions are unanswered,
  which rules lack examples, which assumptions need a decision).

Then apply the **Power of Three**: if a question can't be answered from the story
alone, name *who needs to be in the room* to resolve it — typically a customer/PO,
a developer, and a tester. The point is that a requirement decision shouldn't be
made by one person; three viewpoints catch what one misses. Be specific: "Needs
PO + dev to decide whether military-address shipping is in scope."

## Output format

Produce a single clean Markdown document titled **`Story Discovery: <story name>`**
with the seven sections above as headings. It should be something the team could
paste into a wiki or ticket and use directly. No preamble, no meta-commentary —
just the artifact.

## Quality bar (what good looks like)

- Examples use **real, specific values**, not "some input → some output."
- At least one **undesired-behavior** example exists. Teams over-specify the happy
  path and under-specify failure.
- The ripple-effect list contains at least one **non-obvious** touch point, or
  explicitly states you looked and found none.
- The readiness verdict is **decisive**. "Mostly ready" helps no one — say what's
  blocking and who resolves it.
- You did not silently invent business rules. Unknowns are listed as unknowns.

## Modern tooling map

When the user wants to take criteria into automation, point to current tools, not
dated tooling:
- BDD/Given-When-Then runners: **Cucumber** (Ruby/JS), **SpecFlow/Reqnroll**
  (.NET), **Behave/pytest-bdd** (Python), **Cucumber-JVM** (Java).
- Example-mapping facilitation: the Example Mapping technique (cards: story / rules
  / examples / questions) is the named, structured form of this approach.

## Background

Grounded in long-established agile testing practice: example-driven specification —
agreeing concrete examples *before* coding — together with conditions of
satisfaction and "three amigos" collaboration across product, development, and
testing.
