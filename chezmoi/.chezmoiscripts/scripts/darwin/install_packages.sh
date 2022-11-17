#!/bin/bash

. "{{ .chezmoi.sourceDir }}/../scripts/utils.sh"

print_info "\nUpdating brew\n"
brew update

print_info "\nBrew bundle\n"
brew bundle --file={{ .chezmoi.sourceDir }}/../brew/Brewfile

print_info "\nUpgrading last brew packages\n"
brew upgrade

print_info "\nInstall pip packages\n"
pip3 install urlscan
pip3 install beautysh
pip3 install websocket-client
pip3 install pync
pip3 install kaskade

print_info "\nInstall gem packages\n"
sudo gem install activesupport -v 6.1.6.1
sudo gem install terjira
sudo gem install cocoapods

print_info "\nInstall npm packages\n"
npm i -g npm-install-latest

npm-install-latest -g movie-cli
npm-install-latest -g npm-check-updates

print_info "\nInstall perl packages\n"
cpan install Pod::Parser

print_info "\nInstall misc packages\n"
curl -fsSL https://git.io/resto | bash

print_success "Done!\n"
