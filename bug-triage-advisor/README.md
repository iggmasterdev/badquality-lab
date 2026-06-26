# Bug Triage Advisor — a Claude skill

> For any bug, make the four decisions fast and consistently: **is it a defect or a
> feature? log it or just talk? fix now / later / never? which medium?** — driven by a
> clear decision model and *your team's* policy.

A self-contained skill for **Claude Code** and **Antigravity / Gemini**. For **QA
engineers and developers** both.

---

## What it does

Every bug forces four decisions, and teams make them inconsistently — letting defect
queues pile up into a queue of rework and a collection point for waste. This skill
walks a clear decision model and gives a reasoned recommendation for each:

1. **Defect or feature/change request?** — by the rule of thumb: it's about the user's
   perception; if the customer calls it a defect, it's a defect (and often the label
   matters less than the priority).
2. **Log it, or just talk?** — default to a conversation; only log if it's a real
   problem demanding a change, or it might otherwise be forgotten.
3. **Fix now / later / never?** — with the reasoning (cost-of-delay, destabilization
   risk, who must prioritize). "Never" is a valid answer — and then you *close* it,
   not leave a zombie ticket open.
4. **Which medium?** — a failing test, a task card, a defect tracker, or nothing.

It also applies the right **default path by where the bug was found** (current story
vs regression suite vs unit test vs legacy vs post-iteration vs production) — because
that changes the answer.

## Configurable to your team — there is no single right policy

Teams handle bugs many valid ways, so this skill **adapts**:
- **Give it your policy** and it follows it. A fill-in template lives at
  [`references/team-policy-template.md`](references/team-policy-template.md) —
  zero-bug tolerance, WIP limits on bug cards, who prioritizes, where you record, etc.
- **No policy?** It asks up to three quick calibrating questions, or proceeds with
  sensible defaults if you want speed.

## When to use it

Trigger it whenever you are:
- Deciding what to do with a specific bug ("should I log this?")
- Unsure whether something is a bug or a change request
- Deciding "fix now or later"
- Designing or tightening your team's bug-handling policy

**When *not* to use it:** finding bugs in the first place (use `exploratory-charter`)
or writing the regression test that captures one (your test framework).

## How to use it

**Claude Code**
```bash
cp -r bug-triage-advisor ~/.claude/skills/
```
**Antigravity / Gemini**
```bash
cp -r bug-triage-advisor .agents/skills/
```
Describe the bug, where it was found, and its impact. Optionally point it at your
filled-in `team-policy.md`.

## What you get

A short, decisive recommendation titled `Bug Triage: <one-line summary>` covering
classification, log decision, fix timing, the concrete next action (e.g. "write a
failing test, fix this iteration, no tracker entry"), and a policy flag if you're about
to breach a WIP limit. Triage should be a fast, defensible call — not an essay, and
this keeps it that way.

## Background

Grounded in long-established lean and agile defect-handling practice — a defect queue
is a queue of rework, so the bias is toward a fast conversation and fix over an
accumulating backlog.

Part of **BAD Quality Lab** by Igor Goldshmidt.
