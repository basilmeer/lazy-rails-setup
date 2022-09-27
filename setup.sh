#!/bin/bash

echo "Updating system packages..."
sudo apt update

echo "Upgrading system packages..."
sudo apt upgrade -y

echo "Installing gnupg2..."
sudo apt install gnupg2

echo "Installing curl (in case it doesn't exist)..."
sudo apt install curl

echo "Adding rvm gpg2 key..."
gpg2 --keyserver hkp://keyserver.ubuntu.com --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB

echo "Setting up rvm.sh..."
\curl -sSL https://get.rvm.io -o rvm.sh
cat rvm.sh | bash -s stable --rails
source ~/.rvm/scripts/rvm

echo "Setting up yarn..."
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

echo "Setting up nvm..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

echo "Running sudo apt update..."
sudo apt update

echo "Installing Postgres, RVM and Yarn..."
sudo apt install -y postgresql postgresql-contrib libpq-dev software-properties-common rvm yarn

echo "Reloading bash config..."
source ~/.bashrc
