# Neovim Configuration for Multi-Language Development

Modern Neovim setup with full LSP support, debugging, formatting, and IDE-like features for **24 languages**:

**Core Languages**: Rust, Go, Python, C/C++, Java, TypeScript, JavaScript, PHP
**Mobile & Systems**: Swift, Kotlin, Dart/Flutter, C#, Zig, Nim
**Functional & Scripting**: Elixir, Haskell, Scala, Lisp (Common Lisp & Scheme), Lua, Ruby, R, Bash
**Data & Query**: SQL

## Features

### Core
- **Plugin Manager**: lazy.nvim (automatic installation)
- **LSP**: Full language server support via Mason
- **Completion**: nvim-cmp with snippets
- **Fuzzy Finding**: Telescope for files, grep, symbols
- **Syntax Highlighting**: Treesitter
- **Debugging**: nvim-dap with UI
- **Quick Run**: F5 to run, F6 to test (all languages)

### Rust-Specific
- **rust-analyzer**: Full LSP with clippy integration
- **rustaceanvim**: Enhanced Rust tooling
- **crates.nvim**: Cargo.toml dependency management
- **Debugger**: codelldb for debugging

### Go-Specific
- **gopls**: Official Go language server
- **go.nvim**: Go tooling integration
- **Auto-formatting**: goimports + gofumpt on save
- **Testing**: Integrated test runner
- **Debugger**: Delve for debugging

### Python-Specific
- **pyright**: Fast Python language server
- **black + isort**: Auto-formatting on save
- **venv-selector**: Virtual environment management
- **Debugger**: debugpy for debugging
- **Testing**: pytest integration

### C/C++-Specific
- **clangd**: Powerful C/C++ language server
- **clang-format**: Auto-formatting on save
- **clangd_extensions**: Enhanced C/C++ features
- **Debugger**: codelldb for debugging
- **Header/Source switch**: Quick navigation

### Java-Specific
- **jdtls**: Eclipse JDT language server
- **nvim-java**: Full Java IDE features
- **google-java-format**: Auto-formatting
- **Debugger**: java-debug-adapter
- **Testing**: Built-in test runner

### TypeScript/JavaScript-Specific
- **typescript-tools**: Enhanced TypeScript language server
- **prettier**: Auto-formatting on save
- **eslint_d**: Fast linting
- **Debugger**: js-debug-adapter (Node.js)
- **Inlay hints**: Full type information display
- **Import management**: Auto-organize and fix imports

### PHP-Specific
- **intelephense**: Fast PHP language server
- **phpactor**: Advanced PHP tooling
- **php-cs-fixer**: Auto-formatting on save
- **phpstan**: Static analysis
- **Debugger**: Xdebug support
- **Class management**: Auto-import and generation

### SQL-Specific
- **sqlls**: SQL language server with linting
- **sqlfluff**: Auto-formatting and linting
- **dbext**: Database interaction support
- **F5/F6**: View SQL files and format

### Kotlin-Specific
- **kotlin-language-server**: Full Kotlin LSP
- **ktlint**: Kotlin formatter and linter
- **Debugger**: Java debug adapter for Kotlin
- **F5/F6**: Compile & run, Gradle integration
- **kotlin-vim**: Syntax and tooling support

### Dart/Flutter-Specific
- **flutter-tools**: Complete Flutter development environment
- **dartls**: Dart language server
- **Debugger**: Dart debug adapter
- **F5/F6**: Flutter run, hot reload, device management
- **Widget guides**: Closing tags and widget visualization
- **DevTools**: Integrated Flutter DevTools

### Ruby-Specific
- **ruby-lsp**: Modern Ruby language server
- **rubocop**: Formatter and linter
- **Debugger**: Ruby debug adapter
- **F5/F6**: Run Ruby files, RSpec tests
- **vim-ruby**: Enhanced Ruby syntax and tooling

### Lisp-Specific
- **vlime**: Common Lisp and Scheme support
- **F5/F6**: Run scripts, REPL integration
- **SBCL**: Common Lisp with SBCL
- **Racket**: Scheme with Racket support

