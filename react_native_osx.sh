#! /bin/bash

brew install node
brew install watchman
brew install --cask adoptopenjdk/openjdk/adoptopenjdk8

npm install -g yarn
npm install -g react-native-cli

echo "Install Android Studio, open a project, and run `sdkmanager --licenses`"
