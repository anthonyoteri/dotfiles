# Homebrew integration
eval "$(/opt/homebrew/bin/brew shellenv)"

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source / Load Zinit
source "${ZINIT_HOME}/zinit.zsh"

# Configure EZA snippet
zstyle ':omz:plugins:eza' 'dirs-first' yes
zstyle ':omz:plugins:eza' 'git-status' yes
zstyle ':omz:plugins:eza' 'icons' yes
zstyle ':omz:plugins:eza' 'show-group' yes

# Add in ZSH Plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::aliases
zinit snippet OMZP::ansible
zinit snippet OMZP::aws
zinit snippet OMZP::brew
zinit snippet OMZP::command-not-found
zinit snippet OMZP::common-aliases
zinit snippet OMZP::debian
zinit snippet OMZP::docker
zinit snippet OMZP::docker-compose
zinit snippet OMZP::dotenv
zinit snippet OMZP::eza
zinit snippet OMZP::gh
zinit snippet OMZP::git
zinit snippet OMZP::github
zinit snippet OMZP::kitty
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::nmap
zinit snippet OMZP::rust
zinit snippet OMZP::ssh
zinit snippet OMZP::ssh-agent
zinit snippet OMZP::sudo

# Load completions
autoload -U compinit && compinit

zinit cdreplay -q

# Add Starship prompt
eval "$(starship init zsh)"

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLOR}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

# Export custom environment variables
export LANG=en_US.UTF-8
export EDITOR='nvim'
export ARCHFLAGS='-arch x86_64'
export BAT_CONFIG_PATH=~/.config/bat/config.conf
export GPG_TTY=$(tty)
export PATH=${HOME}/.local/bin:${HOME}/.cargo/bin:${HOME}/go/bin:${PATH}
export MONOREPO_ROOT=${HOME}/Projects/monorepo
export DOCKER_BUILDKIT=1

# Custom aliases
alias cat='bat '
alias vim=$(which nvim)
alias vimdiff="$(which nvim) -d"
alias docker-compose="$(which docker) compose"
alias neofetch=fastfetch

