# Symlink bin scripts to local bin folder
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# make bin dir
mkdir -p "$HOME/.local/bin"

for program_path in $SCRIPT_DIR/../bin/*; do
  program=$(basename $program_path)
  rm -f "$HOME/.local/bin/${program}.bak"
  [ -e "$HOME/.local/bin/${program}" ] && mv "$HOME/.local/bin/${program}" "$HOME/.local/bin/${program}.bak"
  ln -s "$program_path" "$HOME/.local/bin/${program}"
done
