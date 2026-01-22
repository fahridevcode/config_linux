# Alacritty Terminal Installation & Configuration

## 🚀 **Alacritty Installation**

### **macOS (via Homebrew)**
```bash
# Install Alacritty
brew install --cask alacritty

# Or install from source with all features
brew install alacritty --no-quarantine
```

### **Linux (Ubuntu/Debian)**
```bash
# Install dependencies
sudo apt update
sudo apt install -y cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3

# Install Rust (if not already installed)
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env

# Install Alacritty from source
cargo install alacritty

# Or use package manager
sudo apt install -y alacritty
```

### **Linux (via package manager)**
```bash
# Ubuntu 22.04+ or Debian 12+
sudo apt install -y alacritty

# Fedora
sudo dnf install alacritty

# Arch Linux
sudo pacman -S alacritty

# OpenSUSE
sudo zypper install alacritty
```

### **Windows (via Scoop or Chocolatey)**
```bash
# Using Scoop
scoop install alacritty

# Using Chocolatey
choco install alacritty
```

## ⚙️ **Alacritty Configuration**

### **1. Create Configuration Directory**
```bash
# Create config directory
mkdir -p ~/.config/alacritty

# Create themes directory
mkdir -p ~/.config/alacritty/themes
```

### **2. Create Alacritty Configuration File**
Create `~/.config/alacritty/alacritty.toml` with the following content:

```toml
[general]
live_config_reload = true

[terminal]
shell = { program = "/usr/bin/zsh", args = ["-l"] }

[window]
title = "Alacritty"
dynamic_title = true
decorations = "full"  # Options: "full", "none", "transparent", "buttonless"
startup_mode = "Windowed"  # Options: "Windowed", "Maximized", "Fullscreen", "SimpleFullscreen"
opacity = 0.95
padding = { x = 20, y = 20 }
dimensions = { columns = 120, lines = 35 }

# Window positioning (optional)
# position = { x = 100, y = 100 }

# Background color (optional)
# background_color = "#1e1e2e"

[font]
size = 14.0
builtin_box_drawing = true

normal = { family = "MesloLGS NF", style = "Regular" }
bold = { family = "MesloLGS NF", style = "Bold" }
italic = { family = "MesloLGS NF", style = "Italic" }
bold_italic = { family = "MesloLGS NF", style = "Bold Italic" }

# Fallback fonts in case primary is not available
font_fallback = [
  { family = "Monaco" },
  { family = "Menlo" },
  { family = "DejaVu Sans Mono" },
  { family = "Fira Code" },
  { family = "Cascadia Code" },
  { family = "JetBrains Mono" },
]

offset = { x = 0, y = 0 }
glyph_offset = { x = 0, y = 0 }

# Adjust letter spacing (optional)
# glyph_width = "Normal"  # Options: "Normal", "Half", "Double"

[cursor]
style = { shape = "Block", blinking = "On" }
unfocused_hollow = true
blink_interval = 750
blink_timeout = 5

# Cursor colors (optional)
# color = "#f5e0dc"
# text_color = "#1e1e2e"

[selection]
save_to_clipboard = true
semantic_escape_chars = ",│`|:\"' ()[]{}<>\t"

# Selection colors (optional)
# background_color = "#585b70"
# text_color = "#1e1e2e"

[scrolling]
history = 10000
multiplier = 3

[mouse]
hide_when_typing = true

# Mouse bindings (optional)
# bindings = [
#   { mouse = "Middle", action = "PasteSelection" }
# ]

[keyboard]
bindings = [
  # Font size adjustments
  { key = "Equals", mods = "Control|Shift", action = "IncreaseFontSize" },
  { key = "Minus", mods = "Control|Shift", action = "DecreaseFontSize" },
  { key = "Key0", mods = "Control", action = "ResetFontSize" },
  
  # Copy/Paste
  { key = "C", mods = "Control|Shift", action = "Copy" },
  { key = "V", mods = "Control|Shift", action = "Paste" },
  
  # Scrolling
  { key = "PageUp", mods = "Shift", action = "ScrollPageUp" },
  { key = "PageDown", mods = "Shift", action = "ScrollPageDown" },
  { key = "Home", mods = "Shift", action = "ScrollToTop" },
  { key = "End", mods = "Shift", action = "ScrollToBottom" },
  
  # Vi mode
  { key = "Space", mods = "Control|Shift", action = "ToggleViMode" },
  
  # Window management
  { key = "F", mods = "Control|Shift", action = "ToggleFullscreen" },
  { key = "N", mods = "Control|Shift", action = "SpawnNewInstance" },
  { key = "W", mods = "Control|Shift", action = "Quit" },
  
  # Navigation in Vi mode
  { key = "H", mode = "Vi|~Search", action = "Left" },
  { key = "J", mode = "Vi|~Search", action = "Down" },
  { key = "K", mode = "Vi|~Search", action = "Up" },
  { key = "L", mode = "Vi|~Search", action = "Right" },
  
  # Search
  { key = "F", mods = "Control|Shift", mode = "~Vi", action = "SearchForward" },
  { key = "B", mods = "Control|Shift", mode = "~Vi", action = "SearchBackward" },
]

