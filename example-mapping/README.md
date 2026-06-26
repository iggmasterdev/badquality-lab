# Example Mapping — a Claude skill

> Turn a raw user story into a shared, testable specification **before** anyone
> writes code: clarifying questions, concrete examples, acceptance criteria
> (Given/When/Then), impact analysis, and an honest "ready / not ready" verdict.

A self-contained skill for **Claude Code** and **Antigravity / Gemini**. Works for
**both QA engineers and developers** — the pre-coding conversation belongs to the
whole team.

---

## What it does

Most teams jump from a one-line story straight to code (or straight to test cases)
and discover the disagreements later, expensively. This skill runs the conversation
that should happen first. Given any story — even a single sentence — it produces a
**Story Discovery** document with seven parts:

1. **Restated story** + the problem it solves + who gets value
2. **Clarifying questions** — the sharp ones that expose hidden assumptions
3. **Conditions of satisfaction** — what must be true for the customer to accept it
4. **Rules + concrete examples** — real values, happy path *and* undesired behavior
5. **Acceptance criteria** as Given/When/Then scenarios, mapped back to the rules
6. **Ripple effects** — the parts of the system this "small" story actually touches
7. **Readiness verdict** — a decisive READY / NOT READY, and *who* must resolve any
   open question (the "Power of Three": product owner + developer + tester)

Its core move: **don't ask for requirements, ask for examples.** People can't always
state what they want in the abstract, but they can give you a concrete example — and
examples expose the rules that become tests.

## When to use it

Trigger it whenever you are:
- Refining or grooming a story; preparing for a three-amigos / refinement session
- Writing or reviewing acceptance criteria
- Checking a Definition of Ready ("is this story ready to build?")
- Handed a thin or ambiguous story and not sure what to ask

It fires even if you just paste a story and ask for "test cases" or "BDD scenarios" —
because the right first move is to agree the examples, not encode one person's guess.

**When *not* to use it:** writing the automated test code itself (that's your test
framework), or planning test *coverage* across types (use the
`testing-quadrants-mapper` skill for that).

## How to use it

**Claude Code**
```bash
cp -r example-mapping ~/.claude/skills/
```
Then just describe your situation in natural language — "help me refine this story
before sprint planning: …". The skill triggers on intent; no command to memorize.

**Antigravity / Gemini**
```bash
cp -r example-mapping .agents/skills/
```
The same `SKILL.md` is compatible. Place it under your skills directory and invoke it
from chat by intent.

## What you get

A single clean Markdown document titled `Story Discovery: <story name>` — ready to
paste straight into a Jira/Linear ticket or a wiki. No preamble, no meta-talk; just
the artifact your team acts on.

**Quality bar the skill holds itself to:** real values in examples (not "some input →
some output"), at least one undesired-behavior example, at least one non-obvious
ripple effect, a *decisive* verdict, and — importantly — it does **not** invent
business rules; unknowns are listed as unknowns.

## Why it helps

The hard part of story refinement isn't writing Given/When/Then — it's the discipline
teams skip under time pressure: naming *who* must decide an open question, listing the
ripple effects a small story sends across the system, giving a decisive ready/not-ready
call, including the negative cases, and refusing to fabricate acceptance criteria from
a one-line story. This skill makes that discipline consistent, every time.

## Take it into automation

When you're ready to turn the Given/When/Then criteria into executable tests, use a
modern BDD runner: **Cucumber** (Ruby/JS), **SpecFlow/Reqnroll** (.NET),
**Behave / pytest-bdd** (Python), or **Cucumber-JVM** (Java).

## Background

Grounded in long-established agile testing practice — example-driven specification,
conditions of satisfaction, and "three amigos" collaboration across product,
development, and testing.

Part of **BAD Quality Lab** by Igor Goldshmidt.
