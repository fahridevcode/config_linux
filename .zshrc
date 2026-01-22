if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# =====================================================
# PATHS
# =====================================================
export PATH="$HOME/.local/bin:$HOME/.cargo/bin:$PATH"

# Bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Homebrew (Linux)
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# SDKMAN
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"

fpath=(~/.zsh/plugins/zsh-completions/src $fpath)
autoload -Uz compinit
compinit

source ~/.zsh/fzf-tab/fzf-tab.plugin.zsh

# =====================================================
# PLUGINS (MANUAL, FAST, STABLE)
# =====================================================
source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

# =====================================================
# POWERLEVEL10K THEME
# =====================================================
source ~/.oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
HISTFILE=~/.zsh_history
HISTSIZE=20000
SAVEHIST=20000
setopt APPEND_HISTORY SHARE_HISTORY INC_APPEND_HISTORY  
setopt HIST_IGNORE_ALL_DUPS HIST_REDUCE_BLANKS

export LS_COLORS="$(cat ~/.config/ls_colors)"

# Files
alias ls='eza --icons=auto --group-directories-first --color=always'
alias ll='eza -lah --icons=auto --group-directories-first --color=always'
alias la='eza -a --icons --color=always'
alias tree='eza --tree --icons'
alias lst='eza --tree -a -L 2 --icons'

# File Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias home='cd ~'
alias desk='cd ~/Desktop'
alias docs='cd ~/Documents'
alias dl='cd ~/Downloads'
alias mkdirp='mkdir -pv'
alias rmf='rm -rf'
alias c='clear'
alias h='history'

# Search Impection
alias grep='rg'
alias findd='fd'
alias cat='bat --paging=never'
alias preview='bat --style=numbers --color=always'

# Node / Bun / Pnpm
alias ni='npm install'
alias ns="npm start"
alias nrs='npm run start'
alias nrt='npm run test'
alias nrl='npm run lint'
alias nrd='npm run dev'
alias nrb='npm run build'

alias bi='bun install'
alias bd='bun dev'
alias bb='bun build'
alias br='bun run'

alias piu='pnpm install'
alias pua='pnpm update'

# Composer 
alias ci='composer install'
alias cu='composer update'
alias cr='composer require'
alias cda='composer dump-autoload'

# PHP / Laravel
alias p='php'
alias pas='php artisan serve'
alias pam='php artisan migrate'
alias paf='php artisan migrate:fresh --seed'
alias pak='php artisan key:generate'
alias parc='php artisan route:clear'
alias pacl='php artisan cache:clear'
alias paevent='php artisan event:clear'
alias paopt='php artisan optimize:clear'
alias pamakec='php artisan make:controller'
alias pamakem='php artisan make:model'
alias pamaker='php artisan make:request'
alias pamakemig='php artisan make:migration'
alias pamakef='php artisan make:factory'
alias pamakes='php artisan make:seeder'
alias patinker='php artisan tinker'
alias pasw='php artisan storage:link'

# Python
alias venv='python -m venv .venv'
alias vact='source .venv/bin/activate'
alias vdeact='deactivate'
alias pyr='python manage.py runserver'
alias pym='python manage.py migrate'

# PHP Server
alias phps='php -S localhost:8000'

# Git
alias gs='git status -sb'
alias ga='git add .'
alias gap='git add -p'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gbd='git branch -D'
alias gl='git log --oneline --graph --decorate'
alias gdiff='git diff'
alias gshow='git show'
alias gfetch='git fetch --all --prune'
alias gsave='git stash push -m'
alias gpop='git stash pop'
alias greset='git reset --hard'
alias ghead='git rev-parse --abbrev-ref HEAD'

# Docker
alias dps='docker ps'
alias dpsa='docker ps -a'
alias dlogs='docker logs -f'
alias dstop='docker stop'
alias dstart='docker start'
alias dstat='docker stats'
alias dcleanall='docker system prune -a --volumes'

# System
alias ports='ss -tulpn'
alias myip='ip a'
alias disk='df -h'

# System & Network
alias cpu='lscpu'
alias mem='free -h'
alias top='htop'
alias pingg='ping google.com'
alias speed='speedtest-cli'
alias reboot='sudo reboot'
alias shutdown='sudo shutdown now'

# Utilities
alias reload='source ~/.zshrc'
alias zedit='nano ~/.zshrc'
alias zshrc='code ~/.zshrc'
alias aliases='alias | sort'

# PostgreSQL
alias pgroot='psql -h 127.0.0.1 -U myuser -d postgres'
alias pgdb='psql -h 127.0.0.1 -U myuser'

# MongoDB
alias mongo-admin='mongosh -u admin -p --authenticationDatabase admin'
alias mongo-local='mongosh'

export FZF_DEFAULT_COMMAND='fd --hidden --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd --type d'

export FZF_DEFAULT_OPTS='
--height=40%
--layout=reverse
--border
--preview "bat --style=numbers --color=always {}"
'
[ -f "$HOME/.local/bin/env" ] && source "$HOME/.local/bin/env"
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

cd() {
  builtin cd "$@" || return

  [[ "$PWD" == "/" ]] && return

  if [[ -z "$(ls -A . 2>/dev/null)" ]]; then
    echo
    print -P "  %K{229}%F{238}  ⚠  No such file or directory  %k%f"
    echo
  fi
}
