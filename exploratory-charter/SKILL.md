---
name: exploratory-charter
description: >-
  Generate session-based exploratory testing charters for a feature, area, or
  build — each with a mission, timebox, test ideas, heuristics and oracles,
  personas to adopt, a soap-opera scenario, data setup needs, and a session sheet
  to record results. Use this whenever someone wants to do exploratory testing,
  asks for a test charter, asks "what should I poke at" or "how should I explore
  this feature", mentions session-based testing, persona testing, or soap-opera
  testing, or wants structured-but-unscripted testing beyond their automated
  checks. Trigger even when the user just says "I need to test this new feature and
  don't know where to start" — charters are the structured way in.
origin: "badquality-lab"
---

# Exploratory Charter Generator

You generate **session-based exploratory testing charters** — the structure that
makes exploratory testing disciplined, focused, and reportable, rather than
aimless clicking.

Two things to respect:

1. **Exploratory testing is not ad hoc testing.** It is "simultaneous test design,
   test execution, and learning." It is a *mindset* applied with
   skill and preparation, guided by a mission — not improvisation. Your charters
   give it that guiding structure.

2. **It is where the serious bugs hide.** Exploration finds the problems that
   scripted and automated tests can't, because it emphasizes *variation* and human
   judgment over *repetition*. In an agile team covered by automated regression,
   the tester has both the confidence and the mandate to go hunting for the new
   and the unexpected.

A charter is a chartered *mission*, not a script. It says where to point attention
and what tools/heuristics to bring; the tester decides moves in the moment, letting
each result inform the next.

## When to use

Any time someone is about to explore a feature, a freshly "done" story, a bug-prone
area, or a new build — and wants focus without a rigid script. Also when reviewing
whether "done" stories are really done.

## Inputs to gather

- The target: feature/area/build under test, and what it's supposed to do
- Known risks, recent changes, or areas that have been buggy before
- The user types involved (for personas) and the domain (for realistic scenarios)
- What test data is needed and whether it's hard to create
- Timebox preference (default 60–90 min per session)

If you don't know the risks, derive plausible ones from the feature and mark them
as assumptions — risk is the primary driver of good charters.

## Charter format

Use this charter template as the mission statement of each
charter:

> **Explore** _(target)_ **with** _(resources)_ **to discover** _(information)_.

Then expand each charter with the working detail below.

## The procedure

Produce a **small set of focused charters** (typically 3–6), each scoped to one
session. Resist one giant charter — timeboxed focus is the point. For each charter:

### 1. Charter statement
The "Explore… with… to discover…" line. Specific target, specific information goal.

### 2. Timebox
Default 60 or 90 minutes. One mission per session.

### 3. Test ideas & areas
The specific things to try. Generate these from established sources of test ideas:
- **Risk** — what you and the customer think could go wrong and would make people
  unhappy. Lead with this.
- **Models** — how the software *should* behave; test against that mental model.
- **Past experience** — how similar systems have failed in predictable patterns.
- **What developers tell you** — "what's important / fragile to us."
- **What you learn while testing** — leave room to follow new trails.

### 4. Heuristics & oracles to apply
Name concrete heuristics so the tester has technique on tap, e.g.:
- Boundaries, equivalence classes, zero/one/many, off-by-one
- CRUD lifecycle (create/read/update/delete the entity)
- SFDIPOT touring (Structure, Function, Data, Interfaces, Platform, Operations,
  Time) for coverage
- "Follow the smell" — pursue anything that looks odd
- Oracles: comparable products/competitors, prior versions, the spec, consistency
  with the rest of the product, user expectations

### 5. Personas to adopt
Invent 2–4 personas with distinct goals and skill levels and test the same flow as
each. Common persona examples in a retail domain: *Nancy Newbie* (nervous
first-timer), *Hudson Hacker* (looks to cheat checkout), *Enrico Executive* (power
user, bulk + international), *Betty Bargain*, *Debbie Ditherer* (can't decide).
Tailor personas to the actual domain. Optionally use the "famous character" trick:
how would the Queen of England, or Homer Simpson, get through this flow?

### 6. Soap-opera scenario
Write one exaggerated, compressed, real-life-but-dramatic end-to-end scenario that
chains several processes together ("soap opera testing"). Ask "what's the
worst thing that could happen, and how?" For example: a warehouse receives
100 of a hot toy, releases preorders, a forklift smashes the shelf, 14 survive and
get re-added — now how many show as available on the site? These tangled scenarios
teach more about real user needs than narrow scripted checks.

### 7. Data & setup needs
What data must exist, whether it's realistic (real data flows differently than
made-up data), and how to get it. Flag if setup will eat session time.

### 8. Session sheet (to fill during the session)
Provide a ready-to-use note template so results are reportable. Session-based test
management divides time into three task types — include all three:

```
Charter:        <the mission statement>
Tester / Date:  
Timebox:        90 min
--- Time breakdown (track roughly) ---
  Session setup:        __ min
  Test design & exec:   __ min
  Bug investigation:    __ min
--- Notes (what I did, what I saw) ---
--- Bugs found ---
--- Issues / questions (non-bugs, obstacles, ideas) ---
--- New test ideas / candidates for automation ---
--- Follow-up charters spawned ---
```

The setup-vs-execution time split matters: it tells the team where time actually
goes and whether setup needs to be automated away.

## Output format

A document titled **`Exploratory Charters: <target>`** containing a short intro
line (target + dominant risks) and then each charter as a numbered section with the
eight parts above. The final session sheet can be given once as a reusable template
if all charters share it. No preamble.

## Quality bar

- Charters are **focused and distinct** — not one mega-charter, not six that
  overlap. Each could genuinely fill its own timebox.
- Test ideas are **risk-led and specific to this feature**, not a generic checklist.
- The soap-opera scenario is genuinely tangled and ends in a **checkable question**
  ("how many show as available?"), not a vague "test everything."
- Personas have **different goals**, so the same flow yields different findings.
- You distinguished exploration from ad hoc testing — these charters guide, they
  don't script.

## Background

Grounded in long-established exploratory and session-based testing practice:
charters framed as missions ("Explore <target> with <resources> to discover
<information>"), timeboxed sessions, heuristic touring, persona testing, and
soap-opera scenarios.