[colors]
# Catppuccin Mocha theme
primary = {
  background = "#1e1e2e"
  foreground = "#cdd6f4"
}

normal = {
  black = "#45475a"
  red = "#f38ba8"
  green = "#a6e3a1"
  yellow = "#f9e2af"
  blue = "#89b4fa"
  magenta = "#f5c2e7"
  cyan = "#94e2d5"
  white = "#bac2de"
}

bright = {
  black = "#585b70"
  red = "#f38ba8"
  green = "#a6e3a1"
  yellow = "#f9e2af"
  blue = "#89b4fa"
  magenta = "#f5c2e7"
  cyan = "#94e2d5"
  white = "#a6adc8"
}

# Optional: indexed colors for 256-color mode
# indexed_colors = [
#   { index = 16, color = "#fab387" },
#   { index = 17, color = "#f5e0dc" },
# ]

# Optional: transparent background
# draw_bold_text_with_bright_colors = true
# selection = {
#   text = "CellForeground"
#   background = "#585b70"
# }

# Optional: dim colors for unfocused text
# dim = {
#   background = "#1a1b26"
#   foreground = "#a9b1d6"
# }

[hints]
# Enable URL hints
enabled = [
  { regex = "(ipfs:|ipns:|magnet:|mailto:|gemini:|gopher:|https:|http:|news:|file:|git:|ssh:|ftp:)[^\\u0000-\\u001F\\u007F-\\u009F<>\"\\\\s{-}\\\\^⟨⟩`]+", hyperlink = true }
]

font = {
  size = 14
  style = "Bold"
}

# Hint colors
foreground = "#1e1e2e"
background = "#f5e0dc"

# Optional: border colors
# border = "#f5e0dc"
# border_width = 2

[env]
# Environment variables
TERM = "xterm-256color"
COLORTERM = "truecolor"

# Optional: Set editor
# EDITOR = "nvim"
# VISUAL = "nvim"

# Optional: Path adjustments
# PATH = "/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
```

### **3. Install Nerd Font (Required for Icons)**
```bash
# Install Meslo Nerd Font (recommended)
brew tap homebrew/cask-fonts
brew install --cask font-meslo-lg-nerd-font

# Alternative: Install via manual download
cd ~/Downloads
curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/Meslo.zip
unzip Meslo.zip -d ~/.fonts
fc-cache -fv

# Or install Fira Code Nerd Font
brew install --cask font-fira-code-nerd-font

# Check installed fonts
fc-list | grep -i "meslo\|nerd"
```

### **4. Set Alacritty as Default Terminal (macOS)**
```bash
# Set Alacritty as default terminal (macOS)
defaults write com.apple.Terminal "Default Window Settings" "Alacritty"
defaults write com.apple.Terminal "Startup Window Settings" "Alacritty"

# Or use third-party tool like duti
brew install duti
duti -s io.alacritty .zsh all
duti -s io.alacritty .sh all
duti -s io.alacritty .txt all
```

### **5. Create Desktop Entry (Linux)**
```bash
# Create desktop entry for Linux
cat > ~/.local/share/applications/alacritty.desktop << EOF
[Desktop Entry]
Name=Alacritty
GenericName=Terminal
Comment=A fast, cross-platform, OpenGL terminal emulator
Exec=alacritty
Icon=alacritty
Terminal=false
Type=Application
Categories=System;TerminalEmulator;
Keywords=terminal;shell;command;prompt;
StartupNotify=true
EOF

# Update desktop database
update-desktop-database ~/.local/share/applications
```

## 🎨 **Themes Installation**

### **Install Popular Alacritty Themes**
```bash
# Clone Alacritty themes repository
git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes

# Or download individual themes
cd ~/.config/alacritty/themes
curl -O https://raw.githubusercontent.com/alacritty/alacritty-theme/master/themes/catppuccin_mocha.toml
curl -O https://raw.githubusercontent.com/alacritty/alacritty-theme/master/themes/dracula.toml
curl -O https://raw.githubusercontent.com/alacritty/alacritty-theme/master/themes/gruvbox_dark.toml
curl -O https://raw.githubusercontent.com/alacritty/alacritty-theme/master/themes/nord.toml
curl -O https://raw.githubusercontent.com/alacritty/alacritty-theme/master/themes/solarized_dark.toml
curl -O https://raw.githubusercontent.com/alacritty/alacritty-theme/master/themes/tokyo_night.toml
```

### **Switch Between Themes**
To switch themes, modify your `alacritty.toml`:
```toml
# Import a theme
import = ["~/.config/alacritty/themes/catppuccin_mocha.toml"]

