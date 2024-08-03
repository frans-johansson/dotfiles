#
# A minimal and robust .bashrc
#

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

HISTCONTROL=ignoreboth   # Handle duplicate entries
HISTSIZE= HISTFILESIZE=  # Very very big history files
shopt -s histappend      # Only append, never overwrite, the history file
			 # (this preserves the history across terminals)

# Check for window size updates
shopt -s checkwinsize

# Set up the prompt
source /usr/share/git-core/contrib/completion/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1

PROMPT_COMMAND=__prompt_command

__prompt_command() {
    local EXIT="$?"
    PS1="\$ "

    local RES='\[\e[0m\]'
    local RED='\[\e[91m\]'
    local GRE='\[\e[94m\]'

    if [ $EXIT != 0 ]; then
        PS1+="${RED}(💥) [$EXIT]${RES}"
    else
	PS1+="${GRE}(🦝)${RES}"
    fi

    PS1+=" \[\e[96m\]\W\[\e[0m\]$(__git_ps1 ' [\[\e[95m\] %s\[\e[0m\]]') "

    # Python virtual environment
    if [[ -n "$VIRTUAL_ENV" ]]; then
        # Strip out the path and just leave the env name
        VENV="${VIRTUAL_ENV##*/}"
	PS1+="[🐍 ${GRE}$VENV${RES}] "	
    fi

    PS1+=" "
}

# Make sure any Cargo binaries are visible from this point
source "$HOME/.cargo/env"

# If we have access to bat, use it as the manpager
if command -v bat &> /dev/null; then
    export MANPAGER="sh -c 'col -bx | bat -l man -p'"  
fi

# Source environment variables
if [[ -f ~/.config/bash_env ]]; then
    source ~/.config/bash_env
fi

# Source aliases
if [[ -f ~/.config/bash_aliases ]]; then
    source ~/.config/bash_aliases
fi

# Set up fzf
if [[ -f /usr/share/fzf/shell/key-bindings.bash ]]; then
    source /usr/share/fzf/shell/key-bindings.bash
fi
 
# Set up additional third-party functionality
if command -v zoxide &> /dev/null; then
    eval "$(zoxide init bash)"
fi

if command -v direnv &> /dev/null; then
    eval "$(direnv hook bash)"
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
. "$HOME/.cargo/env"
