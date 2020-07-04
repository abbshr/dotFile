#!/usr/bin/env bash

# pre-required:
# - socks5 proxy configured

export https_proxy="http://127.0.0.1:7890"
export http_proxy="http://127.0.0.1:7890"
export all_proxy="socks5://127.0.0.1:7891"

mkdir -p ~/.ssh
mkdir -p ~/.config

mkdir -p ~/{test,github,gitlab,personal,downloads,config}

cp -a git/* ~/
cp -a .vim ~/
cp -a .vimrc ~/
cp -a fish ~/.config/
cp -a htop ~/.config/
cp -a .bash_profle ~/
cp -a .bashrc ~/
cp -a .gemrc ~/

# install homebrew
curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh | /usr/bin/env bash

if [[ $? != 0 ]]; then
    echo "brew 安装失败"
    exit 1
fi

arr=($(cat brew-list.txt))
brew install ${arr[@]}

# install rvm & ruby
# curl -sSL https://get.rvm.io | bash -s stable --ruby

n lts

gem install pry
npm install -g autocannon node-gyp

source rustup-cfg.sh

if [[ $(uname -s) == 'Darwin' ]]; then
    source init-darwin.sh
else
    source init-linux.sh
fi