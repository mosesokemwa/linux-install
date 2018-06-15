#!/bin/bash
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

-- Tools
homebrew
curl
wget
sublime
postgres
mysql
wakatime
Vlc
redis-server
vagrant

-- Custom files
bash aliases
zshrc
vimrc
gitignore
vagrant custom files

-- Editors
Vim
zshrc
brackets
git

-- Python
pip
django
flask

- Android
java
-- JavaScript
node
npm
google chrome stable
nvm



