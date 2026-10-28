#!/usr/bin/env bash
# 외부 스킬을 .claude/skills/ 로 들여온다(vendoring).
# 선별 목록과 고정 커밋은 SOURCES 한 곳에서 관리한다.
# 갱신: 커밋 SHA 를 새 값으로 바꾸고 다시 실행한 뒤, THIRD_PARTY_NOTICES.md 의 커밋도 맞춘다.
set -euo pipefail

root="$(cd "$(dirname "$0")/.." && pwd)"
dest="$root/.claude/skills"
work="$(mktemp -d)"
trap 'rm -rf "$work"' EXIT

# "저장소|커밋|skills/ 아래 스킬 디렉터리(공백 구분)"
SOURCES=(
  "obra/superpowers|2ce8aa15d05bd57213e6f746f953aafb7ded7a8b|using-superpowers brainstorming writing-plans executing-plans subagent-driven-development test-driven-development systematic-debugging verification-before-completion requesting-code-review receiving-code-review finishing-a-development-branch using-git-worktrees dispatching-parallel-agents"
  "anthropics/skills|dbd4588f9e1033efb41dad4bef2f7947c8993d44|frontend-design webapp-testing"
)

mkdir -p "$dest"
for entry in "${SOURCES[@]}"; do
  IFS='|' read -r repo commit skills <<<"$entry"
  src="$work/${repo//\//_}"
  git init -q "$src"
  git -C "$src" fetch -q --depth 1 "https://github.com/$repo" "$commit"
  git -C "$src" checkout -q FETCH_HEAD
  for skill in $skills; do
    rm -rf "${dest:?}/$skill"
    cp -R "$src/skills/$skill" "$dest/$skill"
  done
  echo "synced $repo@${commit:0:7}: $skills"
done
