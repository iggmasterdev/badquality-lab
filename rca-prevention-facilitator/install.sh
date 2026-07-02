#!/usr/bin/env bash
#
# Self-installer for the RCA + Prevention Facilitator (agent + 6 skills).
# Installs into Claude Code (global or project scope) or Antigravity/Gemini (project scope).
#
# Usage:
#   ./install.sh                     # interactive: asks scope, then installs
#   ./install.sh --global            # Claude Code, user-global (~/.claude)
#   ./install.sh --project [DIR]     # Claude Code, project scope (DIR/.claude, default: CWD)
#   ./install.sh --antigravity [DIR] # Antigravity/Gemini skills (DIR/.agents/skills, default: CWD)
#   ./install.sh --dry-run --project # print actions without copying
#
set -euo pipefail

PKG_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS=(rca-session-facilitator rca-five-whys rca-ishikawa rca-prevention-design rca-record-writer rca-knowledge-grounding)
DRY_RUN=0
SCOPE=""
TARGET_DIR=""

log()  { printf '  %s\n' "$*"; }
run()  { if [[ "$DRY_RUN" == 1 ]]; then echo "  [dry-run] $*"; else eval "$*"; fi; }

# ---- parse args -------------------------------------------------------------
while [[ $# -gt 0 ]]; do
  case "$1" in
    --global)      SCOPE="global";      shift ;;
    --project)     SCOPE="project";     shift; [[ "${1:-}" && "${1:0:2}" != "--" ]] && { TARGET_DIR="$1"; shift; } ;;
    --antigravity) SCOPE="antigravity"; shift; [[ "${1:-}" && "${1:0:2}" != "--" ]] && { TARGET_DIR="$1"; shift; } ;;
    --dry-run)     DRY_RUN=1;           shift ;;
    -h|--help)     grep '^#' "$0" | sed 's/^# \{0,1\}//'; exit 0 ;;
    *) echo "Unknown option: $1"; exit 1 ;;
  esac
done

# ---- interactive scope choice ----------------------------------------------
if [[ -z "$SCOPE" ]]; then
  echo "Where should the RCA + Prevention Facilitator be installed?"
  echo "  1) Claude Code — global   (~/.claude)          [available in every project]"
  echo "  2) Claude Code — project  (./.claude)          [this repo only]"
  echo "  3) Antigravity / Gemini   (./.agents/skills)   [skills only, this repo]"
  read -r -p "Choose 1/2/3: " choice
  case "$choice" in
    1) SCOPE="global" ;;
    2) SCOPE="project" ;;
    3) SCOPE="antigravity" ;;
    *) echo "Invalid choice."; exit 1 ;;
  esac
fi

# ---- resolve destinations ---------------------------------------------------
case "$SCOPE" in
  global)
    AGENTS_DEST="$HOME/.claude/agents"
    SKILLS_DEST="$HOME/.claude/skills"
    INSTALL_AGENT=1 ;;
  project)
    TARGET_DIR="${TARGET_DIR:-$PWD}"
    AGENTS_DEST="$TARGET_DIR/.claude/agents"
    SKILLS_DEST="$TARGET_DIR/.claude/skills"
    INSTALL_AGENT=1 ;;
  antigravity)
    TARGET_DIR="${TARGET_DIR:-$PWD}"
    SKILLS_DEST="$TARGET_DIR/.agents/skills"
    INSTALL_AGENT=0 ;;  # Antigravity/Gemini consume skills; the agent lives as a Claude Code file
esac

echo
echo "Installing RCA + Prevention Facilitator ($SCOPE scope)"
[[ "$DRY_RUN" == 1 ]] && echo "(dry run — nothing will be written)"
echo

# ---- install skills ---------------------------------------------------------
log "Skills → $SKILLS_DEST"
run "mkdir -p \"$SKILLS_DEST\""
for s in "${SKILLS[@]}"; do
  run "mkdir -p \"$SKILLS_DEST/$s\""
  run "cp \"$PKG_DIR/skills/$s/SKILL.md\" \"$SKILLS_DEST/$s/SKILL.md\""
  log "  ✓ $s"
done

# ---- install agent ----------------------------------------------------------
if [[ "$INSTALL_AGENT" == 1 ]]; then
  log "Agent → $AGENTS_DEST"
  run "mkdir -p \"$AGENTS_DEST\""
  run "cp \"$PKG_DIR/rca-prevention-facilitator.md\" \"$AGENTS_DEST/rca-prevention-facilitator.md\""
  log "  ✓ rca-prevention-facilitator"
fi

echo
echo "Done. Next steps:"
if [[ "$SCOPE" == "antigravity" ]]; then
  echo "  • Restart Antigravity/Gemini so it picks up the new skills in .agents/skills/."
  echo "  • Ask your agent to run a root-cause session on a SEV1 or rollback."
else
  echo "  • Restart Claude Code (or start a new session) so it discovers the agent + skills."
  echo "  • Try:  \"We had a SEV1 — run the RCA and write the record.\""
  echo "  • Or invoke the agent directly:  the rca-prevention-facilitator agent."
fi
