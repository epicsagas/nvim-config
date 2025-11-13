# AI Integration Setup Guide

CodeCompanion.nvim로 Claude, Gemini, xAI(Grok) 통합 가이드입니다.

## 지원되는 AI 모델

### 1. **Anthropic Claude** (기본)
- claude-sonnet-4-20250514 (기본)
- claude-opus-4-20250514
- claude-3-7-sonnet-20250219
- claude-3-5-sonnet-20241022

### 2. **Google Gemini**
- gemini-2.0-flash-exp (기본)
- gemini-2.0-flash-thinking-exp
- gemini-exp-1206
- gemini-1.5-pro
- gemini-1.5-flash

### 3. **xAI (Grok)**
- grok-2-1212 (기본)
- grok-2-vision-1212
- grok-beta

### 4. **Agent Client Protocol**
- Claude Code CLI
- Gemini CLI

---

## 설치 단계

### 1. API 키 발급

#### Anthropic Claude
1. https://console.anthropic.com/ 접속
2. Account Settings → API Keys
3. "Create Key" 클릭
4. API 키 복사

#### Google Gemini
1. https://ai.google.dev/ 접속
2. "Get API key in Google AI Studio" 클릭
3. API 키 생성 및 복사

#### xAI (Grok)
1. https://console.x.ai/ 접속
2. API Keys → "Create new API key"
3. API 키 복사

---

### 2. 환경변수 설정

#### macOS/Linux (Bash/Zsh)

**~/.zshrc** 또는 **~/.bashrc**에 추가:

```bash
# AI API Keys
export ANTHROPIC_API_KEY="sk-ant-..."  # Claude
export GEMINI_API_KEY="AIza..."        # Gemini
export XAI_API_KEY="xai-..."           # xAI (Grok)
```

**적용**:
```bash
source ~/.zshrc  # 또는 source ~/.bashrc
```

#### 보안 권장사항 (1Password/Bitwarden 사용)

**1Password 사용**:
```bash
# ~/.zshrc
export ANTHROPIC_API_KEY=$(op read "op://personal/Anthropic/credential")
export GEMINI_API_KEY=$(op read "op://personal/Gemini/credential")
export XAI_API_KEY=$(op read "op://personal/xAI/credential")
```

**Bitwarden CLI 사용**:
```bash
# ~/.zshrc
export ANTHROPIC_API_KEY=$(bw get password "Anthropic API")
export GEMINI_API_KEY=$(bw get password "Gemini API")
export XAI_API_KEY=$(bw get password "xAI API")
```

---

### 3. Agent CLI 설치 (선택사항)

#### Claude Code CLI
```bash
# npm으로 설치
npm install -g @anthropic-ai/claude-code

# 또는 brew (macOS)
brew install claude-code

# 확인
which claude
claude --version
```

#### Gemini CLI
```bash
# Google Cloud CLI 설치
curl https://sdk.cloud.google.com | bash
exec -l $SHELL

# Gemini CLI 활성화
gcloud components install alpha
gcloud auth application-default login

# 확인
gcloud --version
```

---

## 사용 방법

### 기본 키바인딩

#### AI 채팅
| 키 | 기능 |
|-----|------|
| `<Space>ac` | AI 채팅 열기 |
| `<Space>at` | AI 채팅 토글 |
| `<Space>aa` | AI 액션 메뉴 |

#### 빠른 명령어
| 키 | 기능 |
|-----|------|
| `<Space>ae` | 코드 설명 |
| `<Space>af` | 버그 수정 |
| `<Space>ao` | 코드 최적화 |
| `<Space>aT` | 테스트 생성 |
| `<Space>ar` | 코드 리팩토링 |

#### 인라인 AI
| 키 | 기능 |
|-----|------|
| `<Space>ai` | 인라인 AI 제안 |

#### 모델 전환
| 키 | 기능 |
|-----|------|
| `<Space>am` | AI 모델 선택 |

### 사용 예시

#### 1. 코드 설명 받기
```
1. 코드 선택 (Visual mode)
2. <Space>ae 누르기
3. AI가 코드 설명 제공
```

