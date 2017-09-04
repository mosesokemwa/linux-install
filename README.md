# install linux

> Softwares to install on Linux with just one command

## Usage

Just run:
**Ubuntu (Debian like):**

**prep students**
```console
bash -c "$(wget -O - https://raw.githubusercontent.com/mussaimo/linux-install/master/moringaschool.sh)"
```

**core fullstack students**
```console
bash -c "$(wget -O - https://raw.githubusercontent.com/mussaimo/linux-install/master/fullstack.sh)"
```
## Softwares that will be installed:

- HTop
- OpenSSH Server
- ZSH
- Terminator
- Curl
- VLC
- Git
- Chrome
- Dropbox
- Skype
- NVM
  - Nodemon
- Apache 2
- MySQL
- OH My ZSH
- Heroku Toolbelt
- postgreSQl
- python 3.6
- pip

> Enjoy it ;)

## After Install
### Basic Configuration
**Configure GIT:**

```console
git config --global user.email "your@email"
git config --global user.name "Your name"
```


### Advanced configurations
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

## License
Modified from [fdaciuk](https://github.com/fdaciuk/install-linux)

[MIT](https://raw.githubusercontent.com/mussaimo/licenses/master/MIT-License.md) © Moses Okemwa
