#!/bin/bash

if which brew >/dev/null; then
 echo "$(tput bold)Homebrew installed. Skipping installation...$(tput sgr0)"
else
 echo "$(tput setaf 4)Installing Homebrew..$(tput sgr0)"
 /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "$(tput setaf 4)Installing Homebrew dependencies..$(tput sgr0)"
brew bundle

echo "$(tput setaf 4)Installing Gem dependencies...$(tput sgr0)"
sudo gem install bundler 

echo "$(tput setaf 4)Resolving Ruby dependencies...$(tput sgr0)"
bundle

echo "$(tput setaf 4)Resolving Carthage dependencies...$(tput sgr0)"
bundle exec fastlane carthage_bootstrap

echo "$(tput setaf 4)Installing GraphQL Cli...$(tput sgr0)"
npm install -g apollo

echo "$(tput setaf 4)Setup fastlane...$(tput sgr0)"
bundle exec fastlane setup
