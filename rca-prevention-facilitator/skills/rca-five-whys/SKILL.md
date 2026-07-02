---
name: rca-five-whys
description: >
  Drives a 5 Whys root-cause dig on a critical bug down to a SYSTEMIC cause you can act on —
  a process or design gap, never "a person made a mistake." Use when running the Root-Cause step
  of a SEV1/rollback RCA session, when someone asks "why did this actually break", when a proposed
  root cause still reads like a symptom, or when a team stops digging too early. Rejects
  person-blame and symptom-stopping; prompts one more "why" until the answer is a gap in the system.
  Called by rca-session-facilitator; usable standalone.
origin: BAD Quality Lab · github.com/iggmasterdev/badquality-lab
---

# 5 Whys — dig to a systemic cause

## Purpose
Take the patched symptom and keep asking "why?" until you reach a cause that lives in the **system**
(process, design, contract, tooling gap) — something you can put a permanent guard against. The first
"why" gives a symptom; the fourth or fifth gives something you can actually fix.

## When to use / triggers
"why did this actually happen" · the Root-cause field of an RCA + Prevention Record · a "root cause"
that still names a person or a symptom · a dig that stopped at the first plausible answer.

## How to run it

1. **State the symptom as Why-0** — the observable failure, in one line ("A/B events shipped with no
   timestamp; experiment data unusable"). This is *not* a why yet.
2. **Ask "why?" and chain the answers.** Each answer becomes the subject of the next "why". Aim for
   ~5 links; fewer is fine if you genuinely reach a systemic cause, but treat <3 as a red flag that
   you stopped at a symptom.
3. **At each answer, run the two rejection tests before accepting it:**
   - **Person test** — does the answer name or blame a person ("the dev forgot", "QA missed it")?
     If yes, it is a *symptom of a missing guard*, not a root cause. Ask: "why did the system let a
     human error reach production uncaught?" and keep going.
   - **Symptom test** — is this where you would normally stop and start fixing? If yes, ask "why?"
     one more time. The real cause is usually one layer past the comfortable answer.
4. **Stop when the answer is a systemic gap** — a missing check, an undefined contract, an unwritten
   requirement, a process with no gate. Phrase the final ROOT CAUSE as a gap in the system, not an
   event.
5. **Sanity-check the chain reads forward:** ROOT CAUSE → (causes) → … → symptom. If reversing the
   chain doesn't logically produce the symptom, a link is weak — redo it.

## Worked chain (data-contract example)
> symptom: experiment data unusable → *why?* events lacked required fields → *why?* nothing validated
> event fields before release → *why?* "required fields" per event were never defined → *why?* the
> service's event behaviour (its data contract) was never written down.
> **ROOT CAUSE (systemic):** no written event-data contract and no pre-release check that events
> carry their required fields.

Notice the chain never lands on "someone forgot the timestamp" — it lands on *the system had no
contract and no gate*, which is what a prevention can guard.

## Anti-patterns to reject on sight
- ❌ "The developer made a mistake / QA missed it." → a missing-guard symptom; dig past it.
- ❌ Stopping at the first technical answer ("the field was null"). → ask why the null could ship.
- ❌ A single "why" then a fix. → that's patching the symptom, the exact failure mode this exists to stop.
- ❌ Branching into ten parallel causes. → pick the dominant causal line; note the rest as contributing
  factors (hand to `rca-ishikawa`), don't turn the dig into a design meeting.

## Quality gate (all must hold)
- [ ] The final ROOT CAUSE is a **systemic** process/design/contract gap — not a person, not a symptom.
- [ ] The chain has enough links that at least one "symptom-test" push happened.
- [ ] The chain reads forward: root cause plausibly produces the stated symptom.
- [ ] Framing is **blameless** throughout — no named individual is the cause.
- [ ] Terminology clean — "QA engineer" / "test engineer", never "manual tester".
