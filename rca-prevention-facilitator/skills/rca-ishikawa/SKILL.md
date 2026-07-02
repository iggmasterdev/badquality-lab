---
name: rca-ishikawa
description: >
  Runs an Ishikawa / fishbone contributing-factors sweep across five categories —
  Process · People · Tooling · Requirements · Environment — so an RCA doesn't tunnel on the
  single obvious cause. Use for the Contributing-factors step of a SEV1/rollback RCA session, when
  a root cause feels too simple, or when you want to check "what else made this more likely." Only
  records categories that actually apply; keeps "People" blameless (systemic conditions, not fault).
  Called by rca-session-facilitator; usable standalone.
origin: BAD Quality Lab · github.com/iggmasterdev/badquality-lab
---

# Ishikawa / fishbone — contributing factors

## Purpose
After the 5 Whys finds the dominant root cause, sweep the five categories where causes hide so you
don't miss the conditions that made the failure *more likely*. This is a checklist against tunnel
vision — not a second root-cause hunt.

## When to use / triggers
Contributing-factors field of an RCA + Prevention Record · "what else contributed" · a root cause
that seems too clean · deciding whether the one prevention is aimed at the right category.

## The five categories (prompt each; skip the ones that don't apply)

| Category | Ask | Example signals |
|---|---|---|
| **Process** | Which step/gate was missing, skipped, or unowned? | no pre-release check, no DoD item, no review gate |
| **People** | What *systemic* condition around people raised risk? (capacity, onboarding, knowledge silo — **never** individual blame) | single point of knowledge, no onboarding for the component, overloaded owner |
| **Tooling** | What did the tools fail to catch or make hard? | no schema validator, no contract test, flaky suite ignored |
| **Requirements** | What was undefined, ambiguous, or unwritten? | "required fields" never defined, no written data contract, unclear AC |
| **Environment** | What about infra/data/config/release channel contributed? | runtime-only behaviour, staged rollout masked the fault, prod-only data shape |

## How to run it
1. Take the ROOT CAUSE from the 5 Whys as the spine of the fishbone.
2. Walk the five categories in order. For each, ask the category question once. If nothing real
   surfaces, **write nothing** for that category — empty is honest; padding is noise.
3. For **People**, force the systemic reframe: convert any "X person did/didn't…" into the condition
   that allowed it ("no onboarding path for the event schemas", not "X didn't know").
4. Mark which single category the chosen prevention will target — that's the handoff to
   `rca-prevention-design`. If contributing factors cluster in a category *other* than where the
   prevention lands, flag it: the prevention may be aimed at the wrong bone.

## Worked example (data-contract failure)
- **Process:** no pre-release step captures/validates emitted events. ✅ (prevention targets this)
- **Requirements:** required-field schema per event was never written down. ✅
- **Tooling:** no runtime event-capture/validation harness exists yet.
- **People:** — (nothing systemic beyond the above; leave blank)
- **Environment:** events only exist at runtime, so a build-time check can't see them — the guard
  must run against an instrumented build. ✅ (shapes *how* the prevention is built)

## Quality gate (all must hold)
- [ ] Only categories with a **real** contributing factor are recorded — no padding.
- [ ] "People" entries are **systemic conditions**, never individual fault.
- [ ] The category the prevention targets is identified.
- [ ] Nothing here silently replaces the 5 Whys root cause — this is *contributing*, not *the* cause.
- [ ] Terminology clean — "QA engineer" / "test engineer", never "manual tester".
