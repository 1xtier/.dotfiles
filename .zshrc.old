# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export PATH="$PATH:$HOME/.bin"
export ANSIBLE_CONFIG="$HOME/ansible/ansible.cfg"
export PATH="/usr/local/bin:$PATH"
export EDITOR="nvim"
export PATH=~/.local/bin:$PATH
source ~/.profile
export SRVADMIN_ENV="$HOME/.config/srvadmin-config.ini"
ZSH_THEME="dpoggi"
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"
# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

plugins=(git tmux tmuxinator sudo history)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
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

myalias() {
  local RED=$(tput setaf 1)
  local GREEN=$(tput setaf 2)
  local normal=$(tput sgr0)
  echo "My custom aliases:"
  printf "%-20s %s\n" "Alias" "Command"
  echo "------------------------------"
  for key in $(cat ~/.dotfiles/alias/zsh_aliases | awk '{print $2}' | awk -F"=" '{print $1}'); do
    command=$(cat ~/.dotfiles/alias/zsh_aliases | grep "${key}" | awk -F"=" '{print $2}')
    printf "%-20s %s\n" "${RED}$key${normal}" "${GREEN}$command${normal}"
done | sort
return 0
}
compdef myalias
sshc() {
  local RED=$(tput setaf 1)
  local GREEN=$(tput setaf 2)
  local normal=$(tput sgr0)
  echo "My custom aliases SSH-config:"
  printf "%-18s %s\n" "Name" "Hostname"
  echo "------------------------------"
  # cat ~/.ssh/config.d/$1.conf | while read line || [[ -n $line ]];
  # do
  for file in ~/.ssh/config.d/$1.conf; do
    host=$(grep -w 'Host' $file | awk '{print $2}')
    command=$(grep -w 'HostName' $file | awk '{print $2}')
    printf "%-25s %s\n" "${RED}$host${normal}" "${GREEN}$command${normal}"
done 
return 0
}
compdef myalias
# Load files alias 
if [ -f ~/.dotfiles/alias/zsh_aliases ]; then
  . ~/.dotfiles/alias/zsh_aliases
fi
