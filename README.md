# Development Environment Installation & Configuration

This document explains how to install and configure the development environment based on the provided ZSH configuration.

## 📋 System Prerequisites

### Operating System
- **Linux** (recommended: Ubuntu 22.04+, Debian 11+, or other modern distributions)
- **macOS** (via Homebrew)
- **WSL2** (for Windows users)

### Minimum Requirements
- RAM: 4GB (8GB recommended)
- Storage: 20GB free space
- Internet connection to download packages

## 🚀 Installation Steps

### 1. **Install ZSH and Oh My ZSH**

```bash
# Install ZSH
sudo apt update && sudo apt install -y zsh

# Set ZSH as default shell
chsh -s $(which zsh)

# Install Oh My ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

**Explanation:** ZSH (Z Shell) is a powerful shell with richer autocomplete features, themes, and plugins than the default bash. Oh My ZSH is a framework for managing ZSH configuration.

### 2. **Install Powerlevel10k Theme**

```bash
# Clone Powerlevel10k to themes directory
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
```

**Explanation:** Powerlevel10k is a very fast ZSH theme that is customizable with informative and visually appealing prompts.

### 3. **Install ZSH Plugins**

```bash
# Create directory for plugins
mkdir -p ~/.zsh/plugins

# Clone required plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions ~/.zsh/plugins/zsh-completions
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting ~/.zsh/plugins/fast-syntax-highlighting
git clone https://github.com/Aloxaf/fzf-tab ~/.zsh/plugins/fzf-tab
```

**Explanation:**
- **zsh-autosuggestions**: Provides automatic command suggestions based on history
- **zsh-completions**: Additional collection of completion definitions
- **fast-syntax-highlighting**: Fast syntax highlighting for ZSH
- **fzf-tab**: Uses fzf for interactive tab completion

### 4. **Install Modern Tools**

#### **Eza (Replacement for ls)**
```bash
# Install via Homebrew
brew install eza

# Or install from source
cargo install eza
```

**Explanation:** Eza is a modern replacement for `ls` with better colors, icons, and information.

#### **Bat (Replacement for cat)**
```bash
# Install via Homebrew
brew install bat

# Or install from Cargo
cargo install bat
```

**Explanation:** Bat is a replacement for `cat` with syntax highlighting, numbering, and pagination.

#### **Ripgrep (Replacement for grep)**
```bash
# Install via Homebrew
brew install ripgrep

# Or install from Cargo
cargo install ripgrep
```

**Explanation:** Ripgrep is a very fast search tool, better than traditional grep.

#### **fd (Replacement for find)**
```bash
# Install via Homebrew
brew install fd

# Or install from Cargo
cargo install fd-find
```

**Explanation:** fd is a faster and more user-friendly replacement for `find`.

### 5. **Install Package Managers**

#### **Homebrew (for Linux)**
```bash
# Install Homebrew for Linux
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Add to PATH
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
```

#### **SDKMAN (for Java/Kotlin/Groovy)**
```bash
# Install SDKMAN
curl -s "https://get.sdkman.io" | bash

# Restart shell or source
source "$HOME/.sdkman/bin/sdkman-init.sh"
```

#### **Bun (JavaScript Runtime)**
```bash
# Install Bun
curl -fsSL https://bun.sh/install | bash

# Add to PATH
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
```

### 6. **Install Runtime & Development Tools**

#### **Node.js (via SDKMAN or nvm)**
```bash
# Via SDKMAN
sdk install nodejs

# Or via nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
nvm install --lts
```

#### **PHP & Composer**
```bash
# Install PHP
sudo apt install -y php php-cli php-curl php-mbstring php-xml php-zip

# Install Composer
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
```

#### **Python**
```bash
# Install Python
sudo apt install -y python3 python3-pip python3-venv
```

#### **Docker**
```bash
# Install Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# Add user to docker group
sudo usermod -aG docker $USER
```

#### **PostgreSQL & MongoDB**
```bash
# PostgreSQL
sudo apt install -y postgresql postgresql-contrib

# MongoDB
curl -fsSL https://pgp.mongodb.com/server-7.0.asc | \
   sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg \
   --dearmor
echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list
sudo apt update
sudo apt install -y mongodb-org
```

### 7. **Configuration Files**

#### **Copy Configuration Files**
1. Copy `.zshrc` to home directory:
   ```bash
   cp .zshrc ~/.zshrc
   ```

2. Create cache directory for Powerlevel10k:
   ```bash
   mkdir -p ~/.cache
   ```

3. Generate Powerlevel10k configuration file:
   ```bash
   p10k configure
   ```

#### **LS_COLORS Color File**
```bash
# Download color scheme for ls/eza
curl -fsSL https://raw.githubusercontent.com/trapd00r/LS_COLORS/master/LS_COLORS -o ~/.config/ls_colors
```

### 8. **Installation Verification**

After everything is installed, restart the terminal or run:
```bash
source ~/.zshrc
```

Verify with commands:
```bash
# Check tool versions
zsh --version
eza --version
bat --version
rg --version
fd --version
node --version
php --version
python3 --version
docker --version
```

### 9. **Additional Configuration (Bash Compatibility)**

Create or update `~/.bashrc` with the following configuration for bash compatibility:

```bash
# Source global bashrc if it exists
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

# Load NVM (Node Version Manager)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Source custom environment variables
. "$HOME/.local/bin/env"

