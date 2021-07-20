# Symlink bin scripts to local bin folder

for program in ../bin/*; do
  mv /usr/bin/program /usr/bin/program.bak
  ln -s ../bin/program /usr/bin/program
done
