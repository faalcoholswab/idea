# CLAUDE.md

이 저장소(`idea`)는 아이디어를 모으고, 구체화하고, 프로토타입으로 만드는 곳이다.
도구 선정 배경과 사용법은 [README.md](README.md) 에 있다.

## 작업 흐름

- 새 아이디어·기능·변경: `brainstorming` → `writing-plans` → `subagent-driven-development` (또는 `executing-plans`) → `finishing-a-development-branch`
- 버그·테스트 실패: `systematic-debugging` 으로 원인부터 찾고, 수정은 `test-driven-development` 로 한다.
- "끝났다"고 말하기 전: `verification-before-completion`
- UI 를 만들 때: `frontend-design` / 로컬 웹앱 동작 확인: `webapp-testing`
- 설계 문서는 `docs/superpowers/specs/`, 구현 계획은 `docs/superpowers/plans/` 에 남긴다.
- 오타·한 줄 수정 같은 사소한 작업은 절차 없이 바로 처리한다.

## 스킬 이름 규칙

Superpowers 스킬은 플러그인이 아니라 프로젝트 스킬(`.claude/skills/`)로 들여왔다.
스킬 본문의 `superpowers:<name>` 은 프로젝트 스킬 `<name>` 을 뜻한다 (예: `superpowers:writing-plans` → `writing-plans`).

`.claude/skills/` 의 외부 스킬은 직접 고치지 않는다. 갱신은 `scripts/sync-skills.sh` 로 한다.

## Coding Guidelines

> 출처: [forrestchang/andrej-karpathy-skills](https://github.com/forrestchang/andrej-karpathy-skills) `CLAUDE.md` (MIT). 제목 수준만 한 단계 낮추고 본문은 원문 그대로 옮겼다.

Behavioral guidelines to reduce common LLM coding mistakes. Merge with project-specific instructions as needed.

**Tradeoff:** These guidelines bias toward caution over speed. For trivial tasks, use judgment.

### 1. Think Before Coding

**Don't assume. Don't hide confusion. Surface tradeoffs.**

Before implementing:
- State your assumptions explicitly. If uncertain, ask.
- If multiple interpretations exist, present them - don't pick silently.
- If a simpler approach exists, say so. Push back when warranted.
- If something is unclear, stop. Name what's confusing. Ask.

### 2. Simplicity First

**Minimum code that solves the problem. Nothing speculative.**

- No features beyond what was asked.
- No abstractions for single-use code.
- No "flexibility" or "configurability" that wasn't requested.
- No error handling for impossible scenarios.
- If you write 200 lines and it could be 50, rewrite it.

Ask yourself: "Would a senior engineer say this is overcomplicated?" If yes, simplify.

### 3. Surgical Changes

**Touch only what you must. Clean up only your own mess.**

When editing existing code:
- Don't "improve" adjacent code, comments, or formatting.
- Don't refactor things that aren't broken.
- Match existing style, even if you'd do it differently.
- If you notice unrelated dead code, mention it - don't delete it.

When your changes create orphans:
- Remove imports/variables/functions that YOUR changes made unused.
- Don't remove pre-existing dead code unless asked.

The test: Every changed line should trace directly to the user's request.

### 4. Goal-Driven Execution

**Define success criteria. Loop until verified.**

Transform tasks into verifiable goals:
- "Add validation" → "Write tests for invalid inputs, then make them pass"
- "Fix the bug" → "Write a test that reproduces it, then make it pass"
- "Refactor X" → "Ensure tests pass before and after"

For multi-step tasks, state a brief plan:
```
1. [Step] → verify: [check]
2. [Step] → verify: [check]
3. [Step] → verify: [check]
```

Strong success criteria let you loop independently. Weak criteria ("make it work") require constant clarification.

---

**These guidelines are working if:** fewer unnecessary changes in diffs, fewer rewrites due to overcomplication, and clarifying questions come before implementation rather than after mistakes.
