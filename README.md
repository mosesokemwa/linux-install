# install linux

> Softwares to install on Linux with just one command

## Usage

Just run:

**Ubuntu (Debian like):**

```console
bash -c "$(wget -O - https://raw.githubusercontent.com/fdaciuk/install-linux/master/install.sh)"
```

## Softwares that will be installed:

- XSel
- SMB Client
- HTop
- OpenSSH Server
- S3 CMD
- ZSH
- Terminator
- Curl
- Vim (Gnome)
- KeePassX
- VLC
- Git
- PlayOnLinux
- Chrome
- Docker
- Dropbox
- Diffmerge
- Skype
- Strem.io
- Simple Screen Recorder
- NVM
  - Nodemon
- Apache 2
- MySQL
- PHP
- PHPMyAdmin
- WP-CLI
- Composer
- Redis Server
- OH My ZSH
- Heroku Toolbelt
- MongoDB

> Enjoy it ;)

## Other softwares to install
- [Lightworks](https://www.lwks.com/) (video editor): http://downloads.lwks.com/lwks-12.6.0-amd64.deb
- [Avocode](https://avocode.com/)
- [SQLEctron](https://sqlectron.github.io/)
- [RoboMongo](https://robomongo.org/) (Mongo GUI)

## After Install

**Configure GIT:**

```console
git config --global user.email "your@email"
git config --global user.name "Your name"
```

**Generate SSH Keys (or copy, if you already have one):**

```sh
ssh-keygen -t rsa -b 4096 -C "your@email"

# Try
ssh -T git@github.com
ssh -T git@bitbucket.com
```


**Generate GPG Keys:**

- Follow this steps: https://help.github.com/articles/generating-a-new-gpg-key/
- Telling Git about your GPG Keys: https://help.github.com/articles/telling-git-about-your-gpg-key/

Then, just commit using ``` `git commit -S` ```


**configure postgreSQL**
By default Postgres creates a postgres user and is the only user who can connect to the server. We’ll want to create ourselves on the server with superuser capabilities with the same name as our login name:

```sh
sudo -u postgres createuser --superuser $USER
```

Enter your desired password when prompted.

Next, we’ll have to create a database with the same name as our login name since this is what Postgres expects by default when connecting to the server with your login name:

```sh
sudo -u postgres createdb $USER
```

Navigate to your home directory and enter the following command to create the .psql_history in order to save your history:

```sh
touch .psql_history
```

Type psql on your terminal to connect to the server:
```sh
psql
```

Enter ```\q``` to quit and you should now be back in the postgres Linux command prompt.

## Install Top Icons (Gnome Shell)

https://github.com/phocean/TopIcons-plus

## Install fonts

**Consolas:**

fonte: http://ssup2.iptime.org/wiki/Ubuntu_Consolas_Font_Install

**Source Code PRO:**

```console
bash -c "$(wget -O - https://gist.githubusercontent.com/fdaciuk/8b3269a3d797ee723672/raw/c8344f9cd4f91a8ae69535c833253ae87ef86d5b/sourcecodepro.sh)"
```
## License
Modified from [fdaciuk](https://github.com/fdaciuk/install-linux)

[MIT](https://raw.githubusercontent.com/mussaimo/licenses/master/MIT-License.md) © Moses Okemwa