#!/bin/bash


##
## Bash install script for students learning how to codeusing Ubuntu 16.04
## 
## - AUTHOR:  Moses <mussaimo> Okemwa, Newton <newtonkiragu> Karanu
## - VERSION: 1.0
##

set -eox pipefail

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
  curl \
  vlc browser-plugin-vlc \
  git git-core \
  xclip\
  software-properties-common\
  wget


ok "System updated!"
ok "HTop"
ok "OpenSSH Server"
ok "ZSH"
ok "Curl"
ok "VLC"
ok "Git"
ok "xclip"

if has_not atom; then
  sudo add-apt-repository ppa:webupd8team/atom
  sudo apt update
  sudo apt install atom --ignore-depends
fi
ok "Atom installed"

if has_not code; then
  curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
  sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
  sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
  sudo apt-get -y install apt-transport-https
  sudo apt-get update
  sudo apt-get -y install code
fi
ok "VS Code"

if has_not slack; then
  cd
  slack='https://downloads.slack-edge.com/linux_releases/slack-desktop-3.3.7-amd64.deb'
  wget $slack
  sudo dpkg -i ${slack##*/}
  sudo apt-get -y install -f
  rm -rf ${slack##*/}
fi

if has_not sublime; then
  sudo add-apt-repository ppa:webupd8team/sublime-text-3
  sudo apt-get update
  sudo apt-get install sublime-text-installer
fi
ok "Sublime Text Editor 3 installed"


if has_not chromium-browser; then
 sudo apt-get install chromium-browser
fi
ok "Chromium"

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

if ! [[ -d "$HOME/.oh-my-zsh" ]]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  chsh -s `which zsh`
fi
ok "OH My ZSH"

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

ok "System upgraded"

# Restarting machine
sudo shutdown -r 0
