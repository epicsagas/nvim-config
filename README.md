# Neovim Configuration for Rust & Go Development

Modern Neovim setup with full LSP support, debugging, formatting, and IDE-like features for Rust and Go.

## Features

### Core
- **Plugin Manager**: lazy.nvim (automatic installation)
- **LSP**: Full language server support via Mason
- **Completion**: nvim-cmp with snippets
- **Fuzzy Finding**: Telescope for files, grep, symbols
- **Syntax Highlighting**: Treesitter
- **Debugging**: nvim-dap with UI

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

## Quick Start

### Fresh Installation (Clone from Git)

**Option 1: Automatic Installation**
```bash
# Clone the repository
git clone https://github.com/YOUR_USERNAME/nvim-config.git ~/.config/nvim

# Run installer
cd ~/.config/nvim
./install.sh
```

**Option 2: Manual Installation**
```bash
# Clone the repository
git clone https://github.com/YOUR_USERNAME/nvim-config.git ~/.config/nvim

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
git remote add origin https://github.com/YOUR_USERNAME/nvim-config.git
git push -u origin main

# On other machines
git clone https://github.com/YOUR_USERNAME/nvim-config.git ~/.config/nvim
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
| `F5` | Start/Continue debugging |
| `F1` | Step into |
| `F2` | Step over |
| `F3` | Step out |
| `F7` | Toggle debug UI |
| `<Space>b` | Toggle breakpoint |
| `<Space>B` | Conditional breakpoint |

### Rust-Specific
| Key | Action |
|-----|--------|
| `<Space>rr` | Run runnables |
| `<Space>rt` | Run testables |
| `<Space>dr` | Debug runnables |
| `<Space>re` | Expand macro |
| `<Space>rc` | Open Cargo.toml |
| `<Space>rh` | Hover actions |

### Go-Specific
| Key | Action |
|-----|--------|
| `<Space>gt` | Run tests |
| `<Space>gT` | Run test function |
| `<Space>gc` | Show coverage |
| `<Space>gi` | Add if err |
| `<Space>gf` | Fill struct |
| `<Space>ga` | Go to alternate file |
| `<Space>gm` | Go mod tidy |
| `<Space>ge` | Go generate |

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

### Rust
The configuration automatically installs:
- `rust-analyzer`: Language server
- `codelldb`: Debugger
- `rustfmt`: Formatter (via cargo)

Clippy is enabled by default for enhanced diagnostics.

### Go
The configuration automatically installs:
- `gopls`: Language server
- `goimports`: Import management
- `gofumpt`: Strict formatter
- `delve`: Debugger
- Go tooling: gomodifytags, impl

### Additional Languages
The LSP setup includes `lua_ls` for Neovim configuration editing.

## Formatting

### Auto-format on Save
Enabled by default for:
- **Rust**: rustfmt
- **Go**: goimports + gofumpt
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
