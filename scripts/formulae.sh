#!/bin/sh

brew install multimarkdown
brew install node
brew install wget
brew install watchexec
brew install graphviz
brew install ghc
brew install cabal-install
brew install haskell-stack
brew install agda
brew install csvkit		 # CSV management tools for citations
brew install poppler	         # conversion PDF => PNG (thumbnails)
brew install java
brew install smartmontools

brew install --cask iterm2
brew install --cask mactex
brew install --cask skim
brew install --cask webex-meetings
brew install --cask firefox
brew install --cask google-chrome
brew install --cask google-drive
brew install --cask visual-studio-code
brew install --cask stats

brew unlink emacs                # to avoid conflicts with agda dependency
brew tap railwaycat/emacsmacport
brew install --cask emacs-mac    # use --cask to avoid compilation from sources

brew tap homebrew/cask-fonts
brew install --cask font-dejavu
brew install --cask font-fira-code
