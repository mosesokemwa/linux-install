#!/bin/bash


##
## Bash install script for students learning how to codeusing Ubuntu 16.04
## 
## - AUTHOR:  Moses <mussaimo> Okemwa
## - VERSION: 1.0
##

set -eo pipefail

has() {
  [[ -x "$(command -v "$1")" ]];
}

has_not() {
  ! has "$1" ;
}

ok() {
  echo "→ "$1" OK"
}

sudo apt-get update
sudo apt-get install -y\
	wget

# PostgresSQL
if has_not postgresql; then
	sudo apt-get -y install postgresql \
		postgresql-contrib \
		libpq-dev
fi
ok "PostgreSQL"

# VS Code
if has_not code; then
  curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
  sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
  sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
  sudo apt-get -y install apt-transport-https
  sudo apt-get update
  sudo apt-get -y install code
fi
ok "VS Code"

if has_not mysql; then
  sudo apt-get install -y mysql-server
fi
ok "MySQL"

if has_not heroku; then
  wget -O- https://toolbelt.heroku.com/install-ubuntu.sh | sh
fi
ok "Heroku Toolbelt"

# python
if has_not python3.6; then
  sudo apt-get -y install python3.6
fi
ok "Python3.6"

if has_not pip; then
  sudo apt-get -y install build-essential \
    python-dev \
    python3-dev \
    python-pip \
    python3-pip
  sudo pip install --user --upgrade pip
  export PATH=~/.local/bin:$PATH
  source ~/.bashrc
  sudo pip install --upgrade pip 
  sudo pip install --upgrade virtualenv
fi
ok "pip"

if has_not node; then
	wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
	nvm install node
fi
ok "node"

# django for python 23
sudo apt-get -y install python3-django

# Clean up
sudo apt-get autoclean -y
sudo apt-get autoremove -y

ok "Installation finished!"

# Upgrading system
sudo apt-get -y install -f 
sudo apt-get upgrade
sudo apt-get -y dist-upgrade

ok "Sytem upgraded"
