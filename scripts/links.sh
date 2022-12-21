#!/bin/sh

for i in ~/GIT/mac/dotfiles/.[a-z]*; do
  echo "Linking $i..."
  ln -s -f $i ~/.
done
