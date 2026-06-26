# Agile Tester — a Claude agent (with bundled skills)

> A whole-team **agile tester teammate** that walks a story or an iteration end to end
> — from planning, through coding-and-testing, to wrap-up — and pulls in four
> specialized skills at the right moments.

A self-contained agent package for **Claude Code** (and usable as a long-running role
in **Antigravity** Agent Manager). It ships **with its four skills bundled inside**
(`skills/`), so it works out of the box.

---

## What it is

Not a gatekeeper, not a separate QA phase at the end — a **teammate** whose job is to
help the whole team *build quality in*: ask the right questions early, make testing
visible, collaborate with developers and customers, and keep quality a shared
responsibility. It embodies the core agile-testing principles as behavior (continuous
feedback, face-to-face over tickets, whole-team ownership, courage to say a story
isn't ready) and explicitly avoids the "quality police" mentality.

Most of its value is **orchestration and judgment** — knowing *which* tool to reach
for *when*. The heavy lifting is done by the four bundled skills:

| Bundled skill | The agent uses it to… | At this moment… |
|---|---|---|
| [`example-mapping`](skills/example-mapping/) | turn a story into questions, examples, acceptance criteria, impact, and a ready/not-ready verdict | planning / refining a story |
| [`testing-quadrants-mapper`](skills/testing-quadrants-mapper/) | build a complete coverage plan across Q1–Q4 and expose forgotten test types | deciding what testing a story or release needs |
| [`exploratory-charter`](skills/exploratory-charter/) | generate session-based charters to hunt the serious bugs | a story is "done" and needs real exercising |
| [`bug-triage-advisor`](skills/bug-triage-advisor/) | decide log/talk, fix now/later/never, and which medium | a bug appears and a call is needed |

Each bundled skill is also published **standalone** — use the agent when you want a
partner for the *full lifecycle*; use a single skill when you want one isolated
artifact.

## What it does, phase by phase

It diagnoses where the team is and acts accordingly (it won't force all phases every
time):

1. **Release / iteration planning** — pressure-tests story readiness with
   `example-mapping`; plans which Q3/Q4 activities (UAT, performance, security) must
   happen *now*, not late, with `testing-quadrants-mapper`; favors lightweight plans.
2. **Iteration kickoff** — ensures stories are testable ("an example goes a long way
   toward testing the testability"); produces high-level acceptance tests from
   examples and reviews them with customers *and* programmers.
3. **Coding & testing (together)** — start simple then add complexity; pair with
   programmers and strengthen *their* unit tests rather than catching everything
   downstream; run `exploratory-charter` sessions to find what the examples missed;
   triage bugs with `bug-triage-advisor`, biasing toward a conversation and a fast
   fix; watch for the end-of-iteration "testing crunch".
4. **Wrap-up** — confirm true doneness against conditions of satisfaction; bring
   Start/Stop/Continue items to the retro; protect sustainable pace.
5. **Release / delivery** — plan the end game: release-candidate testing on staging,
   final non-functional checks, integration, data conversion, installation testing,
   UAT, and explicit release acceptance criteria.

## When to use it

Use the **agent** when you want a testing partner across the *whole life* of a story
or sprint — planning what's ready, deciding coverage, running exploration, triaging
bugs, keeping quality whole-team.

Use a **single bundled skill directly** when you only need one isolated artifact (just
acceptance criteria, just a charter, just a triage call).

## How to install & use

**Claude Code**
```bash
# install the agent
cp agile-tester/agile-tester.md ~/.claude/agents/

# install the bundled skills so the agent can call them
cp -r agile-tester/skills/* ~/.claude/skills/
```
Then invoke the agent for lifecycle work — e.g. "act as my agile tester for this story
and get it ready for the sprint." It will diagnose the phase and call the right skills.

**Antigravity / Gemini**
Load `agile-tester.md` as a role/agent in Agent Manager and place
`agile-tester/skills/*` under `.agents/skills/`. The orchestration logic is
platform-independent.

## Package contents

```
agile-tester/
├── README.md              ← you are here
├── agile-tester.md        ← the agent definition
└── skills/                ← the four skills it orchestrates (bundled for self-containment)
    ├── example-mapping/
    ├── testing-quadrants-mapper/
    ├── exploratory-charter/
    └── bug-triage-advisor/   (+ references/team-policy-template.md)
```

## Background

Grounded in long-established agile testing practice — the whole-team approach to
quality, the core agile-testing principles, and the rhythm of an iteration: planning,
coding-and-testing together, wrap-up, and release.

Part of **BAD Quality Lab** by Igor Goldshmidt.
