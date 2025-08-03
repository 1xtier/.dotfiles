# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export PATH=/opt/homebrew/bin:$PATH
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
export PATH=$HOME/.local/bin:$PATH
export EDITOR="/usr/bin/vim"
export ANSIBLE_CONFIG="$HOME/ansible/ansible.cfg"
export DOCKER_HOST=tcp://192.168.19.244:2376
export DOCKER_CERT_PATH="$HOME/.docker/cert-for-docker"
export DOCKER_TLS_VERIFY=1


ZSH_THEME="crunch"
plugins=(git docker vscode zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh
if [[ -e $(which batcat) ]]; then
    export bat="batcat"
    alias bat="batcat"
elif [[ -e $(which bat) ]]; then
    export bat="bat"
fi
if [[ -n $bat ]]; then
    export COLORTERM="truecolor"
    export BAT_THEME="Monokai Extended Origin"
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


lori() {
  local lori_name="${1}"
  typeset -A lori_list


  lori_list=(
    disk_size "df -h"
    )

  if [[ -z ${lori_list[$lori_name]} || -z "$lori_name" || "$lori_name" == "-h" ]]; then
    echo "AVAILABLE COMMANDS:\n"
    printf "%-20s %s\n" "command"
    echo "----------------------"
    for key in "${(@k)lori_list}"; do 
      printf "%-20s %s\n" "$key" "${lori_list[$key]}"
    done | sort
    return 0
  else
    print -zr "${lori_list[$lori_name]}"
    return 0
  fi 
}
_lori_completion() {
  local -a keys 
  keys=($(lori -h | awk 'NR>4 {print $1}'))
  compadd "$@" -- "${keys[@]}"
}
compdef _lori_completion lori

alias ..="cd .."
alias vm-manager="ssh -X root@10.10.0.254 virt-manager"
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
PRELINE="\r\033[A"

function color { 
    echo -e "\033]6;1;bg;red;brightness;$((1 + $RANDOM % 255))\a"$PRELINE
    echo -e "\033]6;1;bg;green;brightness;$((1 + $RANDOM % 255))\a"$PRELINE
    echo -e "\033]6;1;bg;blue;brightness;$((1 + $RANDOM % 255))\a"$PRELINE  
}

color
