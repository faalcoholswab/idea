#!/usr/bin/env bash
# SessionStart 훅: using-superpowers 스킬 본문을 세션 시작 컨텍스트로 넣는다.
# obra/superpowers 의 hooks/session-start (MIT) 를 프로젝트 스킬 경로에 맞게 줄인 것.
# SessionStart 훅의 일반 텍스트 stdout 은 그대로 Claude 컨텍스트에 추가된다.
skill_md="${CLAUDE_PROJECT_DIR:-.}/.claude/skills/using-superpowers/SKILL.md"
[ -r "$skill_md" ] || exit 0

header="You have superpowers.

**Below is the full content of your 'superpowers:using-superpowers' skill - your introduction to using skills. For all other skills, use the 'Skill' tool:**"

printf '<EXTREMELY_IMPORTANT>\n%s\n\n%s\n</EXTREMELY_IMPORTANT>\n' "$header" "$(<"$skill_md")"
