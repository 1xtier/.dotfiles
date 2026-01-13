# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
# Configure PATH
export PATH=$PATH:/opt/homebrew/bin:/Users/h0lik/.local/bin:$HOME/.dotfiles/sh:$HOME/go/bin:/opt/homebrew/opt/ruby/bin
export PKG_CONFIG_PATH="/opt/homebrew/opt/ruby/lib/pkgconfig"
export LDFLAGS="-L/opt/homebrew/opt/ruby/lib"
export CPPFLAGS="-I/opt/homebrew/opt/ruby/include"
# Editor 
export EDITOR="/usr/bin/nvim"
export ANSIBLE_CONFIG="/Users/h0lik/ansible/ansible.cfg"
# Configurate remote docker host
export DOCKER_HOST=tcp://192.168.19.244:2376
export DOCKER_CERT_PATH="$HOME/.docker/cert-for-docker"
export DOCKER_TLS_VERIFY=1
# Export variables nackernvim
export NACKER_ANSIBLE_PATH=$HOME/ansible
export NACKER_TERRAFROM_PATH=$HOME/terraform
export NACKER_DOTFILES_PATH=$HOME/.dotfiles
export NACKER_PROJECT_PATH=$HOME/dev

eval "$(rbenv init -)"
# 
ZSH_THEME="nacker"
plugins=(git ansible docker vscode zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh
# Configure bat Replacement cat tail less > bat
# Configire custom aliases
alias kp="/Applications/KeePassXC.app/Contents/MacOS/keepassxc-cli"
if [ -f ~/.dotfiles/macos/zsh_aliases ]; then
  . ~/.dotfiles/macos/zsh_aliases
fi
if [ -f ~/.dotfiles/macos/rc_lib ]; then 
  . ~/.dotfiles/macos/rc_lib
fi



test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
PRELINE="\r\033[A"

function color { 
    echo -e "\033]6;1;bg;red;brightness;$((1 + $RANDOM % 255))\a"$PRELINE
    echo -e "\033]6;1;bg;green;brightness;$((1 + $RANDOM % 255))\a"$PRELINE
    echo -e "\033]6;1;bg;blue;brightness;$((1 + $RANDOM % 255))\a"$PRELINE  
}

color

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /Users/h0lik/.local/bin/terraform terraform