# Or inline theme configuration (as shown in the config above)
```

## ⚡ **Performance Optimization**

### **GPU Acceleration Configuration**
```toml
# In ~/.config/alacritty/alacritty.toml
[renderer]
backend = "Gl"  # Options: "Gl", "None"
vsync = true
```

### **Disable Bell**
```toml
[bell]
animation = "None"  # Options: "None", "Ease", "EaseOut", "EaseOutSine", "Linear"
duration = 0
color = "#ffffff"
```

## 🔧 **Troubleshooting**

### **1. Font Not Displaying Properly**
```bash
# Check if font is installed
fc-list | grep -i "meslo"

# Set fallback fonts in config
font_fallback = [
  { family = "Monaco" },
  { family = "Menlo" },
  { family = "DejaVu Sans Mono" },
  { family = "Fira Code" },
]

# Clear font cache
fc-cache -fv
```

### **2. Colors Not Working**
```bash
# Check terminal color support
echo $TERM
# Should output: xterm-256color or alacritty

# Force 256 colors
export TERM=xterm-256color

# Test colors
curl -s https://gist.githubusercontent.com/lifepillar/09a44b8cf0f9397465614e622979107f/raw/24-bit-color.sh | bash
```

### **3. Configuration Not Reloading**
```bash
# Check config file location
ls -la ~/.config/alacritty/

# Ensure live reload is enabled
# In alacritty.toml:
live_config_reload = true

# Check file permissions
chmod 644 ~/.config/alacritty/alacritty.toml
```

### **4. Alacritty Not Starting**
```bash
# Check for errors
alacritty --print-events

# Check dependencies
ldd $(which alacritty)

# Test with minimal config
alacritty --config-file /dev/null
```

## 📁 **Useful Alacritty Commands**

### **Launch with Specific Configuration**
```bash
# Launch with custom config
alacritty --config-file ~/.config/alacritty/custom.toml

# Launch in specific directory
alacritty --working-directory ~/projects

# Launch with specific title
alacritty --title "Development Terminal"

# Launch with different font size
alacritty --option font.size=16
```

### **Keybindings Reference**
```
Ctrl+Shift+C         Copy selected text
Ctrl+Shift+V         Paste clipboard content
Ctrl+Shift+F         Toggle fullscreen
Ctrl+Shift+N         Open new window
Ctrl+Shift+W         Close window
Ctrl+Shift++         Increase font size
Ctrl+Shift+-         Decrease font size
Ctrl+0               Reset font size
Ctrl+Shift+Space     Toggle Vi mode
```

## 🎯 **Integration with Development Environment**

### **Add Alacritty to ZSH Configuration**
Add to `~/.zshrc`:
```bash
# Alacritty integration
if [[ $TERM == alacritty ]]; then
    # Alacritty-specific configurations
    export COLORTERM=truecolor
    export TERM=xterm-256color
    
    # Set Alacritty tab title
    precmd() {
        echo -ne "\033]0;${PWD##*/}\007"
    }
fi
```

### **Neovim Integration**
Add to `~/.config/nvim/init.lua` (LazyVim):
```lua
-- Better terminal integration
vim.g.terminal_color_0 = "#45475a"
vim.g.terminal_color_1 = "#f38ba8"
vim.g.terminal_color_2 = "#a6e3a1"
vim.g.terminal_color_3 = "#f9e2af"
vim.g.terminal_color_4 = "#89b4fa"
vim.g.terminal_color_5 = "#f5c2e7"
vim.g.terminal_color_6 = "#94e2d5"
vim.g.terminal_color_7 = "#bac2de"
vim.g.terminal_color_8 = "#585b70"
vim.g.terminal_color_9 = "#f38ba8"
vim.g.terminal_color_10 = "#a6e3a1"
vim.g.terminal_color_11 = "#f9e2af"
vim.g.terminal_color_12 = "#89b4fa"
vim.g.terminal_color_13 = "#f5c2e7"
vim.g.terminal_color_14 = "#94e2d5"
vim.g.terminal_color_15 = "#a6adc8"
```

## 🔄 **Update Alacritty**

```bash
# Update via Homebrew
brew upgrade alacritty

# Update via Cargo
cargo install alacritty --force

# Check version
alacritty --version
```

## 📚 **Additional Resources**

- [Alacritty Official Documentation](https://alacritty.org/)
- [Alacritty Configuration](https://github.com/alacritty/alacritty/blob/master/alacritty.toml)
- [Alacritty Themes](https://github.com/alacritty/alacritty-theme)
- [Nerd Fonts](https://www.nerdfonts.com/)

Alacritty is now configured with your development environment! It provides GPU-accelerated rendering, true color support, and seamless integration with ZSH and Neovim. The configuration includes the Catppuccin Mocha theme, Meslo Nerd Font for icons, and optimized keybindings for productivity.
