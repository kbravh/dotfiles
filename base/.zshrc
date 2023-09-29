# Load dotfiles
source "$HOME/.env"
source "$HOME/.functions"
source "$HOME/.aliases"

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

# Alter Spaceship prompt
SPACESHIP_PROMPT_ORDER=(
  user
  dir
  git
  line_sep
  exit_code
  char
)

SPACESHIP_CHAR_SYMBOL="λ "

source /opt/homebrew/opt/spaceship/spaceship.zsh

# bun completions
[ -s "/Users/kareybh/.bun/_bun" ] && source "/Users/kareybh/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
