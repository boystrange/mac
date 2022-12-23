
NULL =

DRY = true

ifdef DRY
BREW_DRY = -n
else
BREW_DRY =
endif

PROMPT = "==>"

FORMULAE = \
  multimarkdown \
  node \
  wget \
  watchexec \
  graphviz \
  ghc \
  cabal-install \
  haskell-stack \
  agda \
  csvkit \
  poppler \
  java \
  smartmontools \
  mas \
  $(NULL)

CASKS = \
  iterm2 \
  emacs-mac \
  mactex \
  skim \
  webex-meetings \
  firefox \
  google-chrome \
  google-drive \
  visual-studio-code \
  stats \
  font-dejavu \
  font-fira-code \
  $(NULL)

DOTFILES = \
  bash_logout \
  emacs \
  gitconfig \
  inputrc \
  profile \
  vimrc \
  zshrc \
  $(NULL)

# Telegram
# Whatsapp Desktop
# Wipr
# Notability
# Slack for Desktop

APPS = \
  747648890  \
  1147396723 \
  1320666476 \
  360593530  \
  803453959  \
  $(NULL)

all: ssh links shell formulae unlink-emacs taps casks app-store

ssh:
	@echo $(PROMPT) "Setting up SSH..."
ifndef DRY
	@rm -rf ~/.ssh
	@cp -r /Users/luca/Library/Mobile\ Documents/com~apple~CloudDocs/Chiavi ~/.ssh
	@chmod 400 ~/.ssh/id_rsa*
	@chmod 400 ~/.ssh/id_dsa*
	@chmod 400 ~/.ssh/id_ed*
	@chmod 600 ~/.ssh/config ~/.ssh/known_hosts
	@ssh-add ~/.ssh/id_rsa
	@ssh-add --apple-use-keychain
endif

links: $(DOTFILES:%=link.%)

shell:
	@echo $(PROMPT) "Setting default shell to bash"
ifndef DRY
	@chsh -s /bin/bash
endif

formulae: $(FORMULAE:%=formula.%)

unlink-emacs:
	@echo $(PROMPT) "Unlinking emacs (Agda dependency) to avoid conflicts with emacs-mac"
	@brew unlink $(BREW_DRY) emacs

taps:
	@echo $(PROMPT) "Adding taps..."
ifndef DRY
	@brew tap railwaycat/emacsmacport
	@brew tap homebrew/cask-fonts
endif

casks: $(CASKS:%=cask.%)

app-store: $(APPS:%=app.%)

link.%:
	@echo $(PROMPT) "Linking" $(@:link.%=%) "..."
ifndef DRY
	@ln -s -f ~/GIT/mac/dotfiles/.$(@:link.%=%) ~/.
endif

formula.%:
	@echo $(PROMPT) "Installing formula" $(@:formula.%=%) "..."
	@brew install $(BREW_DRY) $(@:formula.%=%)

cask.%:
	@echo $(PROMPT) "Installing cask" $(@:cask.%=%) "..."
	@brew install $(BREW_DRY) --cask $(@:cask.%=%)

app.%:
	@echo $(PROMPT) "Installing app" `mas info $(@:app.%=%) | head -1` "..."
ifndef DRY
	@mas install $(@:app.%=%)
endif

