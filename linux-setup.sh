#!/bin/bash

#ubuntu
apt update
apt upgrade -y
apt-get install -y build-essential curl file git #build-essential= group of packages

echo 'completed ubuntu section'

#linuxbrew
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile

echo 'completed brew section'


#brew manage packages
brew install gcc azure-cli git node

echo 'completed tooling section'