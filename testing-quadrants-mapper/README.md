# Testing Quadrants Mapper — a Claude skill

> Map any feature, story, or release to the four **testing quadrants** and get a
> complete coverage plan — what to test, who owns it, automated vs manual, when, and
> with which modern tools — that deliberately surfaces the test types teams forget.

A self-contained skill for **Claude Code** and **Antigravity / Gemini**. For **QA
engineers and developers** both.

---

## What it does

Left to memory, teams reliably cover the tests that drive development (unit tests,
functional tests) and forget the tests that critique the finished product
(exploratory, UAT, performance, security). This skill makes the **whole picture**
visible by mapping the thing under test across four quadrants:

| | Business-facing | Technology-facing |
|---|---|---|
| **Support the team** | **Q2** — functional / story / acceptance / API tests | **Q1** — unit & component tests, TDD |
| **Critique the product** | **Q3** — exploratory, usability, UAT, scenario testing | **Q4** — performance, load, security, reliability, the "-ilities" |

For each quadrant it gives **feature-specific** entries: what to test, the owner,
automated vs manual, suggested **modern** tools, and timing — plus a **Gaps & Risks**
section that calls out exactly where you're under-investing (almost always Q3 and Q4).

It also enforces a critical rule: **the quadrant numbers are not an execution order.**
If performance is critical, Q4 load testing happens as soon as there's testable code —
not at the end.

## When to use it

Trigger it whenever you are:
- Planning what tests a story or release needs
- Building or reviewing a test strategy
- Auditing an existing plan for gaps ("am I missing any kind of testing?")
- Deciding the automated-vs-manual split, or worried about a GUI-heavy ("inverted")
  test pyramid

It fires even when you just describe a feature and ask "how should I test this" — the
quadrants are the right lens for a *complete* answer.

**When *not* to use it:** agreeing what a story should *do* before coding (use
`example-mapping`), or generating exploratory session charters (use
`exploratory-charter`).

## How to use it

**Claude Code**
```bash
cp -r testing-quadrants-mapper ~/.claude/skills/
```
**Antigravity / Gemini**
```bash
cp -r testing-quadrants-mapper .agents/skills/
```
Then describe what's under test in natural language. Give it your tech stack and any
known SLAs/risks so the tooling and timing advice are concrete, not generic.

## What you get

A document titled `Quadrant Coverage Plan: <thing under test>` containing a one-line
risk summary, the four-quadrant table, a **Gaps & Risks** section (the most valuable
part — what's likely missing and how to sequence by risk), and a one-line test-pyramid
sanity check. Paste-ready.

## Modern tooling it maps to

- **Q1**: JUnit5, pytest, Vitest/Jest, xUnit, Go testing
- **Q2**: Cucumber/SpecFlow/pytest-bdd, REST-assured, Playwright API, Schemathesis
- **Q3**: session-based exploratory testing, Playwright/Selenium for data setup
- **Q4**: k6 / Gatling / JMeter / Locust (perf), OWASP ZAP / Burp / Semgrep
  (security), Lighthouse (web perf)

## Background

Grounded in long-established agile testing practice — the four testing quadrants and
the test automation pyramid.

Part of **BAD Quality Lab** by Igor Goldshmidt.
