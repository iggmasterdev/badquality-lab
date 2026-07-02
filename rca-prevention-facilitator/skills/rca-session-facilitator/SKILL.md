---
name: rca-session-facilitator
description: >
  Orchestrates a full Root-Cause + Prevention session end-to-end for a SEV1 or rollback, unaided:
  intake the incident (ticket, SEV, origin label) → drive 5 Whys to a systemic cause → sweep
  contributing factors → design exactly one prevention → write the .md Record. Keeps it blameless and
  timeboxed (~30–45 min) and adapts to any team while holding one shared format. Use when a team needs
  to run an RCA/postmortem on a critical bug, "do a root-cause session", or turn a SEV1/rollback into a
  written prevention record. Calls the rca-* sub-skills; grounds on demand.
origin: BAD Quality Lab · github.com/iggmasterdev/badquality-lab
---

# RCA session facilitator — the orchestrator

## Purpose
Run the whole session so a team gets a valid Record with only an incident as input. You facilitate:
ask the right question at each step, keep it blameless and timeboxed, and produce the artifact. You
orchestrate five sub-skills; you don't restate their content from memory.

## When to use / triggers
"run a root-cause session" · "RCA / postmortem on this SEV1" · a bug that is **SEV1 or caused a
rollback** · "turn this incident into a prevention record".

## Trigger rule (when a session is warranted)
Run a Record for **every SEV1 or every rollback** — no debate. If the incident is neither, say so and
stop (this is deliberately a small number of high-leverage sessions, not a burden).

## The sub-skills you call
| Step | Sub-skill | What it does |
|---|---|---|
| Root cause | `rca-five-whys` | drives to a systemic cause; rejects person-blame / symptom-stopping |
| Contributing factors | `rca-ishikawa` | Process·People·Tooling·Requirements·Environment sweep |
| Prevention | `rca-prevention-design` | one buildable guard, owner + home, build-now/follow-up |
| Record | `rca-record-writer` | emits the exact template; enforces the done-bar |
| Reasoning (on demand) | `rca-knowledge-grounding` | the principle behind a step, separated from application |

## Session flow (~30–45 min, blameless, one pass)

**0. Set the frame (½ min).** State the ground rule out loud: *we analyse the system, never the person.*
A record that blames someone teaches the team to hide the next one. Confirm the incident qualifies
(SEV1 or rollback).

**1. Intake — the incident header (5 min).** Collect: ticket/link, date, team, app(s)/service(s)
affected, Severity, Priority, and the **origin label** (exactly one, from your team's agreed closed set,
e.g. `dev` · `qa` · `integration` · `regression` · `reopened` · `production` · `other`). Then **What
happened** (2–3 plain sentences: symptom + who/what it hurt — no analysis yet) and **Detection** (how/
when found + **time-to-detect**; a long one is itself a finding). For a widely-depended-on component,
read severity by its blast radius — one failure can hit many consumers at once.

**2. Root cause (10–15 min) → call `rca-five-whys`.** Drive the chain to a systemic gap. Push past any
"a person made a mistake" or first-symptom answer with one more "why". Land on a process/design/contract
gap you can guard.

**3. Contributing factors (5 min) → call `rca-ishikawa`.** Sweep the five categories; record only those
that apply; keep "People" systemic. Note which category the prevention will target.

**4. Prevention (10 min) → call `rca-prevention-design`.** Convert the root cause into **exactly one**
concrete guard (test / validation / checklist / gate) with a home and an owner; decide build-now vs
named follow-up. Reject "be more careful". If the discussion drifts into designing the build, capture
the guard and schedule the build — don't let the record become a design meeting.

**5. Failure class + write (5 min) → call `rca-record-writer`.** Tag the reusable failure class, then
emit the Record to `rca-records/rca-[team]-[ticketID]-[YYYY-MM-DD].md` in the exact template. Verify the
done-bar before declaring the fix "Done".

**Grounding — any time → call `rca-knowledge-grounding`.** If anyone asks "why this step / what's the
reasoning", state the principle and separate it from the team's application.

## Facilitation stance (how to ask, not just what)
- Ask open, neutral questions ("what did the system let happen?" not "who broke it?").
- One dominant causal line at a time; park side-branches as contributing factors.
- Keep the clock — this is a fast session while memory is fresh, not a design workshop.
- **Team adaptation:** you may *discuss* in the team's language and match their wording, but keep the
  **Record format identical** across teams so records stay comparable.

## End-of-session output
1. The written Record at the `rca-records/` path, in the template.
2. A 3–5 line chat summary: **root cause** + **the one prevention** + **failure class**, plus any
   follow-up owner.

## Quality gate (all must hold)
- [ ] Systemic root cause reached (via `rca-five-whys`) — not a person, not a symptom.
- [ ] Exactly one concrete, buildable prevention with owner + home (via `rca-prevention-design`).
- [ ] Blameless framing held throughout; session stayed timeboxed.
- [ ] Record written in the exact template with the done-bar met (via `rca-record-writer`).
- [ ] Any best-practice claim carried honest grounding — no invented source.
- [ ] Terminology clean — "QA engineer" / "test engineer", never "manual tester".
