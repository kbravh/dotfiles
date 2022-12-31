# Symlink bin scripts to local bin folder

for program in ../bin/*; do
  sudo rm -f "/usr/bin/${program}.bak"
  sudo mv "/usr/bin/${program}" "/usr/bin/${program}.bak"
  sudo ln -s "../bin/${program}" "/usr/bin/${program}"
done
