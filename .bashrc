# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

# My script 

lori() {
    local lori_name="${1}"
    declare -A lori_list
    lori_list=(
    	[dist_list]="df -h"
    )

    if [[ -z ${lori_list[$lori_name]} || -z "$lori_name" || "$lori_name" == "-h" ]]; then
        echo "COMMANDS:"
        printf "%-20s %s\n" "keys" "command"
        echo "============================="
        for key in "${!lori_list[@]}"; do
	       printf "%-20s %s\n" "$key" "${lori_list[$key]}"	
        done | sort
        return 0
    else
        if [[ -n "$BASH" && -t 0 ]]; then

            local command_to_insert="${lori_list[$lori_name]}"
            bind '"\e[0n": "'"${command_to_insert}"'"'
            printf '\e[5n'
        else 
            echo "${lori_list[$lori_name]}"
        fi 
        return 0 
    fi
}

_lori_completion() {
    local curl prev opts
    COMPREPLY=()
    curl="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    opts=$(lori -h | awk 'NR>4 {print $1}')
    if [[ ${curl} == * ]]; then
        COMPREPLY=($(compgen -W "${opts}" -- ${curl}))
        return 0
    fi
}

complete -F _lori_completion lori
# load bash alias
if [ -f ~/.dotfiles/bash_aliases ]; then
. ~/.dotfiles/.bash_aliases
fi
