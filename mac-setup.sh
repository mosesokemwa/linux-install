#!/bin/bash


##
## Bash install script for macOS High Sierra - 10.13
##
## - AUTHOR:  Moses <mussaimo> Okemwa
## - VERSION: 1.1
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

if has_not brew; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# PostgresSQL
if has_not postgresql; then
	brew install postgresql \
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
  brew install --upgrade pip
  brew install --upgrade virtualenv
fi
ok "pip"

# django for python 2/3
sudo apt-get install python3-django

ok "Installation finished!"

# Upgrading system
brew update

ok "Sytem upgraded"

