#DRY = true

NULL =

ifdef DRY
BREW_DRY = -n
else
BREW_DRY =
endif

PROMPT = "==>"

FORMULAE = \
  wget \
  watchexec \
  graphviz \
  agda \
  csvkit \
  java \
  mas \
  $(NULL)

CASKS = \
  iterm2 \
  emacs-mac \
  mactex \
  firefox \
  visual-studio-code \
  stats \
  font-iosevka \
  skim \
  onedrive \
  $(NULL)

DOTFILES = \
  bash_logout \
  emacs \
  gitconfig \
  inputrc \
  profile \
  vimrc \
  zshrc \
  agda \
  gitignore_global \
  siril \
  $(NULL)

# Amphetamine
# Wipr
# Slack for Desktop

APPS = \
  937984704 \
  1320666476 \
  803453959  \
  $(NULL)

DEFAULTS = \
  iterm \
  skim \
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
  defaults \
  $(NULL)

all: $(TARGETS:%=done/%)

done/ssh:
	@echo $(PROMPT) "Setting up SSH..."
ifndef DRY
	@rm -rf ~/.ssh
	@cp -r ~/Library/Mobile\ Documents/com~apple~CloudDocs/ssh ~/.ssh
	@chmod 400 ~/.ssh/id_rsa*
	@chmod 400 ~/.ssh/id_dsa*
	@chmod 400 ~/.ssh/id_ed*
	@chmod 600 ~/.ssh/config ~/.ssh/known_hosts
	@ssh-add ~/.ssh/id_rsa
	@ssh-add --apple-use-keychain
endif
	@touch $@

done/links: $(DOTFILES:%=done/link.%)
	@touch $@

done/shell:
	@echo $(PROMPT) "Setting default shell to bash"
ifndef DRY
	@chsh -s /bin/bash
endif
	@touch $@

done/formulae: $(FORMULAE:%=done/formula.%)
	@touch $@

done/unlink-emacs:
	@echo $(PROMPT) "Unlinking emacs (Agda dependency) to avoid conflicts with emacs-mac"
	@brew unlink $(BREW_DRY) emacs
	@touch $@

done/taps:
	@echo $(PROMPT) "Adding taps..."
ifndef DRY
	@brew tap railwaycat/emacsmacport
endif
	@touch $@

done/casks: $(CASKS:%=done/cask.%)
	@touch $@

done/apps: $(APPS:%=done/app.%)
	@touch $@

done/defaults: $(DEFAULTS:%=done/defaults.%)
	@touch $@

done/link.%:
	@echo $(PROMPT) "Linking" $(@:done/link.%=%) "..."
ifndef DRY
	@ln -s -f ~/GIT/mac/dotfiles/.$(@:done/link.%=%) ~/.
endif
	@touch $@

done/formula.%:
	@echo $(PROMPT) "Installing formula" $(@:done/formula.%=%) "..."
	@brew install $(BREW_DRY) $(@:done/formula.%=%)
	@touch $@

done/cask.%:
	@echo $(PROMPT) "Installing cask" $(@:done/cask.%=%) "..."
	@brew install $(BREW_DRY) --cask $(@:done/cask.%=%)
	@touch $@

done/app.%:
	@echo $(PROMPT) "Installing app" `mas info $(@:done/app.%=%) | head -1` "..."
ifndef DRY
	@mas install $(@:done/app.%=%)
endif
	@touch $@

done/defaults.iterm:
	@defaults write com.googlecode.iterm2 PrefsCustomFolder ~/GIT/mac/
	@touch $@

done/defaults.skim:
	@defaults write net.sourceforge.skim-app.skim SKAutoCheckFileUpdate -bool true
	@defaults write net.sourceforge.skim-app.skim SKAutoReloadFileUpdate -bool true
	@touch $@

.PHONY: all
