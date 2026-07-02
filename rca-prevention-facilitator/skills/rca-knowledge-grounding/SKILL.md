---
name: rca-knowledge-grounding
description: >
  On request, states the established best-practice principle behind any RCA step (5 Whys, blameless
  framing, contributing factors, prevention design, the feedback loop), and always separates the
  PRINCIPLE (why the step is sound) from the APPLICATION (how it maps to your team's context). Use when
  a facilitator or team asks "why do we do this step", "what's the reasoning", "is this best practice",
  or wants the rationale behind a recommendation. Grounds only in principles it can stand behind — it
  never invents a source or a citation. Called by rca-session-facilitator; usable standalone.
origin: BAD Quality Lab · github.com/iggmasterdev/badquality-lab
---

# Knowledge grounding — the reasoning behind each RCA step

## Purpose
Back a step with the established principle behind it, and keep two things separate:
- **PRINCIPLE** — the long-standing practice the step rests on.
- **APPLICATION** — how that principle maps to your team's context (your service, your release
  channel, your risk surface).

The principles below are grounded in long-established agile-testing, quality-coaching, and
API-contract-testing practice.

## When to use / triggers
"why do we do this" · "what's the reasoning / is this best practice" · a team wants the rationale before
adopting a step · writing the "why this matters" note in a Record or retro.

## Hard rule: evidence before assertion
State only principles you can stand behind, in your own words. **Never invent a quote, an author, or a
citation.** If someone asks for a specific published source you don't have, say so plainly and give the
principle instead — do not fabricate attribution. If your team keeps its own reference library, cite it
by name; otherwise ground on the principles here.

## Principle library (state the principle → add one application line)

### Blameless culture & root-cause questions
- **Principle:** Analyse the system, not the person. Neutral, curious questioning ("what did the system
  let happen?") keeps psychological safety, which is what makes the real cause surface. Run root-cause
  sessions selectively, on the incidents that most repay the effort, and treat them as learning.
  → *Application:* run a full session only on SEV1/rollback — high-leverage, treated as learning, never blame.

### 5 Whys & contributing-factor questions
- **Principle:** The first answer is a symptom; disciplined "why?" chaining reaches a systemic cause.
  Clarifying questions ("where else is this used?", "who else depends on it?", "did we consider
  security / usability / reliability?") surface missed scope and hidden risk.
  → *Application:* the same question stance drives the 5 Whys past the symptom and populates the Ishikawa categories.

### Whole-team defect prevention & "done"
- **Principle:** Quality is the whole team's job, not one role's. A story isn't "done" until it's been
  tested — that definition of done is itself a defect-prevention gate.
  → *Application:* underpins the record's rule — the fix is **not Done** until root cause + prevention exist.

### The feedback loop (production → prevention)
- **Principle:** Every escaped bug is data. Look for patterns in what reached production and feed a new
  guard back into how you test — this closes the loop and stops a *class* of bug from recurring. Rapid,
  layered feedback is what lets teams adapt.
  → *Application:* each SEV1 feeds exactly one new guard back into the test/release process.

### Contract / baseline checks for shared components
- **Principle:** For a component many others depend on, hold the expected behaviour in a **contract**
  stored separately from both sides, and validate against it; establish a **baseline** so deviation
  signals a real change. This is how you catch integration and performance regressions in fan-out.
  → *Application:* an event-schema check or a capability spec is a contract/baseline guard for a component that fans out across many consumers.

### Observability enables fast, blameless root cause
- **Principle:** You can only find a root cause quickly if you can observe the system's insides.
  Observability, like testability, has to be designed in — not bolted on after the incident.
  → *Application:* if time-to-detect was long, a contributing factor is often missing observability; note it.

## How to use in a session
1. Identify which step needs backing (5 Whys / blameless / factors / prevention / feedback loop).
2. State the matching principle above, then add one **application** line for the team's context.
3. Keep it to one principle at a time — grounding supports the step, it doesn't become a lecture.

## Quality gate (all must hold)
- [ ] Only principles you can stand behind are stated — no invented quote, author, or citation.
- [ ] **Principle** and **Application** are visibly separated.
- [ ] If a specific published source was requested and isn't available, that's said — not papered over.
- [ ] Terminology clean — "QA engineer" / "test engineer", never "manual tester".
