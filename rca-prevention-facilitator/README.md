# RCA + Prevention Facilitator — a Claude agent (with bundled skills)

> **Turn a critical bug into a lesson that can't come back.**

A self-contained agent that facilitates a blameless **Root-Cause + Prevention** session on a SEV1 or a
rollback and writes the result to a structured `.md` record — unaided, with only the incident as input.
It runs the 5 Whys down to a *systemic* cause, sweeps contributing factors, designs **exactly one**
buildable prevention, and enforces a done-bar: *the fix isn't "Done" until the root cause and the
prevention are written down.*

Works in **Claude Code** (agent + skills) and **Antigravity / Gemini** (skills). Ships with its six
skills bundled inside `skills/`, so it works out of the box.

---

## Why this exists

When something critical breaks, the usual reflex is: patch the symptom, ship, move on. The symptom is
gone — but the *reason* it happened is still there, so the same **class** of bug returns later in a new
disguise. You keep paying to fix the same wound.

This agent forces the two questions that stop that:

- **Root cause** — *why did this actually happen?* (the systemic gap, not the symptom you patched)
- **Prevention** — *what one guard did we put in place so this class can't silently return?*

A record without a prevention is just a story. The prevention is the point.

---

## What you get

| Artifact | Role |
|---|---|
| **`rca-prevention-facilitator.md`** (agent) | Runs the whole session end-to-end; orchestrates the six bundled skills |
| [`skills/rca-session-facilitator`](skills/rca-session-facilitator/) | The session flow: intake → 5 Whys → factors → prevention → record |
| [`skills/rca-five-whys`](skills/rca-five-whys/) | Drives to a systemic cause; rejects person-blame and symptom-stopping |
| [`skills/rca-ishikawa`](skills/rca-ishikawa/) | Contributing factors across Process · People · Tooling · Requirements · Environment |
| [`skills/rca-prevention-design`](skills/rca-prevention-design/) | Converts the cause into one concrete, buildable guard (+ modern-tooling map) |
| [`skills/rca-record-writer`](skills/rca-record-writer/) | Emits the exact record template; enforces the done-bar |
| [`skills/rca-knowledge-grounding`](skills/rca-knowledge-grounding/) | On request, the principle behind a step (separated from application) |

Each bundled skill is independently usable — you can invoke `rca-five-whys` on its own — but the agent
ties them into one facilitated session.

---

## How to install & use

**Claude Code**
```bash
# install the agent
cp rca-prevention-facilitator/rca-prevention-facilitator.md ~/.claude/agents/

# install the bundled skills so the agent can call them
cp -r rca-prevention-facilitator/skills/* ~/.claude/skills/
```
Or run the bundled self-installer from inside the package folder:
```bash
cd rca-prevention-facilitator
chmod +x install.sh
./install.sh --global      # ~/.claude (every project)   ·   --project (this repo)   ·   --antigravity
./install.sh               # interactive · add --dry-run to preview
```
Then **restart Claude Code** so it discovers the new agent and skills.

**Antigravity / Gemini** — place the skill folders under `.agents/skills/`:
```bash
cp -r rca-prevention-facilitator/skills/* .agents/skills/
```

---

## How to work with it

### 1. Trigger it on the right incident
Run a session for **every SEV1 or every rollback** — that's the trigger, no debate. It's deliberately a
small number of high-leverage sessions, not a burden on every bug.

### 2. Start the session
Just describe the incident. Any of these will invoke the agent in Claude Code:

```
We had a SEV1 — SVC-4821, A/B events shipped without timestamps, caught in
production after 3 days. Run the RCA and write the record.
```
```
We rolled back yesterday's release. Facilitate a blameless root-cause and
prevention session for us.
```
```
Do a blameless postmortem on this crash and give me one prevention we can build.
```

### 3. What it does (≈30–45 min, blameless, one pass)
1. **Frame** — states the ground rule: *analyse the system, never the person.*
2. **Intake** — ticket, date, team, severity/priority, origin label, what happened, time-to-detect.
3. **5 Whys** — chains "why?" past the symptom to a systemic gap; refuses "someone made a mistake."
4. **Contributing factors** — sweeps the five Ishikawa categories; records only what applies.
5. **Prevention** — designs **one** concrete guard (test / validation / checklist / gate) with an owner
   and a home; rejects "be more careful."
6. **Record** — tags the failure class and writes the file; checks the done-bar.

It answers your questions as it goes; you supply the facts. Ask *"why do we do this step?"* and it gives
you the principle behind it, separated from how it applies to your team.

### 4. What you get out
- A record file at `rca-records/rca-[team]-[ticketID]-[YYYY-MM-DD].md`.
- A 3–5 line summary in chat: **root cause + the one prevention + failure class**, plus any follow-up owner.

---

## The record template

```
# RCA + Prevention Record — [ticket ID]

## Incident header
- Ticket / link:   - Date:   - Team:   - App(s) / service(s) affected:
- Severity (SEV1–4):   Priority (P1–3):   Origin label:

## What happened
[2–3 sentences: symptom + user/business impact]

## Detection
- How & when found (origin label):   - Time-to-detect (how long it was live):

## Root cause (5 Whys)
1. Why? →   … 5. Why? →
ROOT CAUSE (systemic):

## Contributing factors (Ishikawa — only those that apply)
- Process:  - People:  - Tooling:  - Requirements:  - Environment:

## Prevention (ONE concrete guard)
- What (test / validation / checklist item / gate):
- Where it lives:   - Owner:   - Built now / follow-up:

## Failure class tag
[reusable label for recurring-class tracking]
```

A worked example is in [`examples/`](examples/).

**A record is "Done" when:** the root cause is systemic (not a person, not a symptom) · there's exactly
one concrete prevention with an owner and a home · it's linked to the ticket · the failure class is tagged.

---

## When to use it — and when not

**Use it for:** SEV1s, rollbacks, blameless postmortems, any critical incident you want to convert into a
permanent guard and a searchable record.

**Don't use it for:** routine bug triage, feature design, or low-severity issues — it's intentionally
scoped to the incidents that most repay a 30-minute analysis. If the incident is neither SEV1 nor a
rollback, the agent will say so and stop.

---

## Design principles

- **Blameless.** The root cause is always systemic — a process, design, or contract gap — never a person.
- **One prevention, built to last.** Not a wish-list; the single guard that kills the whole failure class.
- **Evidence before assertion.** The agent states only principles it can stand behind and never invents a
  source or citation.
- **Consistency over cleverness.** Every critical incident gets the *same* disciplined pass and the *same*
  record shape, so recurring failure classes become visible over time.

---

Grounded in long-established agile-testing, quality-coaching, and API-contract-testing practice.
MIT — see the repo [`LICENSE`](../LICENSE). Part of [BAD Quality Lab](https://github.com/iggmasterdev/badquality-lab).
