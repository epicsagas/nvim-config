# Neovim Configuration for Multi-Language Development

Modern Neovim setup with full LSP support, debugging, formatting, and IDE-like features for **9 languages: Rust, Go, Python, C/C++, Java, TypeScript, JavaScript, and PHP**.

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

### Additional Languages
- `lua_ls`: Lua language server for Neovim configuration

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
