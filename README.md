# My dotfiles

## Overview

This setup is primarily configured for macOS and Linux systems. It includes configurations for the following tools:


1. **Shell**
    * Bash
    * Zsh (main shell) with Oh My Zsh & Powerlevel10k theme
1. **Terminal**
    * iTerm2 (macOS)
    * WezTerm (macOS + Linux)
1. **SSH:**
    * home lab virtual machines aliases (`.ssh/config` file)
1. **Editors**
    * micro
1. **Multiplexer:** 
    * *todo*
1. **Git:**
    * aliases
    * global user settings
    * global default settings
1. **Other Tools:**
    * *todo*

## Installation

1. Checkout this repository to your `$HOME` directory
	* Clone as bare repository: `git clone --bare <git-repo-url> $HOME/.dotfiles`
	* Setup alias in `.zshrc` file: `alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'`
	* Checkout files `dotfiles checkout`
	* Hide untracked files `dotfiles config --local status.showUntrackedFiles no`
1. Install required packages with `make install`

### Troubleshooting

#### Files already exists in home directory

In case of error `error: The following untracked working tree files would be overwritten by checkout` during checkout, 
make a backup of these files first:

```sh
$ mkdir -p .dotfiles-backup && \
    dotfiles checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
    xargs -I{} mv {} .dotfiles-backup/{}
```

## Repository structure

*TODO*