### Lua-Specific
- **lua_ls**: Lua language server (already configured for Neovim)
- **stylua**: Lua formatter
- **luacheck**: Lua linter
- **F5/F6**: Run Lua files, source Neovim configs
- **lazydev**: Enhanced Neovim Lua development

### R-Specific
- **r-language-server**: R language server
- **R.nvim**: Complete R development environment
- **Formatter**: styler for R code
- **F5/F6**: Start R console, send code to R
- **REPL integration**: Interactive R development

### C#-Specific
- **omnisharp**: C# language server with full .NET support
- **csharp.nvim**: C# IDE features for Neovim
- **Debugger**: netcoredbg for debugging
- **F5/F6**: dotnet run, dotnet test
- **dotnet CLI integration**: Build, test, package management

### Swift-Specific
- **sourcekit-lsp**: Apple's official Swift language server
- **xcodebuild.nvim**: Complete Xcode project integration
- **Debugger**: LLDB integration
- **F5/F6**: Swift run, test (Package.swift or Xcode project)
- **Xcode integration**: Build, test, device management

### Bash-Specific
- **bash-language-server**: Bash LSP
- **shellcheck**: Shell script linting
- **shfmt**: Shell script formatter
- **F5/F6**: Run script, syntax check
- **DevOps tools**: chmod, debug mode, syntax validation

### Zig-Specific
- **zls**: Official Zig language server
- **zig.vim**: Zig syntax and tooling
- **F5/F6**: zig build run, zig test
- **Auto-formatting**: zig fmt on save
- **Build modes**: Debug, ReleaseFast, ReleaseSafe

### Elixir-Specific
- **elixir-tools.nvim**: Complete Elixir development environment
- **elixir-ls**: Elixir language server
- **Debugger**: Elixir debug adapter
- **F5/F6**: mix run, mix test
- **Phoenix support**: Phoenix server integration
- **REPL**: IEx REPL integration

### Haskell-Specific
- **haskell-language-server**: Official Haskell LSP
- **haskell-tools.nvim**: Enhanced Haskell features
- **Formatter**: ormolu formatter
- **F5/F6**: stack/cabal run, stack/cabal test
- **Hoogle integration**: Function search
- **GHCi REPL**: Interactive Haskell development

### Scala-Specific
- **nvim-metals**: Official Scala Metals integration
- **scalafmt**: Scala code formatter
- **F5/F6**: sbt run, sbt test
- **Build tool**: sbt integration
- **REPL**: Scala console integration

### Nim-Specific
- **nim-langserver**: Nim language server
- **nim.nvim**: Nim syntax and tooling
- **Formatter**: nimpretty formatter
- **F5/F6**: nim compile --run, nim test
- **Build modes**: Debug, Release builds

## Quick Start

### Fresh Installation (Clone from Git)

**Option 1: Automatic Installation**
```bash
# Clone the repository
git clone https://github.com/epicsagas/nvim-config.git ~/.config/nvim

# Run installer
cd ~/.config/nvim
./install.sh
```

**Option 2: Manual Installation**
```bash
# Clone the repository
git clone https://github.com/epicsagas/nvim-config.git ~/.config/nvim

# Install language tools (optional but recommended)
./install-tools.sh

# Launch Neovim
nvim
```

### First-Time Setup

On first launch, Neovim will automatically:
1. Install lazy.nvim plugin manager
2. Download and install all plugins
3. Set up LSP servers via Mason

Wait for plugins to install (1-2 minutes), then restart Neovim.

### Deploying to Multiple Machines

**Using Git:**
```bash
# On first machine (create repository)
cd ~/.config/nvim
git add .
git commit -m "Initial Neovim configuration"
git remote add origin https://github.com/epicsagas/nvim-config.git
git push -u origin main

# On other machines
git clone https://github.com/epicsagas/nvim-config.git ~/.config/nvim
cd ~/.config/nvim
./install.sh
```

**Using Direct Copy:**
```bash
# Copy to another machine
scp -r ~/.config/nvim user@remote:~/.config/
ssh user@remote "cd ~/.config/nvim && ./install.sh"
```

