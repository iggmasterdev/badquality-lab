# Team Bug Policy

Fill this in once with your team and keep it next to your board or in your wiki.
The `bug-triage-advisor` skill reads it (or you paste it in) so its
recommendations match how YOUR team actually works. There is no universally right
policy — experienced teams handle this many valid ways. This just makes your choices explicit and
consistent.

## 1. Defect target
- [ ] **Zero tolerance** — we aim for zero open bugs at end of iteration and zero
      at release.
- [ ] **Bounded** — we tolerate a capped number of open bugs (see WIP limit).
- [ ] **Backlog-managed** — bugs are prioritized against features by the PO.

## 2. WIP limit on bugs
- Maximum open bugs at any time: **____** (e.g. 10).
- When we exceed it, we: ____________________________________
  (e.g. "stop feature work and burn down bugs", or "run a root-cause review at the
  next retrospective").

## 3. Who prioritizes
- In-iteration story bugs: **____** (default: the team / the dev on the story).
- Bugs that escape the iteration or come from production: **____**
  (default: product owner / customer).

## 4. Default fix timing
- Bug found while building the current story → **____** (default: fix now).
- Bug found in regression / build → **____** (default: investigate + fix now to
  keep the build green).
- Pre-existing legacy bug → **____** (default: triage with PO, likely backlog).
- Low-priority / obscure → **____** (default: never fix → close it).

## 5. Where we record bugs (media)
- Fixed immediately in conversation → **no record** / a failing test only.
- This-iteration fix → **____** (default: task card on the board, e.g. a pink/red
  sticky).
- Survives the iteration / needs traceability / feeds support or metrics → **DTS**:
  ____________________ (tool name).
- Every bug fix should add a **regression test** that reproduces it: **yes / no**.

## 6. Rules & signals
List any standing rules, e.g.:
- "The number of bug cards must never exceed 10; revisit each retrospective."
- "If the bug trend is rising, do root-cause analysis and add a new prevention
  rule."
- "Zero-bug iteration: the iteration isn't done until the bug count is zero."

## 7. Classification convention (optional)
How we tell a defect from a change request post-UAT, and who makes the call when
it's ambiguous (default: Power of Three — PO + dev + tester).

---
_Template from the `bug-triage-advisor` skill — badquality-lab._
