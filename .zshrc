############################################################
# Homebrew integration
############################################################
eval "$(/opt/homebrew/bin/brew shellenv)"

############################################################
# Zinit plugin manager setup
############################################################
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source / Load Zinit
source "${ZINIT_HOME}/zinit.zsh"

############################################################
# EZA configuration
############################################################
zstyle ':omz:plugins:eza' 'dirs-first' yes
zstyle ':omz:plugins:eza' 'git-status' yes
zstyle ':omz:plugins:eza' 'icons' yes
zstyle ':omz:plugins:eza' 'show-group' yes

############################################################
# ZSH Plugins (essential and lazy-loaded)
############################################################
zinit light zsh-users/zsh-syntax-highlighting
zinit ice wait"1"; zinit light zsh-users/zsh-completions
zinit ice wait"1"; zinit light zsh-users/zsh-autosuggestions
zinit ice wait"2"; zinit light Aloxaf/fzf-tab

############################################################
# Oh-My-Zsh Snippets (lazy-loaded)
############################################################
zinit ice wait"1"; zinit snippet OMZP::aliases
zinit ice wait"2"; zinit snippet OMZP::ansible
zinit ice wait"2"; zinit snippet OMZP::aws
zinit ice wait"1"; zinit snippet OMZP::brew
zinit ice wait"2"; zinit snippet OMZP::command-not-found
zinit ice wait"2"; zinit snippet OMZP::common-aliases
zinit ice wait"2"; zinit snippet OMZP::debian
zinit ice wait"2"; zinit snippet OMZP::docker
zinit ice wait"2"; zinit snippet OMZP::docker-compose
zinit ice wait"2"; zinit snippet OMZP::dotenv
zinit ice wait"1"; zinit snippet OMZP::eza
zinit ice wait"2"; zinit snippet OMZP::gh
zinit ice wait"1"; zinit snippet OMZP::git
zinit ice wait"2"; zinit snippet OMZP::github
zinit ice wait"2"; zinit snippet OMZP::kitty
zinit ice wait"2"; zinit snippet OMZP::kubectl
zinit ice wait"2"; zinit snippet OMZP::kubectx
zinit ice wait"2"; zinit snippet OMZP::nmap
zinit ice wait"2"; zinit snippet OMZP::rust
zinit ice wait"2"; zinit snippet OMZP::ssh
zinit ice wait"2"; zinit snippet OMZP::ssh-agent
zinit ice wait"2"; zinit snippet OMZP::sudo

############################################################
# Completion system
############################################################
autoload -U compinit && compinit -C

zinit cdreplay -q

############################################################
# Oh-My-Posh Prompt
############################################################
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config ${HOME}/.config/ohmyposh/omp.toml)"
fi

############################################################
# History configuration
############################################################
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
# History options grouped for clarity
setopt appendhistory sharehistory hist_ignore_space hist_ignore_all_dups hist_save_no_dups hist_ignore_dups

############################################################
# Completion styling
############################################################
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLOR}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

############################################################
# Shell integrations
############################################################
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

############################################################
# Custom environment variables
############################################################
export LANG=en_US.UTF-8
export EDITOR='nvim'
export ARCHFLAGS='-arch x86_64'
export BAT_CONFIG_PATH=~/.config/bat/config.conf
export GPG_TTY=$(tty)
export PATH="$HOME/.local/bin:$HOME/.cargo/bin:$HOME/go/bin:$PATH"
export MONOREPO_ROOT="$HOME/Projects/monorepo"
export DOCKER_BUILDKIT=1

############################################################
# SSH/GPG agent integration
############################################################
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent

############################################################
# Custom aliases
############################################################
alias cat='bat'
alias vim='nvim'
alias vimdiff='nvim -d'
alias docker-compose='docker compose'
alias neofetch='fastfetch'

