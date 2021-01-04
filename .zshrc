# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Load dotfiles
source "$HOME/.env"
source "$HOME/.functions"
source "$HOME/.aliases"
source "$HOME/.inputrc"

# Load zsh plugins
source ~/dotfiles/zsh_plugins/zsh_plugins.zsh

# Load zoxide
eval "$(zoxide init zsh)"

# nvm settings
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

fpath=($fpath "/home/karey/.zfunctions")

# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
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
fpath=($fpath "/home/karey/.zfunctions")

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true
