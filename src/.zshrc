# .zshrc

# PATH config. 
export PATH=$HOME/.local/bin:$HOME/.local/share/nvim/mason/bin/:/usr/local/bin:$PATH

# Path to oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# oh-my-zsh theme config.
ZSH_THEME="robbyrussell"

# Set case case sensitive completion to false.
CASE_SENSITIVE="false"

# Set date format.
HIST_STAMPS="dd.mm.yyyy"

# Plugins config.
plugins=(git)

# Load oh-my-zsh.
source $ZSH/oh-my-zsh.sh

# Set the editor.
export EDITOR='nvim'

# Wayland configs.
export SDL_VIDEODRIVER=wayland
export QT_QPA_PLATFORM="wayland;xcb"
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
export QT_QPA_PLATFORMTHEME=qt5ct