#### 2. 버그 수정
```
1. 버그가 있는 코드 선택
2. <Space>af 누르기
3. AI가 수정된 코드 제안
```

#### 3. 테스트 생성
```
1. 함수 선택
2. <Space>aT 누르기
3. AI가 테스트 코드 생성
```

#### 4. 채팅으로 질문
```
1. <Space>ac - 채팅 열기
2. 질문 입력
3. Enter 또는 Ctrl+s로 전송
```

#### 5. 모델 전환
```
1. <Space>am
2. 원하는 AI 선택:
   - anthropic (Claude)
   - gemini (Gemini)
   - xai (Grok)
   - claude_code (Agent)
   - gemini_cli (Agent)
```

---

## 채팅 내 슬래시 명령어

채팅 창에서 `/` 입력하면 사용 가능:

- `/explain` - 코드 설명
- `/fix` - 버그 수정
- `/optimize` - 최적화
- `/tests` - 테스트 생성
- `/refactor` - 리팩토링

---

## 문제 해결

### API 키가 작동하지 않음

**확인 1**: 환경변수 로드 확인
```bash
echo $ANTHROPIC_API_KEY
echo $GEMINI_API_KEY
echo $XAI_API_KEY
```

**확인 2**: Neovim 내에서 확인
```vim
:lua print(vim.env.ANTHROPIC_API_KEY)
```

**해결**: 환경변수가 비어있다면
```bash
# 터미널 재시작
source ~/.zshrc

# Neovim 재시작
nvim
```

---

### 플러그인이 로드되지 않음

**확인**:
```vim
:Lazy
```

**해결**:
```vim
:Lazy sync
```

---

### "No adapter found" 오류

**원인**: 환경변수가 설정되지 않음

**해결**:
1. API 키 환경변수 설정 확인
2. 터미널 재시작
3. Neovim 재시작

---

### Claude Code CLI 연결 실패

**확인**:
```bash
which claude
claude doctor
```

**해결**:
```bash
# 재설치
npm uninstall -g @anthropic-ai/claude-code
npm install -g @anthropic-ai/claude-code

# 로그인
claude login
```

---

### Gemini CLI 인증 실패

**해결**:
```bash
# 재인증
gcloud auth application-default login

# 프로젝트 설정
gcloud config set project YOUR_PROJECT_ID
```

---

## 고급 설정

### 커스텀 프롬프트 추가

**lua/plugins/ai.lua** 수정:

```lua
prompt_library = {
  ["Custom Command"] = {
    strategy = "chat",
    description = "Your custom command",
    opts = {
      index = 10,
      is_slash_cmd = true,
    },
    prompts = {
      {
        role = "user",
        content = "Your custom prompt: {{selection}}",
      },
    },
  },
}
```

### 특정 모델만 사용

**lua/plugins/ai.lua**에서 불필요한 어댑터 제거:

```lua
adapters = {
  anthropic = function()
    -- Claude만 사용
  end,
  -- gemini와 xai 주석 처리
}
```

---

## 비용 관리

### API 사용량 모니터링

#### Anthropic
- https://console.anthropic.com/settings/usage

#### Google Gemini
- https://ai.google.dev/pricing

#### xAI
- https://console.x.ai/billing

### 비용 절약 팁

1. **작은 모델 사용**:
   - Claude: claude-3-5-sonnet (가장 저렴)
   - Gemini: gemini-1.5-flash (무료 티어)
   - xAI: 베타 단계 확인

2. **선택적으로 컨텍스트 추가**:
   - 필요한 코드만 선택해서 전송
   - 전체 파일 대신 함수만 선택

3. **캐싱 활용**:
   - 동일한 질문 반복하지 않기
   - 이전 대화 참조

---

## 참고 자료

- **CodeCompanion 공식 문서**: https://codecompanion.olimorris.dev/
- **Anthropic 문서**: https://docs.anthropic.com/
- **Gemini 문서**: https://ai.google.dev/docs
- **xAI 문서**: https://docs.x.ai/

---

**축하합니다! 🎉** 이제 Neovim에서 3개의 최신 AI 모델을 사용할 수 있습니다!

다음 단계: `<Space>ac`로 AI 채팅을 열고 첫 질문을 해보세요!
