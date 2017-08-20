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
sudo apt-get install -y \
  ubuntu-restricted-extras \
  htop \
  openssh-server \
  zsh \
  terminator \
  curl \
  vlc browser-plugin-vlc \
  git git-core

ok "System updated!"
ok "HTop"
ok "OpenSSH Server"
ok "ZSH"
ok "Terminator"
ok "Curl"
ok "VLC"
ok "Git"

if has_not pip; then
  sudo apt-get install python-pip python-dev build-essential
  sudo pip install --upgrade pip 
  sudo pip install --upgrade virtualenv
fi
ok "pip"

if has_not atom; then
  sudo add-apt-repository ppa:webupd8team/atom
  sudo apt update
  sudo apt install atom
fi
ok "Atom installed"

if has_not sublime; then
  sudo add-apt-repository ppa:webupd8team/sublime-text-3
  sudo apt-get update
  sudo apt-get install sublime-text-installer
fi
ok "Sublime Text Editor 3 installed"


if has_not chromium-browser; then
 sudo apt-get install chromium-browser
fi
ok "Chrome"

if has nautilus && has_not dropbox; then
  sudo apt-get install nautilus-dropbox -y
fi
ok "Dropbox"

if has_not skype; then
  wget -O skype.deb http://download.skype.com/linux/skype-ubuntu-precise_4.3.0.37-1_i386.deb
  sudo dpkg -i skype.deb --ignore-depends
  sudo apt-get install -fy
  rm -rf skype.deb

  # Gnome Shell extension
  wget -O skype-extension.zip https://github.com/chrisss404/gnome-shell-ext-SkypeNotification/archive/master.zip
  unzip skype-extension.zip -d skype-extension
  cp -r skype-extension/gnome-shell-ext-SkypeNotification-master/SkypeNotification@chrisss404.gmail.com/ \
    ~/.local/share/gnome-shell/extensions
  rm -rf skype-extension*
fi
ok "Skype"

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

# TODO
# installating python
if has_not python3.6; then
  sudo apt-get install python3.6
fi
ok "Python3.6"

if has_not composer; then
  curl -sS https://getcomposer.org/installer | php
  sudo mv composer.phar /usr/local/bin/composer
fi
ok "Composer"

if ! [[ -d "$HOME/.oh-my-zsh" ]]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  chsh -s `which zsh`
fi
ok "OH My ZSH"

if has_not heroku; then
  wget -O- https://toolbelt.heroku.com/install-ubuntu.sh | sh
fi
ok "Heroku Toolbelt"

# change to PostgressSQL
if has_not mongod; then
  sudo bash -c "$(wget -O - https://raw.githubusercontent.com/fdaciuk/install-linux/master/mongo-ubuntu.sh)"
fi
ok "Mongo DB"

# installing wakatime
sudo pip install wakatime
ok "Wakatime CLI (https://github.com/wbinglee/zsh-wakatime)"

# Clean up
sudo apt-get autoclean -y
sudo apt-get autoremove -y

ok "Installation finished!"

# Upgrading system
sudo apt-get -f install
sudo apt-get upgrade
sudo apt-get dist-upgrade

ok "Sytem upgraded"

# Restarting machine
sudo shutdown -r 0