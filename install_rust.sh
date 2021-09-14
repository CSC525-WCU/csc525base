#!/bin/bash

set -x

sudo apt-get update -qq --fix-missing 
sudo apt-get install -qq -y build-essential tmux git gdb wget nano vim sudo wamerican gcc-multilib valgrind
sudo git clone https://github.com/longld/peda.git

while IFS= read -r line; do
  echo "source /peda/peda.py" > /users/${line}/.gdbinit && \
  chown ${line}: /users/${line}/.gdbinit
  cd /users/${line}
  git clone https://github.com/remzi-arpacidusseau/ostep-code.git
  chown -R ${line}: /users/${line}/ostep-code
  echo "curl https://sh.rustup.rs -sSf | sh -s -- -y" > /users/${line}/setup.sh
  chmod 755 /users/${line}/setup.sh
  chown -R ${line}: /users/${line}/setup.sh
done < <( ls -l /users | grep 4096 | cut -d' ' -f3 )