## Key Bindings

### Leader Key
`<Space>` is the leader key

### Quick Run/Test
| Key | Action |
|-----|--------|
| `F5` | **Run** current file (Rust: cargo run, Go: go run) |
| `F6` | **Test** current package (Rust: cargo test, Go: go test) |
| `Ctrl+\` | Toggle floating terminal |

### General
| Key | Action |
|-----|--------|
| `<Space>e` | Toggle file explorer |
| `<Space>ff` | Find files |
| `<Space>fg` | Live grep in files |
| `<Space>fb` | Find buffers |
| `<Space>fr` | Recent files |
| `<Space>fw` | Find word under cursor |
| `<Space>fd` | Find diagnostics |
| `<Space>f` | Format buffer |
| `Shift+h` | Previous buffer |
| `Shift+l` | Next buffer |

### LSP
| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gr` | Go to references |
| `gI` | Go to implementation |
| `K` | Hover documentation |
| `<Space>ca` | Code actions |
| `<Space>rn` | Rename symbol |
| `<Space>D` | Type definition |
| `<Space>ds` | Document symbols |
| `<Space>ws` | Workspace symbols |

### Debugging
| Key | Action |
|-----|--------|
| `F9` | Start/Continue debugging |
| `F10` | Step over |
| `F11` | Step into |
| `Shift+F11` | Step out |
| `<Space>db` | Toggle breakpoint |
| `<Space>dB` | Conditional breakpoint |
| `<Space>du` | Toggle debug UI |
| `<Space>dc` | Clear all breakpoints |
| `<Space>dt` | Terminate debug session |

### Rust-Specific
| Key | Action |
|-----|--------|
| `F5` | Quick run (cargo run) |
| `F6` | Quick test (cargo test) |
| `<Space>rr` | Runnables menu (advanced) |
| `<Space>rt` | Testables menu (advanced) |
| `<Space>rd` | Debuggables menu |
| `<Space>re` | Expand macro |
| `<Space>rc` | Open Cargo.toml |
| `<Space>rp` | Go to parent module |
| `<Space>rh` | Hover actions |

### Go-Specific
| Key | Action |
|-----|--------|
| `F5` | Quick run (go run) |
| `F6` | Quick test (go test) |
| `<Space>gr` | Go run |
| `<Space>gt` | Test all |
| `<Space>gT` | Test function under cursor |
| `<Space>gc` | Show test coverage |
| `<Space>gi` | Add if err block |
| `<Space>gf` | Fill struct fields |
| `<Space>ga` | Go to alternate file (test ↔ impl) |
| `<Space>gm` | Go mod tidy |
| `<Space>ge` | Go generate |

### Python-Specific
| Key | Action |
|-----|--------|
| `F5` | Quick run (python3 %) |
| `F6` | Quick test (pytest) |
| `<Space>vs` | Select virtual environment |
| `<Space>pc` | Check syntax (compileall) |
| `<Space>pi` | Install requirements.txt |

### C/C++-Specific
| Key | Action |
|-----|--------|
| `F5` | Compile & run (gcc/g++) |
| `F6` | Compile with debug info |
| `<Space>ch` | Switch header/source |

### Java-Specific
| Key | Action |
|-----|--------|
| `F5` | Compile & run (javac + java) |
| `F6` | Run Maven tests |
| `<Space>jc` | Run main class |
| `<Space>jt` | Test current class |
| `<Space>jT` | Test current method |
| `<Space>jd` | Debug test class |

### TypeScript/JavaScript-Specific
| Key | Action |
|-----|--------|
| `F5` | Quick run (node/tsx) |
| `F6` | Run tests (npm test) |
| `<Space>to` | Organize imports |
| `<Space>ts` | Sort imports |
| `<Space>tu` | Remove unused imports |
| `<Space>ti` | Add missing imports |
| `<Space>tf` | Fix all issues |
| `<Space>td` | Go to source definition |
| `<Space>tr` | Rename file |