# SDKMAN configuration (MUST be at the end of the file)
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
```

**Explanation:**
- **Global bashrc sourcing**: Ensures system-wide bash settings are loaded
- **PATH configuration**: Adds user-local binaries to PATH
- **Bashrc.d directory**: Modular bash configuration files
- **NVM integration**: Node.js version management
- **Custom environment**: User-specific environment variables
- **SDKMAN**: Java/Kotlin/Groovy SDK management (must be loaded last)

### 10. **Neovim with LazyVim Installation**

#### **Install Neovim**
```bash
# Install Neovim from official PPA (Ubuntu/Debian)
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update
sudo apt install neovim

# Or install via Homebrew
brew install neovim

# Or install from source
sudo apt install -y ninja-build gettext cmake unzip curl
git clone https://github.com/neovim/neovim
cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
```

#### **Install LazyVim**
```bash
# Backup existing Neovim configuration
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak

# Install LazyVim
git clone https://github.com/LazyVim/starter ~/.config/nvim

# Remove the .git folder to personalize your config
rm -rf ~/.config/nvim/.git
```

#### **Configure LazyVim**
```bash
# Install lazygit (recommended for LazyVim)
sudo add-apt-repository ppa:lazygit-team/release
sudo apt update
sudo apt install lazygit

# Install tree-sitter CLI
npm install -g tree-sitter-cli

# Install ripgrep and fd (already installed in previous steps)
# These are required for telescope plugin

# Start Neovim and let LazyVim install plugins
nvim
```

**First-time setup in Neovim:**
1. LazyVim will automatically install all required plugins
2. Press `Enter` when prompted to download Mason packages
3. Wait for the installation to complete (may take 5-10 minutes)
4. Restart Neovim after installation

#### **Essential LazyVim Keybindings**
```
- `Space` + `s` + `f`: Find files with telescope
- `Space` + `s` + `g`: Live grep with telescope
- `Space` + `f` + `r`: Recent files
- `Space` + `e`: File explorer (neo-tree)
- `g` + `d`: Go to definition
- `K`: Hover documentation
- `Space` + `c` + `a`: Code actions
- `Space` + `l` + `d`: Open LazyVim dashboard
- `Space` + `L`: LazyVim plugin manager
```

#### **Install Language Servers via Mason**
Inside Neovim:
1. Press `Space` + `m`
2. Navigate to language servers you need (e.g., typescript, php, python, lua)
3. Press `i` to install

Recommended language servers:
- **TypeScript/JavaScript**: typescript-language-server
- **PHP**: intelephense or phpactor
- **Python**: pyright or jedi-language-server
- **Lua**: lua-language-server
- **HTML/CSS**: vscode-langservers-extracted
- **JSON**: vscode-json-language-server

## ⚙️ Main Environment Features

### 🎨 **UI/UX Enhancement**
- **Powerlevel10k**: Informative prompt with customizable segments
- **Eza**: File listing with icons and colors
- **Bat**: File preview with syntax highlighting
- **FZF**: Fuzzy finder for files and directories
- **Neovim with LazyVim**: Modern IDE-like text editor with minimal configuration

### 🔧 **Development Tools**
- **Multi-language support**: Node.js, PHP, Python, Java
- **Package managers**: npm, bun, pnpm, composer, pip
- **Database tools**: PostgreSQL, MongoDB
- **Containerization**: Docker with useful aliases
- **Version control**: Git with helpful aliases
- **Text editor**: Neovim with LazyVim configuration

### ⚡ **Performance**
- **Fast-syntax-highlighting**: Optimized highlighting for speed
- **Zsh-autosuggestions**: Responsive suggestions
- **Fzf-tab**: Fast and interactive tab completion
- **LazyVim**: Fast startup with lazy-loaded plugins

### 📁 **Useful Aliases**
- **File operations**: `ll`, `la`, `tree`, `lst`
- **Navigation**: `..`, `...`, `home`, `desk`
- **Development**: `php artisan`, `npm run`, `bun run`
- **Git**: `gs`, `ga`, `gco`, `gl`
- **System**: `myip`, `ports`, `disk`, `cpu`
- **Editor**: `nvim` or `vim` for Neovim

## 🔧 Troubleshooting

### Neovim/LazyVim Issues

#### **1. LazyVim not loading properly**
```bash
# Reset LazyVim
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim

# Reinstall
git clone https://github.com/LazyVim/starter ~/.config/nvim
```

#### **2. Mason packages not installing**
```bash
# Check network connectivity
nvim +Mason

# Or install manually via command line
:MasonInstall typescript-language-server python-lsp-server
```

#### **3. Tree-sitter parsing errors**
```bash
# Update tree-sitter parsers
nvim +TSUpdate

# Or manually update
:MasonUpdate
```

### Environment Variable Conflicts

If you encounter PATH conflicts between bash and zsh:
```bash
# Check current PATH
echo $PATH

# Compare bash and zsh PATHs
bash -c 'echo $PATH'
zsh -c 'echo $PATH'
```

## 📚 Additional Resources

- [Neovim Documentation](https://neovim.io/doc/)
- [LazyVim GitHub](https://github.com/LazyVim/LazyVim)
- [LazyVim Configuration Guide](https://www.lazyvim.org/configuration)
- [Mason.nvim Plugin Manager](https://github.com/williamboman/mason.nvim)

## 🎯 Productivity Tips

1. **Use Neovim terminal**: `:terminal` or `<C-\><C-n>` to navigate
2. **LazyVim cheat sheet**: `:LazyCheatsheet` to see all keybindings
3. **Quick file navigation**: `Space` + `s` + `f` in Neovim
4. **Project management**: Use telescope to switch between projects
5. **Debugging**: Install nvim-dap for debugging support

This complete development environment provides a powerful, modern setup with ZSH for the shell, Neovim with LazyVim for editing, and all essential development tools. Happy coding! 🚀
