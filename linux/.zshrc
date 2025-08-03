# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
# Export Variables
export ZSH="$HOME/.oh-my-zsh"
export PATH=$PATH:/usr/local/go/bin:$HOME/.dotfiles/sh:$HOME/.local/bin
export EDITOR=nvim
# Theme
ZSH_THEME="crunch"
# Connect Plugin
plugins=(git taskwarrior)

source $ZSH/oh-my-zsh.sh
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8
if [[ -n $SSH_CONNECTION ]]; then
  ZSH_THEME="crunch"
else
  ZSH_THEME="agnoster"
fi

if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
else
   export EDITOR='nvim'
fi

# User configuration
if [[ -e $(which batcat) ]]; then
    export bat="batcat"
    alias bat="batcat"
elif [[ -e $(which bat) ]]; then
    export bat="bat"
fi
if [[ -n $bat ]]; then
    export COLORTERM="truecolor"
    export BAT_THEME="gruvbox-dark"  
    export MANPAGER="sh -c 'col -bx | $bat --language=man --style=plain'"
    export MANROFFOPT="-c"
    alias cat="$bat --style=plain --paging=never"
    alias less="$bat --paging=always"
    if [[ $SHELL == *zsh ]]; then
        alias -g -- --help='--help 2>&1 | $bat --language=help --style=plain'
    fi
    help() { "$@" --help 2>&1 | $bat --language=help --style=plain; }
    tailf() { tail -f "$@" | $bat --paging=never --language=log; }
    batdiff() { git diff --name-only --relative --diff-filter=d | xargs $bat --diff; }
fi
# Redefining the ls package to exa
if [[ -e $(which exa) ]]; then
    if [[ -n "$DISPLAY" || $(tty) == /dev/pts* ]]; then
        alias ls="exa --group --header --icons"
    else
        alias ls="exa --group --header"
    fi
    alias ll="ls --long"
    alias l="ls --long --all --header"
    alias lm="ls --long --all --sort=modified"
    alias lmm="ls -lbHigUmuSa --sort=modified --time-style=long-iso"
    alias lt="ls --tree"
    alias lr="ls --recurse"
    alias lg="ls --long --git --sort=modified"
fi
# Lib alias
if [ -f ~/.dotfiles/alias/zsh_aliases ]; then
  . ~/.dotfiles/alias/zsh_aliases
fi