### PHP-Specific
| Key | Action |
|-----|--------|
| `F5` | Quick run (php %) |
| `F6` | Run tests (phpunit) |
| `<Space>pm` | Context menu |
| `<Space>pn` | New class |
| `<Space>pe` | Expand class |
| `<Space>pu` | Import class |
| `<Space>pa` | Import missing classes |
| `<Space>pt` | Transform code |
| `<Space>pg` | Generate method |

### SQL-Specific
| Key | Action |
|-----|--------|
| `F5` | View SQL file |
| `F6` | Format SQL file |
| `<Space>sf` | Format (sqlfluff) |
| `<Space>sl` | Lint (sqlfluff) |
| `<Space>sc` | View content |

### Kotlin-Specific
| Key | Action |
|-----|--------|
| `F5` | Compile & run (kotlinc) |
| `F6` | Run tests (Gradle/kotlinc) |
| `<Space>kr` | Run Kotlin file |
| `<Space>kb` | Build (Gradle) |
| `<Space>kt` | Test (Gradle) |
| `<Space>kc` | Format (ktlint) |

### Dart/Flutter-Specific
| Key | Action |
|-----|--------|
| `F5` | Run Dart/Flutter |
| `F6` | Run tests |
| `<Space>dr` | Flutter run |
| `<Space>dq` | Flutter quit |
| `<Space>dR` | Flutter restart |
| `<Space>dh` | Hot reload |
| `<Space>dd` | Devices |
| `<Space>de` | Emulators |
| `<Space>do` | Outline toggle |
| `<Space>dl` | DevLog |
| `<Space>dt` | DevTools |
| `<Space>dc` | Copy profiler URL |
| `<Space>dL` | LSP restart |
| `<Space>df` | Format (dart format) |
| `<Space>da` | Analyze |
| `<Space>dp` | Pub get |

### Ruby-Specific
| Key | Action |
|-----|--------|
| `F5` | Run Ruby file |
| `F6` | Run RSpec tests |
| `<Space>Rr` | Run |
| `<Space>Rt` | Test (RSpec) |
| `<Space>Rb` | Bundle install |
| `<Space>Rf` | Format (Rubocop) |
| `<Space>Rl` | Lint (Rubocop) |
| `<Space>Ri` | IRB REPL |

### Lisp-Specific
| Key | Action |
|-----|--------|
| `F5` | Run Lisp/Scheme file |
| `F6` | Load in REPL |
| `<Space>lr` | Start REPL |
| `<Space>ll` | Load file |
| `<Space>le` | Execute file |

### Lua-Specific
| Key | Action |
|-----|--------|
| `F5` | Run Lua file |
| `F6` | Source file (Neovim) |
| `<Space>Lr` | Run |
| `<Space>Ls` | Source |
| `<Space>Lf` | Format (stylua) |
| `<Space>Lc` | Check (luacheck) |

### R-Specific
| Key | Action |
|-----|--------|
| `F5` | Start R console |
| `F6` | Send file to R |
| `<Space>rr` | Start console |
| `<Space>rq` | Close console |
| `<Space>rf` | Send file |
| `<Space>rl` | Send line |
| `<Space>rs` | Send selection (visual) |
| `<Space>rh` | Help |
| `<Space>ro` | Object browser |
| `<Space>rv` | View DataFrame |
| `<Space>rc` | Clear all |
| `<Space>rp` | Run script (Rscript) |
| `<Space>ri` | R interactive |

### C#-Specific
| Key | Action |
|-----|--------|
| `F5` | Run C# project (dotnet run) |
| `F6` | Run tests (dotnet test) |
| `<Space>Cr` | Run |
| `<Space>Cb` | Build (dotnet build) |
| `<Space>Ct` | Test |
| `<Space>Cc` | Clean |
| `<Space>Cf` | Format (dotnet format) |
| `<Space>Cn` | New project |
| `<Space>Ca` | Add package |

