PACKAGES := micro wezterm
UNAME_S := $(shell uname -s)

ifeq ($(UNAME_S),Darwin)
    INSTALL_CMD := brew install
else ifeq ($(UNAME_S),Linux)
    INSTALL_CMD := sudo pacman  --sync --refresh --needed --noconfirm
endif

.PHONY: help
help:
	@echo "Available targets:"
	@echo "  install  - Install packages ($(PACKAGES))"
	@echo "  help     - Show this help message"

.PHONY: install
install:
	@$(INSTALL_CMD) $(PACKAGES)

