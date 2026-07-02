# BAD Quality Lab

**Agents and skills for QE / QA / QC and test engineers — by Igor Goldshmidt.**

A growing toolset of practical, ready-to-use AI agents and skills that help testing
and engineering teams build quality in: refine stories before coding, plan test
coverage that nothing falls through, run sharper exploratory sessions, and make fast,
consistent calls on bugs. Each one works in **Claude Code** and **Antigravity /
Gemini**.

> Part of the **BAD Quality** brand. <!-- site: add your URL here -->

## Packages

Each folder is an **independent, self-contained package** with its own `README.md`
explaining *what it does, when to use it, and how*. Take the whole set, or just the
one you need.

| Package | Type | What it gives you | For |
|---------|------|-------------------|-----|
| [`agile-tester/`](agile-tester/) | **agent** (skills bundled inside) | A whole-team tester teammate that walks an iteration end to end and calls the four skills at the right moments. | QA + Dev |
| [`rca-prevention-facilitator/`](rca-prevention-facilitator/) | **agent** (skills bundled inside) | Facilitates a blameless Root-Cause + Prevention session on a SEV1/rollback: 5 Whys to a systemic cause, then exactly one buildable prevention, written to a structured record. | QA + Dev |
| [`example-mapping/`](example-mapping/) | skill | Story → clarifying questions, concrete examples, acceptance criteria (Given/When/Then), impact analysis, and a ready/not-ready verdict. | QA + Dev |
| [`testing-quadrants-mapper/`](testing-quadrants-mapper/) | skill | Feature/release → a complete coverage plan across the four testing quadrants, surfacing the test types teams forget. | QA + Dev |
| [`exploratory-charter/`](exploratory-charter/) | skill | Feature → session-based exploratory testing charters: mission, heuristics, personas, soap-opera scenarios, session sheet. | QA |
| [`bug-triage-advisor/`](bug-triage-advisor/) | skill | Bug → defect-or-feature, log-or-talk, fix now/later/never, which medium — adapted to your team's policy. | QA + Dev |

The four standalone skills stand completely alone. The two agents —
**`agile-tester`** and **`rca-prevention-facilitator`** — each bundle the skills they
use inside `skills/` so they work out of the box. Pick an agent for a full workflow,
or a single skill for one isolated job.

## Quick start

Pick a package and follow its README. In short:

```bash
# a single skill (Claude Code)
cp -r example-mapping ~/.claude/skills/

# the agent + its skills (Claude Code)
cp agile-tester/agile-tester.md ~/.claude/agents/
cp -r agile-tester/skills/* ~/.claude/skills/
```
For Antigravity / Gemini, place skill folders under `.agents/skills/` instead.

## Design principles

1. **Modern tooling, not legacy.** Every skill maps its advice to current tools —
   Playwright/Cypress, JUnit5/pytest/Vitest, Cucumber/SpecFlow, k6/Gatling, OWASP
   ZAP.
2. **Practical over theoretical.** Each package encodes a repeatable procedure or
   judgment call a team would otherwise do from memory and inconsistently.
3. **Whole-team, not QA-only.** These tools serve testers and developers alike.

## License

MIT — see [LICENSE](LICENSE). Grounded in long-established agile testing practice.
