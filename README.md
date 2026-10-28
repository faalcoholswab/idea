# idea

아이디어를 모으고, 구체화하고, 프로토타입으로 만드는 저장소.
GitHub 와 Claude 스킬 생태계에서 널리 쓰이고 효과가 검증된 도구를 골라 Claude Code 작업 환경으로 구성해 두었다.

## 적용한 도구

| 도구 | 출처 | 하는 일 | 고른 이유 |
| --- | --- | --- | --- |
| **Superpowers** (스킬 13종) | [obra/superpowers](https://github.com/obra/superpowers) | 브레인스토밍 → 설계 문서 → 구현 계획 → 서브에이전트 구현·리뷰 → 브랜치 마무리. TDD, 체계적 디버깅, 완료 전 검증 포함 | 2026년 Claude Code 스킬 추천 글들에서 가장 많이 꼽히는 스킬 모음(MIT). 아이디어를 바로 코드로 만들지 않고 "무엇을 왜 만드는지"부터 묻는 `brainstorming` 이 이 저장소의 목적에 딱 맞음 |
| **Karpathy Coding Guidelines** | [forrestchang/andrej-karpathy-skills](https://github.com/forrestchang/andrej-karpathy-skills) | 가정 드러내기, 단순하게, 필요한 곳만 수정, 검증 가능한 목표 | 2026년 가장 빠르게 별을 모은 스킬 중 하나(MIT). `CLAUDE.md` 에 넣어 항상 적용되며 비용이 거의 없음 |
| **frontend-design** | [anthropics/skills](https://github.com/anthropics/skills) | 템플릿처럼 보이지 않는 UI 방향·타이포그래피 | Anthropic 공식 스킬(Apache-2.0). 아이디어 프로토타입의 첫인상 품질 |
| **webapp-testing** | [anthropics/skills](https://github.com/anthropics/skills) | Playwright 로 로컬 웹앱을 띄우고 확인·스크린샷 | Claude 가 만든 화면을 직접 눈으로 검증 |
| **Claude Code GitHub Action** | [anthropics/claude-code-action](https://github.com/anthropics/claude-code-action) | 이슈·PR 에서 `@claude` 호출 → 답변·구현·PR | 휴대폰에서도 이슈 하나로 아이디어 구체화를 맡길 수 있음 |
| **아이디어 이슈 폼** | GitHub Issue Forms | 문제·아이디어·대상·메모를 구조화해 기록 | `@claude` 가 읽기 좋은 입력이 됨 |
| **Dependabot** | GitHub | GitHub Actions 버전 주간 자동 업데이트 | 워크플로가 낡지 않게 |

Superpowers 에서 가져온 스킬: `using-superpowers`, `brainstorming`, `writing-plans`, `executing-plans`,
`subagent-driven-development`, `test-driven-development`, `systematic-debugging`, `verification-before-completion`,
`requesting-code-review`, `receiving-code-review`, `finishing-a-development-branch`, `using-git-worktrees`,
`dispatching-parallel-agents`.

### 플러그인이 아니라 저장소에 직접 넣은 이유

Claude Code 의 플러그인(`enabledPlugins`)은 **클라우드 세션(claude.ai/code, 모바일 앱)에서 로드되지 않는다.**
반면 저장소의 `.claude/skills/`, `CLAUDE.md`, `.claude/settings.json` 훅은 로컬·클라우드 모두에서 동작한다.
그래서 스킬을 고정 커밋 기준으로 복사해 두었다(원본 수정 없음, 출처·라이선스는 [THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md)).

## 고르지 않은 것

| 후보 | 제외 이유 |
| --- | --- |
| Superpowers `writing-skills`, `diagnosing-superpowers` | 스킬 제작용, Superpowers 자체 진단용. 일반 작업에는 불필요 |
| [planning-with-files](https://github.com/OthmanAdi/planning-with-files) | 인기 스킬이지만 Superpowers 의 `writing-plans`·`executing-plans` 와 역할이 겹친다. 둘 다 두면 계획 파일이 두 벌 생김 |
| anthropics/skills 문서 스킬 (docx·pdf·pptx·xlsx) | 재배포가 허용되지 않는 라이선스. claude.ai 에서는 기본 제공 |
| anthropics/skills `skill-creator`, `mcp-builder` | 필요할 때 플러그인으로 설치하면 충분: `/plugin marketplace add anthropics/skills` |
| [awesome-claude-code](https://github.com/hesreallyhim/awesome-claude-code) | 설치 대상이 아닌 큐레이션 목록. 도구를 더 찾을 때 참고 |
| PR 자동 리뷰 워크플로 | 모든 PR 마다 토큰을 소모한다. 필요할 때 PR 에서 `@claude 리뷰해줘` 로 호출 |

## 사용법

### Claude Code (로컬·클라우드)

저장소를 열면 바로 적용된다.

- 세션이 시작되면 훅(`.claude/hooks/session-start.sh`)이 `using-superpowers` 를 주입해, 작업에 맞는 스킬을 Claude 가 알아서 고른다.
- 예: "독서 기록 앱 아이디어 구체화해줘" → `brainstorming` 이 질문으로 요구사항을 정리 → `docs/superpowers/specs/` 에 설계 문서 → 승인하면 `writing-plans` 가 `docs/superpowers/plans/` 에 구현 계획 → 구현
- 직접 부르기: `/brainstorming`, `/writing-plans`, `/systematic-debugging`, `/frontend-design` 등
- 오타·한 줄 수정 같은 사소한 작업은 절차 없이 바로 처리하도록 `CLAUDE.md` 에 적어 두었다.

### GitHub 에서 `@claude`

한 번만 설정하면 된다.

1. [Claude GitHub App](https://github.com/apps/claude) 을 이 저장소에 설치
2. 저장소 **Settings → Secrets and variables → Actions** 에 시크릿 하나 등록
   - Pro/Max 구독: `CLAUDE_CODE_OAUTH_TOKEN` (로컬에서 `claude setup-token` 으로 발급)
   - API 종량제: `ANTHROPIC_API_KEY`
3. **Issues → Labels** 에서 `idea` 라벨 생성 (이슈 폼이 자동으로 붙임)

그다음 **New issue → 아이디어** 로 기록하고, 본문이나 댓글에 `@claude 이 아이디어 구체화해줘` 라고 쓰면 된다.
쓰기 권한이 있는 사용자만 호출할 수 있다.

### 내 컴퓨터의 모든 프로젝트에 적용

이 저장소 밖에서도 쓰려면 터미널(macOS·Linux·Windows 공통)에서 한 번 실행한다. 공식 플러그인이라 자동으로 업데이트된다.

```bash
claude plugin marketplace add anthropics/claude-plugins-official
claude plugin install superpowers@claude-plugins-official
claude plugin install frontend-design@claude-plugins-official
claude plugin install andrej-karpathy-skills --marketplace forrestchang/andrej-karpathy-skills
```

- `claude` 를 알 수 없는 명령어라고 하면 Claude Code(CLI)가 아직 설치되지 않은 것이다. 먼저 설치한 뒤 터미널을 새로 연다.
  Windows PowerShell: `irm https://claude.ai/install.ps1 | iex` / macOS·Linux: `curl -fsSL https://claude.ai/install.sh | bash`
- 터미널 없이 하려면: Claude 데스크톱 앱의 Code 로컬 세션에서 입력창 옆 **+** → **Add plugins** 로 `superpowers`, `frontend-design` 를 설치한다.
- 첫 줄은 공식 마켓플레이스가 이미 등록돼 있으면 생략해도 된다.
- 열려 있는 세션에는 `/reload-plugins` 를 실행하거나 새 세션부터 적용된다.
- 이 저장소 안에서는 `.claude/settings.json` 이 위 플러그인을 꺼서, 저장소에 들어 있는 같은 스킬과 중복되지 않게 한다.
- 이 플러그인은 클라우드 세션(claude.ai/code)에서는 로드되지 않는다. 클라우드에서는 이 저장소의 스킬이 쓰인다.
- 되돌리기: `claude plugin uninstall <이름>@<마켓플레이스>`

## 관리

- **스킬 갱신**: `scripts/sync-skills.sh` 의 커밋 SHA 를 바꾸고 실행 → `git diff` 로 변경 확인 → `THIRD_PARTY_NOTICES.md` 의 커밋도 갱신
- **스킬 빼기/추가**: 같은 스크립트의 `SOURCES` 목록 수정 (뺄 때는 `.claude/skills/<이름>` 디렉터리도 삭제)
- **세션 시작 주입 끄기**: `.claude/settings.json` 의 `hooks` 삭제 (스킬은 설명만으로도 필요할 때 호출된다)
- **Superpowers 텔레메트리**: brainstorming 비주얼 컴패니언의 로고 요청을 기본으로 꺼 두었다(`SUPERPOWERS_DISABLE_TELEMETRY=1`)

## 구조

```
CLAUDE.md                     항상 적용되는 작업 규칙 + Karpathy 가이드라인
.claude/
  settings.json               SessionStart 훅, .env 읽기 금지, 텔레메트리 끔, 전역 플러그인 중복 방지
  hooks/session-start.sh      using-superpowers 주입
  skills/                     외부에서 들여온 스킬 15종 (직접 수정하지 않음)
.github/
  workflows/claude.yml        @claude 호출
  ISSUE_TEMPLATE/idea.yml     아이디어 이슈 폼
  dependabot.yml              Actions 버전 업데이트
scripts/sync-skills.sh        스킬 선별 목록 + 동기화
THIRD_PARTY_NOTICES.md        출처·라이선스
```
