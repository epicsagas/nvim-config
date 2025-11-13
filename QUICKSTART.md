# Neovim 빠른 시작 가이드 (5분)

24개 언어를 지원하는 완전한 개발 환경을 5분 안에 설정하세요!

## 1단계: 설치 (2분)

### 자동 설치 (권장)
```bash
# 기존 설정 백업 (선택사항)
mv ~/.config/nvim ~/.config/nvim.backup.$(date +%Y%m%d)

# 저장소 클론
git clone https://github.com/epicsagas/nvim-config.git ~/.config/nvim

# 자동 설치 실행
cd ~/.config/nvim
./install.sh
```

### 첫 실행
```bash
nvim
```

플러그인이 자동으로 설치됩니다 (1-2분 소요). 완료되면 Neovim을 재시작하세요.

## 2단계: 필수 도구 설치 (2분)

### macOS
```bash
# Neovim 최신 버전
brew install neovim

# 기본 도구
brew install git ripgrep fd

# Tree-sitter CLI (Swift 지원용)
brew install tree-sitter-cli

# 선택: 추가 도구 자동 설치
cd ~/.config/nvim
./install-tools.sh
```

### Linux (Ubuntu/Debian)
```bash
# Neovim 최신 버전
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update
sudo apt install neovim

# 기본 도구
sudo apt install git ripgrep fd-find

# Tree-sitter CLI
npm install -g tree-sitter-cli
```

## 3단계: 첫 코드 작성 (1분)

### Rust 프로젝트
```bash
# 새 프로젝트 생성
cargo new hello-rust
cd hello-rust

# Neovim으로 열기
nvim src/main.rs

# 코드 작성 후 F5로 실행!
```

### Go 프로젝트
```bash
# 새 프로젝트
mkdir hello-go && cd hello-go
go mod init hello

# main.go 생성
nvim main.go

# F5로 실행!
```

### Python 프로젝트
```bash
# 스크립트 생성
nvim hello.py

# F5로 실행!
```

## 핵심 키바인딩 (외우면 끝!)

### 필수 3개
- `F5` - **코드 실행** (모든 언어)
- `F6` - **테스트 실행**
- `<Space>e` - **파일 탐색기**

### 자주 사용 (5개)
- `<Space>ff` - 파일 찾기
- `<Space>fg` - 코드 검색
- `gd` - 정의로 이동
- `K` - 문서 보기
- `<Space>ca` - 코드 액션

### 디버깅 (3개)
- `<Space>db` - 중단점 설정
- `F9` - 디버그 시작
- `F10` - 한 줄씩 실행

### Git (3개)
- `<Space>gg` - LazyGit 열기
- `<Space>gs` - Neogit 상태
- `<Space>u` - Undo tree

**전체 키바인딩**: `<Space>` 누르고 기다리면 메뉴가 나타납니다!

## 언어별 빠른 시작

### Rust
```bash
brew install rustup
rustup-init
# F5: cargo run
# F6: cargo test
```

### Go
```bash
brew install go
# F5: go run
# F6: go test
```

### Python
```bash
brew install python
# F5: python3 실행
# F6: pytest
# <Space>vs: 가상환경 선택
```

### TypeScript/JavaScript
```bash
brew install node
# F5: node/tsx 실행
# F6: npm test
```

### Java
```bash
brew install openjdk
# F5: javac + java
# F6: Maven test
```

### C/C++
```bash
brew install llvm
# F5: gcc/g++ 컴파일 & 실행
# F6: 디버그 정보와 컴파일
```

## 문제 해결

### LSP가 작동하지 않음
```vim
:Mason
```
서버 목록에서 `i` 눌러서 설치

### 플러그인 오류
```vim
:Lazy sync
```
플러그인 재동기화

### tree-sitter 오류 (Swift)
```bash
brew install tree-sitter-cli
```

### 전체 상태 확인
```vim
:checkhealth
```

## 다음 단계

1. **README.md** - 전체 기능 및 키바인딩
2. **LANGUAGES.md** - 언어별 상세 설정
3. **TROUBLESHOOTING.md** - 문제 해결 가이드

## 도움말

- GitHub Issues: https://github.com/epicsagas/nvim-config/issues
- Neovim 도움말: `:help`
- 키바인딩 확인: `<Space>` 누르고 대기

---

**축하합니다! 🎉** 이제 24개 언어를 지원하는 완전한 IDE를 사용할 수 있습니다!