### Swift-Specific
| Key | Action |
|-----|--------|
| `F5` | Run Swift project |
| `F6` | Run tests |
| `<Space>Sr` | Run (swift run) |
| `<Space>Sb` | Build (swift build) |
| `<Space>St` | Test (swift test) |
| `<Space>Sf` | Format (swift-format) |
| `<Space>Sl` | Lint (swiftlint) |
| `<Space>SX` | Xcode picker |
| `<Space>SB` | Xcode build |
| `<Space>ST` | Xcode test |
| `<Space>SD` | Select device |
| `<Space>SS` | Select scheme |

### Bash-Specific
| Key | Action |
|-----|--------|
| `F5` | Run shell script |
| `F6` | Shellcheck |
| `<Space>br` | Run |
| `<Space>bx` | Make executable (chmod +x) |
| `<Space>bc` | Shellcheck |
| `<Space>bf` | Format (shfmt) |
| `<Space>bd` | Debug mode (bash -x) |
| `<Space>bs` | Syntax check (bash -n) |

### Zig-Specific
| Key | Action |
|-----|--------|
| `F5` | Build & run (zig build run) |
| `F6` | Run tests (zig test) |
| `<Space>zr` | Run |
| `<Space>zb` | Build |
| `<Space>zt` | Test |
| `<Space>zf` | Format (zig fmt) |
| `<Space>zc` | AST check |
| `<Space>zd` | Debug build |
| `<Space>zR` | Release build |

### Elixir-Specific
| Key | Action |
|-----|--------|
| `F5` | Run Elixir (mix run) |
| `F6` | Run tests (mix test) |
| `<Space>er` | IEx REPL (iex -S mix) |
| `<Space>et` | Test all |
| `<Space>eT` | Test current file |
| `<Space>ef` | Format (mix format) |
| `<Space>ec` | Compile (mix compile) |
| `<Space>ed` | Get dependencies |
| `<Space>eD` | Dialyzer |
| `<Space>eC` | Credo |
| `<Space>ep` | Phoenix server |

### Haskell-Specific
| Key | Action |
|-----|--------|
| `F5` | Run Haskell (stack/cabal run) |
| `F6` | Run tests |
| `<Space>hr` | GHCi REPL |
| `<Space>hb` | Build (stack/cabal) |
| `<Space>ht` | Test |
| `<Space>hf` | Format (ormolu) |
| `<Space>hl` | Lint (hlint) |
| `<Space>hc` | Compile (ghc) |
| `<Space>hh` | Hoogle signature |
| `<Space>he` | Eval all |

### Scala-Specific
| Key | Action |
|-----|--------|
| `F5` | Run Scala (sbt run) |
| `F6` | Run tests (sbt test) |
| `<Space>mc` | Compile cascade |
| `<Space>mr` | Run |
| `<Space>mt` | Test |
| `<Space>mb` | Build (sbt compile) |
| `<Space>mf` | Format (scalafmt) |
| `<Space>mi` | Organize imports |
| `<Space>mh` | Hover worksheet |
| `<Space>ms` | Metals commands |
| `<Space>mR` | REPL (sbt console) |

### Nim-Specific
| Key | Action |
|-----|--------|
| `F5` | Compile & run (nim compile --run) |
| `F6` | Run tests (nimble test) |
| `<Space>nr` | Run |
| `<Space>nb` | Build (nim compile) |
| `<Space>nc` | Check (nim check) |
| `<Space>nt` | Test (nimble test) |
| `<Space>nf` | Format (nimpretty) |
| `<Space>nd` | Generate docs |
| `<Space>nR` | Release build |
| `<Space>nD` | Debug build |

