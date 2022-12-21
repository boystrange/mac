#!/bin/sh

brew install coreutils           # command line utilities
brew install multimarkdown
brew install node
brew install wget
brew install graphviz
brew install ghc
brew install cabal-install
brew install haskell-stack
brew install agda
brew install csvkit		 # CSV management tools for citations
brew install poppler	         # conversion PDF => PNG (thumbnails)
brew install iterm2
brew install mactex
brew install skim
brew install google-chrome
brew install viscosity           # VPN
brew install webex-meetings
brew install google-drive
brew install java
brew install visual-studio-code
brew install stats

brew unlink emacs                # to avoid conflicts with agda dependency
brew tap railwaycat/emacsmacport
brew install --cask emacs-mac    # use --cask to avoid compilation from sources
