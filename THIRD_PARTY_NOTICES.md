# Third-Party Notices

이 저장소에는 아래 외부 프로젝트의 파일이 포함되어 있다. 각 파일의 저작권과 라이선스는 원저작자에게 있다.

| 구성 요소 | 위치 | 원본 | 고정 커밋 | 라이선스 |
| --- | --- | --- | --- | --- |
| Superpowers 스킬 13종 | `.claude/skills/` (아래 목록) | [obra/superpowers](https://github.com/obra/superpowers) v7.0.1 | `2ce8aa15d05bd57213e6f746f953aafb7ded7a8b` | MIT (아래 전문) |
| SessionStart 훅 | `.claude/hooks/session-start.sh` | obra/superpowers `hooks/session-start` 를 축약 | 위와 같음 | MIT (아래 전문) |
| frontend-design, webapp-testing | `.claude/skills/frontend-design/`, `.claude/skills/webapp-testing/` | [anthropics/skills](https://github.com/anthropics/skills) | `dbd4588f9e1033efb41dad4bef2f7947c8993d44` | Apache-2.0 (각 디렉터리의 `LICENSE.txt`) |
| Karpathy Coding Guidelines | `CLAUDE.md` 의 "Coding Guidelines" 절 | [forrestchang/andrej-karpathy-skills](https://github.com/forrestchang/andrej-karpathy-skills) | `2c606141936f1eeef17fa3043a72095b4765b9c2` | MIT (원본 README·plugin.json 에 명시, 별도 LICENSE 파일 없음) |
| Claude Code 워크플로 | `.github/workflows/claude.yml` | [anthropics/claude-code-action](https://github.com/anthropics/claude-code-action) `examples/claude.yml` | `d70510b174a1244958df0b03166a54912811f3e6` | MIT |

Superpowers 에서 가져온 스킬: using-superpowers, brainstorming, writing-plans, executing-plans,
subagent-driven-development, test-driven-development, systematic-debugging,
verification-before-completion, requesting-code-review, receiving-code-review,
finishing-a-development-branch, using-git-worktrees, dispatching-parallel-agents.

스킬 파일은 원본에서 수정 없이 복사했다(`scripts/sync-skills.sh`).

## obra/superpowers — MIT License

```
MIT License

Copyright (c) 2025 Jesse Vincent

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

## anthropics/claude-code-action — MIT License

```
MIT License

Copyright (c) 2025 Anthropic, PBC

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.```
