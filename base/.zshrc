# Load dotfiles
source "$HOME/.env"
source "$HOME/.functions"
source "$HOME/.aliases"

# Load zsh plugins
source ~/dotfiles/zsh_plugins/zsh_plugins.zsh

# Load zoxide
eval "$(zoxide init zsh)"

# Load dir_colors
test -r ~/.dir_colors && eval $(dircolors ~/.dir_colors)

# History settings
export HISTFILE=~/.zsh_history
export HISTFILESIZE=1000000000
export HISTSIZE=1000000000
export SAVEHIST=10000000
export HISTTIMEFORMAT="[%F %T] "
setopt INC_APPEND_HISTORY # incrementally append history instead of at shutdown
setopt EXTENDED_HISTORY # include timestamp
setopt HIST_FIND_NO_DUPS # don't show duplicates when stepping through history
setopt HIST_IGNORE_ALL_DUPS # don't write duplicates to history
setopt HIST_VERIFY # expand history line into buffer before executing

# case insensitive tab completion
zstyle ':completion:*'  matcher-list 'm:{a-z}={A-Z}'

# tab completion of hidden files and folders
_comp_options+=(globdots)

# nvm settings
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# load direnv
if command -v direnv &> /dev/null; then
  eval "$(direnv hook zsh)"
fi

# Autoload nvm version from .nvmrc if found
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# Set Spaceship ZSH as a prompt
source "$HOME/.zsh/spaceship/spaceship.zsh"
autoload -Uz promptinit
promptinit

SPACESHIP_PROMPT_ORDER=(
  user
  dir
  git
  line_sep
  exit_code
  char
)

SPACESHIP_CHAR_SYMBOL="λ "

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true
fpath=($fpath "/home/kbravh/.zfunctions")
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# pnpm
export PNPM_HOME="/home/kbravh/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end
# bun completions
[ -s "/home/kbravh/.bun/_bun" ] && source "/home/kbravh/.bun/_bun"

# Bun
export BUN_INSTALL="/home/kbravh/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
fpath=($fpath "/home/kbravh/.zfunctions")

fpath+=${ZDOTDIR:-~}/.zsh_functions

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
. "/home/kbravh/.deno/env"
