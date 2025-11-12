#!/bin/bash
# Neovim Configuration Installer for Rust & Go Development
# Usage: curl -fsSL https://raw.githubusercontent.com/YOUR_USERNAME/nvim-config/main/install.sh | bash

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${GREEN}=== Neovim Configuration Installer ===${NC}"
echo ""

# Check Neovim version
if ! command -v nvim &> /dev/null; then
    echo -e "${RED}✗ Neovim not found${NC}"
    echo "Please install Neovim 0.10+ from: https://github.com/neovim/neovim/releases"
    exit 1
fi

NVIM_VERSION=$(nvim --version | head -n1 | grep -oE '[0-9]+\.[0-9]+')
echo -e "${GREEN}✓ Neovim $NVIM_VERSION found${NC}"

# Backup existing config
if [ -d "$HOME/.config/nvim" ]; then
    BACKUP_DIR="$HOME/.config/nvim.backup.$(date +%Y%m%d_%H%M%S)"
    echo -e "${YELLOW}⚠ Backing up existing config to: $BACKUP_DIR${NC}"
    mv "$HOME/.config/nvim" "$BACKUP_DIR"
fi

# Clone or copy config
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
if [ "$SCRIPT_DIR" = "$HOME/.config/nvim" ]; then
    echo -e "${GREEN}✓ Already in nvim config directory${NC}"
else
    echo "Copying configuration files..."
    mkdir -p "$HOME/.config"
    cp -r "$SCRIPT_DIR" "$HOME/.config/nvim"
fi

# Check system dependencies
echo ""
echo "Checking system dependencies..."

check_tool() {
    if command -v $1 &> /dev/null; then
        echo -e "${GREEN}✓ $1${NC}"
        return 0
    else
        echo -e "${YELLOW}⚠ $1 not found${NC}"
        return 1
    fi
}

check_tool git
check_tool gcc || check_tool clang
check_tool make
check_tool curl

# Check language toolchains
echo ""
echo "Checking language toolchains..."

RUST_INSTALLED=false
GO_INSTALLED=false

if command -v rustc &> /dev/null; then
    RUST_VERSION=$(rustc --version | awk '{print $2}')
    echo -e "${GREEN}✓ Rust $RUST_VERSION${NC}"
    RUST_INSTALLED=true
else
    echo -e "${YELLOW}⚠ Rust not found${NC}"
    echo "  Install from: https://rustup.rs"
fi

if command -v go &> /dev/null; then
    GO_VERSION=$(go version | awk '{print $3}')
    echo -e "${GREEN}✓ Go $GO_VERSION${NC}"
    GO_INSTALLED=true
else
    echo -e "${YELLOW}⚠ Go not found${NC}"
    echo "  Install from: https://go.dev/dl"
fi

# Install optional tools
echo ""
echo "Checking optional tools for better experience..."

if ! command -v rg &> /dev/null; then
    echo -e "${YELLOW}⚠ ripgrep not found (recommended for Telescope)${NC}"
    echo "  Install: brew install ripgrep  # macOS"
    echo "           apt install ripgrep   # Ubuntu/Debian"
fi

if ! command -v fd &> /dev/null; then
    echo -e "${YELLOW}⚠ fd not found (optional for Telescope)${NC}"
    echo "  Install: brew install fd  # macOS"
    echo "           apt install fd-find  # Ubuntu/Debian"
fi

# Install Rust tools
if [ "$RUST_INSTALLED" = true ]; then
    echo ""
    echo "Installing Rust development tools..."
    rustup component add rust-analyzer rustfmt clippy 2>/dev/null || true
    echo -e "${GREEN}✓ Rust tools configured${NC}"
fi

# Install Go tools
if [ "$GO_INSTALLED" = true ]; then
    echo ""
    echo "Installing Go development tools..."
    go install golang.org/x/tools/gopls@latest
    go install github.com/go-delve/delve/cmd/dlv@latest
    go install mvdan.cc/gofumpt@latest
    go install golang.org/x/tools/cmd/goimports@latest
    echo -e "${GREEN}✓ Go tools installed${NC}"
fi

# Launch Neovim to install plugins
echo ""
echo "Installing Neovim plugins..."
echo "This may take 1-2 minutes..."

nvim --headless "+Lazy! sync" +qa 2>/dev/null || true

echo ""
echo -e "${GREEN}=== Installation Complete! ===${NC}"
echo ""
echo "Next steps:"
echo "1. Launch Neovim: nvim"
echo "2. Wait for any remaining plugin installations"
echo "3. Restart Neovim if needed"
echo "4. Open a Rust or Go file to test"
echo ""
echo "Key bindings:"
echo "  Space      - Leader key (show all commands)"
echo "  Space e    - File explorer"
echo "  Space ff   - Find files"
echo "  Space fg   - Grep in files"
echo "  gd         - Go to definition"
echo "  K          - Hover documentation"
echo ""
echo "Full documentation: cat ~/.config/nvim/README.md"
echo ""
echo "Happy coding! 🚀"
