# All the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)
source ~/.local/share/omarchy/default/bash/rc

# Add your own exports, aliases, and functions here.
#
# Make an alias for invoking commands you use constantly
alias weather="curl wttr.in"
alias yt="yt-dlp -x --no-mtime -o '$HOME/Music/%(title)s.%(ext)s' --add-metadata --no-playlist -x --audio-format mp3"
alias cp="cp -Rv"
alias mv="mv -v"
alias rsync="rsync --protect-args --compress --verbose --progress --human-readable"

