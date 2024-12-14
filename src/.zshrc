# .zshrc

# PATH config. 
export PATH=$HOME/.local/bin:$HOME/.local/share/nvim/mason/bin/:$PATH

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

# ssh-agent stuff
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# Set the editor.
export EDITOR='nvim'

# Wayland/X11 configs.
if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    export SDL_VIDEODRIVER="wayland"
    export QT_QPA_PLATFORM="wayland;xcb"
    export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
elif [ "$XDG_SESSION_TYPE" = "x11" ]; then
    export SDL_VIDEODRIVER="x11"
    export QT_QPA_PLATFORM="xcb"
    export XCURSOR_THEME="Sunity-cursors-white"
    export XCURSOR_SIZE=24
fi

export QT_QPA_PLATFORMTHEME="qt5ct"
