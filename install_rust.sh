#!/bin/bash

set -x

sudo apt-get update -qq --fix-missing 
sudo apt-get install -qq -y build-essential tmux git gdb wget nano vim sudo wamerican gcc-multilib valgrind
sudo git clone https://github.com/longld/peda.git

while IFS= read -r line; do
  echo "source /peda/peda.py" > /home/${line}/.gdbinit && \
  chown ${line}: /home/${line}/.gdbinit
done < <( ls -l /users | grep 4096 | cut -d' ' -f3 )
