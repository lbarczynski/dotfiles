PACKAGES := micro wezterm
UNAME_S := $(shell uname -s)

ifeq ($(UNAME_S),Darwin)
    INSTALL_CMD := brew install
else ifeq ($(UNAME_S),Linux)
    INSTALL_CMD := sudo pacman  --sync --refresh --needed --noconfirm
endif

# Dotfiles config:
# https://wiki.archlinux.org/title/Dotfiles
# https://askubuntu.com/a/1316230
# https://www.atlassian.com/git/tutorials/dotfiles
# List tracked files  dotfiles ls-tree -r HEAD --name-only

.PHONY: help
help:
	@echo "Available targets:"
	@echo "  install  - Install packages ($(PACKAGES))"
	@echo "  help     - Show this help message"

.PHONY: install
install:
	@$(INSTALL_CMD) $(PACKAGES)