### Terminal
| Key | Action |
|-----|--------|
| `Ctrl+\` | Toggle floating terminal |
| `<Space>tf` | Open terminal (float) |
| `<Space>th` | Open terminal (horizontal split) |
| `<Space>tv` | Open terminal (vertical split) |
| `Esc` (in terminal) | Exit terminal mode |

### Git
| Key | Action |
|-----|--------|
| `]c` | Next hunk |
| `[c` | Previous hunk |
| `<Space>hs` | Stage hunk |
| `<Space>hr` | Reset hunk |
| `<Space>hb` | Blame line |
| `<Space>hp` | Preview hunk |
| `<Space>hd` | Diff this |

### Diagnostics
| Key | Action |
|-----|--------|
| `<Space>xx` | Toggle diagnostics |
| `<Space>xX` | Buffer diagnostics |
| `<Space>q` | Diagnostic quickfix |

### Comments
| Key | Action |
|-----|--------|
| `gcc` | Toggle line comment |
| `gbc` | Toggle block comment |
| `gc` (visual) | Toggle comment |

## Language Server Setup

All language servers and tools are automatically installed via Mason on first launch.

### Rust
- `rust-analyzer`: Language server with clippy integration
- `codelldb`: Debugger
- `rustfmt`: Formatter

### Go
- `gopls`: Language server
- `goimports`: Import management
- `gofumpt`: Strict formatter
- `delve`: Debugger
- Go tooling: gomodifytags, impl

### Python
- `pyright`: Fast type-aware language server
- `black`: Code formatter
- `isort`: Import sorter
- `debugpy`: Debugger

### C/C++
- `clangd`: Language server with clang-tidy
- `clang-format`: Code formatter
- `codelldb`: Debugger

### Java
- `jdtls`: Eclipse JDT language server
- `google-java-format`: Code formatter
- `java-debug-adapter`: Debugger
- `java-test`: Test runner

### TypeScript/JavaScript
- `typescript-language-server`: Language server
- `prettier`: Code formatter
- `eslint_d`: Fast linter
- `js-debug-adapter`: Debugger

### PHP
- `intelephense`: Language server
- `php-cs-fixer`: Code formatter
- `phpstan`: Static analyzer
- `php-debug-adapter`: Xdebug debugger

### SQL
- `sqlls`: SQL language server
- `sqlfluff`: Formatter and linter
- `sql-formatter`: SQL formatter

### Kotlin
- `kotlin-language-server`: Kotlin LSP
- `ktlint`: Formatter and linter

### Dart/Flutter
- `dartls`: Dart language server (via Flutter SDK)
- `dart-debug-adapter`: Debugger
- `flutter-tools`: Complete Flutter tooling

### Ruby
- `ruby-lsp`: Modern Ruby language server
- `rubocop`: Formatter and linter

### Lisp
- SBCL for Common Lisp (external dependency)
- Racket for Scheme (external dependency)
- `vlime`: Neovim plugin for Lisp development

### Lua
- `lua_ls`: Lua language server
- `stylua`: Lua formatter
- `luacheck`: Lua linter

### R
- `r-languageserver`: R language server
- `styler`: R formatter (via R package)
- `R.nvim`: Complete R development environment

### C#
- `omnisharp`: C# language server
- `netcoredbg`: .NET debugger
- `csharpier`: C# formatter (optional, can use dotnet format)

### Swift
- `sourcekit-lsp`: Swift language server
- `swiftformat`: Swift formatter
- `xcodebuild.nvim`: Xcode integration

### Bash
- `bash-language-server`: Bash LSP
- `shellcheck`: Shell script analyzer
- `shfmt`: Shell script formatter

### Zig
- `zls`: Zig language server
- Built-in `zig fmt` for formatting

### Elixir
- `elixir-ls`: Elixir language server
- Built-in `mix format` for formatting
- `credo`: Elixir static code analyzer
- `dialyzer`: Static analyzer for Erlang/Elixir

### Haskell
- `haskell-language-server`: Haskell LSP
- `ormolu`: Haskell formatter
- `hlint`: Haskell linter
- `hoogle`: Haskell API search

### Scala
- `nvim-metals`: Scala Metals integration
- `scalafmt`: Scala formatter
- `sbt`: Scala build tool

### Nim
- `nim-langserver`: Nim language server
- `nimpretty`: Nim formatter
- Built-in `nim check` for validation

## Formatting

### Auto-format on Save
Enabled by default for all supported languages:
- **Rust**: rustfmt
- **Go**: goimports + gofumpt
- **Python**: isort + black
- **C/C++**: clang-format
- **Java**: google-java-format
- **TypeScript/JavaScript**: prettier
- **PHP**: php-cs-fixer
- **SQL**: sqlfluff
- **Kotlin**: ktlint
- **Dart**: dart format
- **Ruby**: rubocop
- **R**: styler
- **C#**: csharpier (or dotnet format)
- **Swift**: swiftformat
- **Bash/Zsh**: shfmt
- **Zig**: zig fmt
- **Elixir**: mix format
- **Haskell**: ormolu
- **Scala**: scalafmt
- **Nim**: nimpretty
- **HTML/CSS**: prettier
- **Lua**: stylua

### Manual Format
Press `<Space>f` to format the current buffer.

## Testing

### Rust
Use rustaceanvim commands:
- `<Space>rt` - Run tests with test runner
- `<Space>rr` - Run current runnable
- `<Space>dr` - Debug current runnable

### Go
Use go.nvim commands:
- `<Space>gt` - Run all tests in file
- `<Space>gT` - Run test under cursor
- `<Space>gc` - Show test coverage

## Debugging

### Starting a Debug Session
1. Set breakpoints with `<Space>b`
2. Press `F5` to start debugging
3. Use `F1/F2/F3` to step through code
4. Debug UI opens automatically

### Rust Debugging
The debugger will prompt for the executable path:
```
target/debug/your_binary
```

### Go Debugging
Automatically configured via go.nvim and Delve.

## File Explorer

Press `<Space>e` to toggle the file tree:
- `<CR>` - Open file/folder
- `a` - Create file
- `d` - Delete file
- `r` - Rename file
- `x` - Cut file
- `c` - Copy file
- `p` - Paste file
- `R` - Refresh tree

## Customization

### Changing Color Scheme
Edit `~/.config/nvim/lua/plugins/colorscheme.lua` and change:
```lua
vim.cmd.colorscheme("tokyonight")
```

Popular alternatives:
- `catppuccin`
- `gruvbox`
- `nord`
- `onedark`

### Adding Plugins
Create a new file in `~/.config/nvim/lua/plugins/`:
```lua
return {
  {
    "author/plugin-name",
    config = function()
      -- plugin configuration
    end,
  },
}
```

## Troubleshooting

### Plugins Not Installing
```bash
nvim --headless "+Lazy! sync" +qa
```

### LSP Not Working
1. Check Mason: `:Mason`
2. Verify servers installed: `:LspInfo`
3. Reinstall server: `:Mason` → select server → press `i`

### Rust-Analyzer Issues
```bash
rustup component add rust-analyzer
```

### Go Tools Missing
```bash
go install golang.org/x/tools/gopls@latest
go install github.com/go-delve/delve/cmd/dlv@latest
```

### Check Health
```vim
:checkhealth
```

## System Requirements

- Neovim ≥ 0.10.0 ✅ (You have 0.11.3)
- Git
- Rust toolchain ✅ (rust-analyzer, rustfmt, clippy)
- Go toolchain ✅ (go ≥ 1.20)
- ripgrep (for Telescope grep)
- fd (for Telescope find, optional)
- Node.js (for some LSP servers, optional)

## Project Structure

```
~/.config/nvim/
├── init.lua                    # Main config entry
└── lua/
    └── plugins/
        ├── colorscheme.lua     # Color scheme
        ├── completion.lua      # Autocompletion
        ├── debug.lua           # Debugging (DAP)
        ├── editor.lua          # Editor enhancements
        ├── formatting.lua      # Code formatting
        ├── git.lua             # Git integration
        ├── go.lua              # Go-specific
        ├── lsp.lua             # Language servers
        ├── rust.lua            # Rust-specific
        ├── telescope.lua       # Fuzzy finder
        ├── treesitter.lua      # Syntax highlighting
        └── ui.lua              # UI components
```

## Next Steps

1. Launch Neovim: `nvim`
2. Wait for plugin installation
3. Restart Neovim
4. Open a Rust project: `nvim src/main.rs`
5. Open a Go project: `nvim main.go`
6. Try key bindings and explore features

Enjoy your new IDE-like Neovim experience! 🚀
