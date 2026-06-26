# Exploratory Charter Generator — a Claude skill

> Generate **session-based exploratory testing charters** for any feature or build —
> each with a mission, timebox, risk-led test ideas, heuristics, personas, a
> soap-opera scenario, data needs, and a ready-to-fill session sheet.

A self-contained skill for **Claude Code** and **Antigravity / Gemini**. Primarily for
**QA engineers**, useful to any developer doing their own exploratory pass.

---

## What it does

Exploratory testing is where the serious bugs hide — but unstructured, it drifts into
aimless clicking. This skill gives it structure without scripting it. It turns a
feature or area into a small set of **focused charters** (typically 3–6), each scoped
to one timeboxed session, using a simple charter template:

> **Explore** *(target)* **with** *(resources)* **to discover** *(information)*.

Each charter expands into: a timebox, **risk-led test ideas**, concrete **heuristics
and oracles** to apply (boundaries, CRUD, SFDIPOT, comparison oracles), **personas**
to adopt, an exaggerated **soap-opera scenario** that chains processes end-to-end,
**data/setup needs**, and a **session sheet** that tracks setup vs design-and-execution
vs bug-investigation time so results are reportable.

It respects a hard line: **exploratory testing is not ad hoc testing.** It is
disciplined, prepared, mission-guided work — simultaneous test design, execution, and
learning. The charters guide; they don't script.

## When to use it

Trigger it whenever you are:
- About to explore a feature, a freshly "done" story, or a new build
- Asking "what should I poke at?" / "how should I test this — I don't know where to
  start"
- Doing session-based, persona, or soap-opera testing
- Wanting structured-but-unscripted testing beyond your automated checks

**When *not* to use it:** writing the up-front acceptance criteria (use
`example-mapping`) or planning coverage across test *types* (use
`testing-quadrants-mapper`). This skill is specifically about critiquing the working
product (Quadrant 3).

## How to use it

**Claude Code**
```bash
cp -r exploratory-charter ~/.claude/skills/
```
**Antigravity / Gemini**
```bash
cp -r exploratory-charter .agents/skills/
```
Describe the target and, if you can, the known risks, the user types (for personas),
and the domain (for realistic scenarios). The more risk context you give, the sharper
the charters.

## What you get

A document titled `Exploratory Charters: <target>` — a short intro line plus each
charter as a numbered section, and a reusable session-sheet template. Hand it to a
tester and they can start a focused session immediately.

## Background

Grounded in long-established exploratory and session-based testing practice — charters
as missions, timeboxed sessions, heuristic touring, persona testing, and soap-opera
scenarios.

Part of **BAD Quality Lab** by Igor Goldshmidt.
