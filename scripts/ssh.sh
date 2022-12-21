#!/bin/sh

rm -rf ~/.ssh
cp -r /Users/luca/Library/Mobile\ Documents/com~apple~CloudDocs/Chiavi ~/.ssh
chmod 400 ~/.ssh/id_rsa*
chmod 400 ~/.ssh/id_dsa*
chmod 400 ~/.ssh/id_ed*
chmod 600 ~/.ssh/config ~/.ssh/known_hosts
ssh-add ~/.ssh/id_rsa
ssh-add --apple-use-keychain
