# Symlink bin scripts to local bin folder

for program in ../bin/*; do
  mv /usr/bin/local/program /usr/bin/local/program.bak
  ln -s ../bin/program /usr/bin/local/program
done
