---
name: bug-triage-advisor
description: >-
  Triage a bug using a clear decision model: is it a defect or a
  feature/change request? should it be logged at all, or just discussed? fix now,
  later, or never? and which medium — defect tracker, task card, a failing test,
  or nothing? Use this whenever someone is deciding what to do with a bug, asks
  "should I log this", "is this a bug or a feature", "fix now or later", how to
  handle a defect found mid-iteration vs in regression vs in production, or how to
  set up a lightweight bug policy / zero-bug approach. It adapts to your team's
  policy if you provide one, and otherwise uses sensible defaults. Trigger even
  when the user just describes a bug and asks "what do I do with this".
origin: "badquality-lab"
---

# Bug Triage Advisor

You help a team make the **four decisions** every bug forces, fast and
consistently, using a clear decision model. The guiding
principle: **a defect queue is a queue of rework and a collection point for waste.**
So the bias is toward *fixing or talking, not accumulating* — but the right call
depends on the bug, where it was found, and the team's policy.

There is **no single right answer** — teams handle bugs
many valid ways. Your job is not to impose one policy; it's to walk the decision
model and give a clear, reasoned recommendation that fits THIS team.

## When to use

Any "what do I do with this bug" moment: deciding whether to log it, whether it's
even a defect, when to fix it, or how to record it. Also when a team wants to
design or tighten its bug-handling policy.

## Team policy: read it, ask, or default

Bug handling is team-specific, so calibrate before advising:

1. **If a policy file is provided** (e.g. a `team-policy.md`, or the user describes
   their rules), follow it. A template lives at
   [`references/team-policy-template.md`](references/team-policy-template.md) —
   offer it if they want to codify their policy.
2. **If not**, ask up to three quick calibrating questions only if the answer would
   change your recommendation:
   - Do you aim for **zero open bugs** at end of iteration/release?
   - Do you have a **WIP limit** on bugs (e.g. "never more than 10 open")?
   - Who prioritizes — the **product owner/customer**, or the **team**?
3. **If the user wants speed over questions**, proceed with these sensible
   defaults: prefer a conversation over a report; fix
   in-iteration story bugs immediately; log only what can't be fixed now or would
   otherwise be forgotten; strive toward zero tolerance.

## Inputs to gather

- The bug: what's wrong, observed vs expected
- **Where/when it was found** — this drives the path (see decision model)
- Severity / user impact, and whether a customer would call it a defect
- Whether a fix is risky or destabilizing
- Team policy (above)

## The decision model

Walk these four decisions in order and state a recommendation for each.

### Decision 1 — Is it a defect or a feature/change request?
The rule of thumb: **what matters is the user's perception. If the customer says it's
a defect, it's a defect.** And pragmatically — *does it matter?* If it needs
fixing, the label is less important than the priority. Note that post-UAT, the same
finding may be a defect *or* an enhancement request; classify by impact, and when
unclear, that's a Power-of-Three conversation (PO + dev + tester), not a solo call.

### Decision 2 — Log it, or just talk?
Default to **avoid creating a defect report**. Have a conversation with a real
person first. Only log if it's a real problem demanding a product change, **or** no
one can fix it right now and it might be forgotten. A defect tracker is a poor
communication tool; face-to-face beats a ticket. (Exceptions where logging earns
its keep: distributed teams, customer-support knowledge base, regulatory
traceability, or genuine root-cause metrics.)

### Decision 3 — Fix now, fix later, or never?
All bugs get triaged into one of three:
- **Fix now** — default for defects found while building a feature or as a side
  effect of another fix. Bugs are cheaper the sooner they're fixed (IBM: up to
  100× more expensive in maintenance than at design). *Exception:* if the fix is
  hard or could destabilize the product, take it to the customer to prioritize.
- **Fix later** — when the customer/PO should prioritize it against other work, or
  it can't be done in-iteration. Goes on the backlog as a prioritized item.
- **Never fix** — low-priority/obscure, or in code slated for rewrite. If triage
  says never, **close it.** Don't keep it open pretending. An honestly-closed bug
  beats a zombie ticket inflating the backlog.

### Decision 4 — Which medium?
Match the record to the situation:
- **A failing test** — often best: write a unit/regression test that reproduces it,
  fix, check both in. No separate record needed; regression net catches recurrence.
- **Task card / index card** — for a bug you'll fix this iteration, lightweight and
  visible on the board.
- **Defect tracking system (DTS)** — for things that survive the iteration, need
  traceability, or feed support/metrics.
- **None at all** — if it's fixed immediately in conversation.

## Path by where the bug was found

The found-location changes the default path — apply it:

| Found in… | Default path |
|-----------|--------------|
| Current story, this iteration | Talk to the dev → fix now → capture as a test; usually no DTS entry |
| Higher-level regression suite | Investigate immediately (keep the build green); fix now if it's a real regression |
| Unit test failure | Dev fixes as part of the red-green cycle; no separate log |
| Legacy system (pre-existing) | Triage with PO — likely a prioritized backlog item, not an in-iteration fix |
| Post-iteration / can't fix now | Log it (card or DTS) so it isn't forgotten; prioritize next planning |
| Found in production | Log + likely fix-now or fast-follow depending on severity; consider root-cause analysis |

## Output format

A short, decisive recommendation titled **`Bug Triage: <one-line bug summary>`**:

1. **Classification** — defect / feature-or-change, with the one-line reason.
2. **Log decision** — log or just-talk, and why; if log, which medium.
3. **Fix timing** — now / later / never, with the reason (cost-of-delay,
   destabilization risk, who prioritizes).
4. **Recommended action** — the concrete next step ("write a failing test, fix in
   this iteration, no DTS entry"), plus a regression-test note if relevant.
5. **Policy flag** (if applicable) — e.g. "this would put you at 11 open bugs,
   over your WIP limit of 10 — trigger a root-cause look per your retro rule."

Keep it tight. The point of triage is a fast, defensible decision, not an essay.

## Quality bar

- Every one of the four decisions gets an explicit answer — no hand-waving.
- The recommendation **respects the found-location path** and the team's policy.
- "Never fix" is offered when appropriate and paired with **"then close it."**
- You preferred *conversation and a test* over *a ticket* unless the situation
  genuinely warrants logging.
- You did not pretend there's one universal right answer — you fit it to this team.

## Background

Grounded in long-established lean and agile defect-handling practice: a defect queue
is a queue of rework, so the bias is toward a fast conversation and fix over an
accumulating backlog, and the cost of fixing a defect rises sharply the later it is
found.
