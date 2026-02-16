# All the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)
source ~/.local/share/omarchy/default/bash/rc

# Add your own exports, aliases, and functions here.
source ~/.env
source "$HOME/.functions"
source "$HOME/.aliases"

# Load dir_colors
test -r ~/.dir_colors && eval $(dircolors ~/.dir_colors)

# History overrides (override omarchy defaults)
HISTFILESIZE=1000000000
HISTSIZE=1000000000
HISTTIMEFORMAT="[%F %T] "
