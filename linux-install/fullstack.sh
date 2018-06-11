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

# PostgresSQL
if has_not postgresql; then
	sudo apt-get install postgresql \
		postgresql-contrib \
		libpq-dev
fi
ok "PostgreSQL"

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
  sudo apt-get install python3.6
fi
ok "Python3.6"

if has_not pip; then
  sudo apt-get install build-essential \
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

# django for python 23
sudo apt-get install python3-django

# Clean up
sudo apt-get autoclean -y
sudo apt-get autoremove -y

ok "Installation finished!"

# Upgrading system
sudo apt-get -f install
sudo apt-get upgrade
sudo apt-get dist-upgrade

ok "Sytem upgraded"
