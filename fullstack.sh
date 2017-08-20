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

if ! [[ -d "$HOME/.nvm" ]]; then
  NODE_VERSION=4
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.29.0/install.sh | bash
  source ~/.bashrc
  nvm install $NODE_VERSION
  nvm use $NODE_VERSION
  nvm alias default $NODE_VERSION
fi
ok "NVM"

npm i -g nodemon hmh-cli clima
ok "NodeJS global modules"

# PostgresSQL
if has_not postgresql; then
	sudo apt-get install postgresql \
		postgresql-contrib \
		libpq-dev
fi
ok "PostgreSQL"

if has_not apache2; then
  sudo apt-get install -y apache2
  
  # Setup vhosts
  curl -sS -O https://gist.githubusercontent.com/claudiosmweb/ab41b5e8693eea7c02b8/raw/392305085efa1347c26498a1a5027037ae9c73be/000-default.conf
  sudo rm /etc/apache2/sites-available/000-default.conf
  sudo mv 000-default.conf /etc/apache2/sites-available
  ok "Setup vhosts"
    
  # Enable rewrite
  sudo a2enmod rewrite
  ok "Enable Apache rewrite"
    
  # Restart Apache2
  sudo service apache2 restart
  ok "Restart Apache"
  
  sudo chown -R $USER:$USER /var/www
  ln -s /var/www ~/code
fi
ok "Apache"

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