---
name: rca-prevention-design
description: >
  Converts a systemic root cause into EXACTLY ONE concrete, buildable guard — a test, validation,
  checklist item, or gate — with a named owner, a home ("where it lives"), and a build-now/follow-up
  call. Use for the Prevention step of a SEV1/rollback RCA session, when turning a root cause into a
  safeguard, or when a proposed prevention is vague ("be more careful", "review better"). Rejects
  wish-lists and unbuildable preventions; picks the single guard that kills the whole failure class.
  Called by rca-session-facilitator; usable standalone.
origin: BAD Quality Lab · github.com/iggmasterdev/badquality-lab
---

# Prevention design — one buildable guard

## Purpose
A record without a prevention is just a story. Turn the root cause into **one** permanent guard that
makes this *class* of bug unable to silently return — specific enough to actually build, with an owner
and a home. One guard, built to last, beats a list of five aspirations nobody ships.

## When to use / triggers
Prevention field of an RCA + Prevention Record · "what do we put in place so this can't happen again"
· a prevention that reads like advice rather than a buildable artifact · deciding build-now vs follow-up.

## How to design the guard

1. **Name the failure class, not the instance.** The guard must stop the *class* ("events shipped
   with missing required fields"), not just this one event. If your guard only catches the exact bug
   that just happened, widen it until it catches the class.
2. **Pick the guard type** — the earliest, cheapest filter that reliably catches the class:
   - **Test** (automated) — a check that fails when the class recurs. Preferred where automation exists.
   - **Validation** — a runtime/schema/contract check on data or interfaces.
   - **Checklist item** — a required manual step in a defined process, when automation isn't yet feasible.
   - **Gate** — a release/merge condition that blocks on the check.
   Prefer *automated + upstream* over *manual + downstream* when the team can support it.
3. **Make it concrete and buildable.** State exactly what it does, on what trigger, and what it fails
   on. "A pre-release step on an instrumented build that captures emitted events and fails the release
   if a required field (timestamp, experiment ID) is missing" — buildable. "Validate events better" —
   not buildable, reject it.
4. **Assign a home and an owner.** *Where it lives* (which suite/pipeline/checklist/repo) and *who owns
   it* (a team or role). No owner = it won't get built.
5. **Build-now vs follow-up.** If it can be built immediately, say so. If not, log it as a named
   follow-up with the same owner — never let "we'll get to it" be anonymous.
6. **Enforce exactly one.** If two guards feel necessary, choose the one that covers the class most
   completely; note the other as a follow-up. The record captures the prevention; it does not become a
   design meeting or a backlog.

## Modern tooling map (encode the principle → current tools)
| Class of cause | Guard, in today's tooling |
|---|---|
| Data/event schema drift | JSON-Schema / contract validation in an instrumented build; **Pact**-style contract test for shared components |
| Shared-component / library fan-out regression | consumer-driven **contract test** (Pact) + a baseline check (k6/Gatling for perf norms) |
| Escaped functional regression | automated E2E on the critical path (**Playwright/Cypress** web; **Maestro/Espresso** mobile) added to the regression suite |
| Missing unit-level guard | targeted unit/property test (**JUnit5/pytest/Vitest**) at the fault boundary |
| Unclear requirement / undefined contract | written spec entry + a static/pre-grooming check so "undefined" fails review upstream |
| Release-time slip | CI **gate** that blocks the release/merge on the new check |

## Reject on sight
- ❌ "Be more careful" / "review better" / "pay attention" — not a guard, it's a hope.
- ❌ A prevention with no owner or no home.
- ❌ A guard that only catches the exact instance, not the class.
- ❌ A list of 3–5 improvements — that's a backlog, not a prevention. Pick one.

## Quality gate (all must hold)
- [ ] Exactly **one** prevention, and it targets the **failure class**, not just the instance.
- [ ] It is a real guard type (test / validation / checklist / gate) — concrete enough to build.
- [ ] It has a **home** ("where it lives") and a named **owner**.
- [ ] Build-now or named follow-up is stated.
- [ ] Where automation exists, the guard is automated + upstream, mapped to a current tool.
