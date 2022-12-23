
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

TARGETS = \
  ssh \
  links \
  shell \
  formulae \
  unlink-emacs \
  taps \
  casks \
  apps \
  $(NULL)

all: $(TARGETS:%=%.done)

ssh.done:
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
	@touch $@

links.done: $(DOTFILES:%=link.%.done)
	@touch $@

shell.done:
	@echo $(PROMPT) "Setting default shell to bash"
ifndef DRY
	@chsh -s /bin/bash
endif
	@touch $@

formulae.done: $(FORMULAE:%=formula.%.done)
	@touch $@

unlink-emacs.done:
	@echo $(PROMPT) "Unlinking emacs (Agda dependency) to avoid conflicts with emacs-mac"
	@brew unlink $(BREW_DRY) emacs
	@touch $@

taps.done:
	@echo $(PROMPT) "Adding taps..."
ifndef DRY
	@brew tap railwaycat/emacsmacport
	@brew tap homebrew/cask-fonts
endif
	@touch $@

casks.done: $(CASKS:%=cask.%.done)
	@touch $@

apps.done: $(APPS:%=app.%.done)
	@touch $@

link.%.done:
	@echo $(PROMPT) "Linking" $(@:link.%.done=%) "..."
ifndef DRY
	@ln -s -f ~/GIT/mac/dotfiles/.$(@:link.%=%) ~/.
endif
	@touch $@

formula.%.done:
	@echo $(PROMPT) "Installing formula" $(@:formula.%.done=%) "..."
	@brew install $(BREW_DRY) $(@:formula.%.done=%)
	@touch $@

cask.%.done:
	@echo $(PROMPT) "Installing cask" $(@:cask.%.done=%) "..."
	@brew install $(BREW_DRY) --cask $(@:cask.%.done=%)
	@touch $@

app.%.done:
	@echo $(PROMPT) "Installing app" `mas info $(@:app.%.done=%) | head -1` "..."
ifndef DRY
	@mas install $(@:app.%.done=%)
endif
	@touch $@

.PHONY: all clean
clean:
	rm -f $(TARGETS:%=%.done)
