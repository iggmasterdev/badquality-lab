---
name: rca-record-writer
description: >
  Emits the finished RCA + Prevention Record as a .md file in a fixed template, and enforces the
  record's done-bar: systemic root cause, exactly one concrete prevention, a failure-class tag, and the
  "fix is not Done until root cause + prevention exist" rule. Use to write or finalize an RCA +
  Prevention Record, to check a record is complete before closing a SEV1/rollback ticket, or to format
  captured RCA findings into the shippable artifact. Called by rca-session-facilitator; usable standalone.
origin: BAD Quality Lab · github.com/iggmasterdev/badquality-lab
---

# Record writer — the template + done-bar

## Purpose
Turn the session's findings (5 Whys, contributing factors, the one prevention, the failure class) into
the written Record, in the **exact** template below, and refuse to call it done until the done-bar is
met. The template is the contract — do not paraphrase or reorder its fields.

## When to use / triggers
"write the record" · "finalize the RCA" · closing a SEV1/rollback ticket · formatting RCA findings into
the deliverable · checking a record against the done-bar.

## The template (emit exactly this structure)

```
# RCA + Prevention Record — [ticket ID]

## Incident header
- Ticket / link:
- Date:
- Team:                     App(s) / service(s) affected:
- Severity (SEV1–4):        Priority (P1–3):        Origin label:

## What happened
[2–3 sentences: symptom + user/business impact]

## Detection
- How & when found (origin label):
- Time-to-detect (how long it was live):

## Root cause (5 Whys)
1. Why? →
2. Why? →
3. Why? →
4. Why? →
5. Why? →
ROOT CAUSE (systemic):

## Contributing factors (Ishikawa — only those that apply)
- Process:
- People:
- Tooling:
- Requirements:
- Environment:

## Prevention (ONE concrete guard)
- What (test / validation / checklist item / gate):
- Where it lives:
- Owner:
- Built now / follow-up:

## Failure class tag
[reusable label for recurring-class tracking]
```

## Rules the writer enforces
- **Origin label** comes from a single closed set your team agrees on up front. A sensible default set:
  `dev` · `qa` · `integration` · `regression` · `reopened` · `production` · `other`. Use exactly one.
  (Adapt the labels to your pipeline, but lock one shared set so records stay comparable.)
- **Time-to-detect** is a finding, not a formality — a long one is itself worth noting.
- **Contributing factors** — omit categories with nothing real; do not leave placeholder text.
- **Prevention** — exactly one, with a home and an owner (see `rca-prevention-design`).
- **Failure class tag** — short, reusable, phrased at the class level ("events shipped with missing
  fields"), so recurrence is spottable across records.
- **Language** — keep the Record file in one consistent language across the team, even if the session
  was discussed in another; a single language keeps records searchable and comparable.

## Output contract (file)
- Path: `rca-records/rca-[team]-[ticketID]-[YYYY-MM-DD].md`
  (lower-case team; create the `rca-records/` folder if missing). Configure the base folder to wherever
  your team keeps engineering records.
- One record per file.

## Done-bar (all must hold before the fix is "Done")
- [ ] Root cause is **systemic** (a process/design gap), not a person or a symptom.
- [ ] There is **exactly one** concrete prevention, with an owner and a home.
- [ ] It's linked to the ticket, and the fix isn't marked Done without it.
- [ ] The failure class is tagged.

## Quality gate (all must hold)
- [ ] Structure matches the template above field-for-field, in order.
- [ ] The done-bar is satisfied (or the record is explicitly marked incomplete with what's missing).
- [ ] Origin label is from the closed set; exactly one prevention; failure class tagged.
- [ ] File saved to the `rca-records/` path with the correct name.
- [ ] Terminology clean — "QA engineer" / "test engineer", never "manual tester".
