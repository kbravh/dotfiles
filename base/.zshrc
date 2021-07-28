# Load dotfiles
source "$HOME/.env"
source "$HOME/.functions"
source "$HOME/.aliases"
source "$HOME/.inputrc"

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

# nvm settings
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

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

fpath=($fpath "/home/kbravh/.zfunctions")

# Set Spaceship ZSH as a prompt
autoload -Uz promptinit
promptinit
prompt spaceship

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
