# RCA + Prevention Record — SVC-4821

> Worked example produced by the `rca-prevention-facilitator` agent for a common data-contract failure.
> Illustrative only — names and IDs are fictional.

## Incident header
- Ticket / link: SVC-4821
- Date: 2026-07-02
- Team: payments-sdk                     App(s) / service(s) affected: SDK + all consumer apps running the live A/B experiment
- Severity (SEV1–4): SEV1                Priority (P1–3): P1        Origin label: production

## What happened
A/B-experiment events emitted by the SDK shipped without timestamps and without attribution. The
experiment's data was silently unusable, putting revenue and product decisions at risk. Normal app
testing could not see it — the app looked fine while the data behind it was broken.

## Detection
- How & when found (origin label): `production` — surfaced only after the experiment was already live;
  the app surface looked healthy, so pre-release app testing never flagged it.
- Time-to-detect (how long it was live): ~3 days live before anyone noticed — a long time-to-detect is
  itself a finding here (silent, multi-day revenue risk).

## Root cause (5 Whys)
1. Why? → The experiment's data was unusable. → because the events lacked required fields (timestamp, experiment ID).
2. Why? → The events lacked required fields. → because nothing validated event fields before release.
3. Why? → Nothing validated event fields before release. → because the "required fields" per event were never defined.
4. Why? → Required fields were never defined. → because the SDK's event behaviour (its data contract) was never written down.
5. Why? → The data contract was never written down. → because there is no single spec of what the SDK emits, and no runtime gate that checks emitted events against such a spec.
ROOT CAUSE (systemic): No written event-data contract and no pre-release check that emitted events carry
their required fields. (Systemic gap — not a person, not the missing timestamp itself.)

## Contributing factors (Ishikawa — only those that apply)
- Process: No pre-release step captures and validates the events the SDK actually emits.
- People: —
- Tooling: No runtime event-capture / schema-validation harness exists yet.
- Requirements: The required-field schema per revenue/experiment event was never written down.
- Environment: These events only exist when the SDK runs, so a build-time check cannot see them — the
  guard must run at runtime against an instrumented build.

## Prevention (ONE concrete guard)
- What (test / validation / checklist item / gate): A pre-release **validation on an instrumented test
  build** that exercises the SDK, captures the events it emits, and **fails the release** if any
  revenue/experiment event is missing a required field (e.g. timestamp, experiment ID) or has it
  malformed — validated against a defined per-event schema. Adds the event schema to the SDK spec.
- Where it lives: SDK release pipeline (runs on every release build); schema kept with the SDK spec.
- Owner: payments-sdk team.
- Built now / follow-up: Follow-up — named build owned by the payments-sdk team; the schema definition can start now.

## Failure class tag
`revenue/experiment events shipped with missing or malformed required fields`
