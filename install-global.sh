#!/usr/bin/env bash
# Installs this repo's skills and rules for Claude Code and Codex, for every project on this computer.
# Run from the repo root: bash install-global.sh   (safe to run again to update)
set -euo pipefail
cd "$(dirname "$0")"

mkdir -p ~/.claude/skills ~/.agents/skills ~/.codex
for s in .claude/skills/*/; do
  name=$(basename "$s")
  rm -rf ~/.claude/skills/"$name"
  cp -R "$s" ~/.claude/skills/"$name"
  ln -sfn ~/.claude/skills/"$name" ~/.agents/skills/"$name"   # Codex reads ~/.agents/skills
done

# Put the rules between markers so a re-run replaces them and anything else in the file is kept.
add_rules() {
  local f=$1
  touch "$f"
  awk '/<!-- my-skills start -->/{skip=1} !skip; /<!-- my-skills end -->/{skip=0}' "$f" > "$f.tmp"
  { cat "$f.tmp"; echo '<!-- my-skills start -->'; cat AGENTS.md; echo '<!-- my-skills end -->'; } > "$f"
  rm "$f.tmp"
}
add_rules ~/.claude/CLAUDE.md
add_rules ~/.codex/AGENTS.md

echo "Done: $(ls .claude/skills | wc -l | tr -d ' ') skills + rules installed for Claude Code and Codex."
