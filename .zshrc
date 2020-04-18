
# Created by newuser for 5.7.1
source /usr/share/zsh/scripts/zplug/init.zsh

# ADD paths
export PATH="/home/felipemarcelino/.gem/ruby/2.7.0/bin:$PATH#"

###################
#-----GENERAL-----#
###################

# Delay Key Pressing
KEYTIMEOUT=15



#export FZF_DEFAULT_COMMAND="fd . $HOME"
#export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
#export FZF_ALT_C_COMMAND="fd -t d . $HOME"


# Fix alacritty LSCOLORS(dircolors)
#eval TERM=xterm-256color

# Fix glyph in codna env
SPACESHIP_CONDA_SYMBOL='🐍 '

# Remove show mode vim
SPACESHIP_VI_MODE_SHOW=false

###################
#-----PLUGINS-----#
###################

zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, from:github, as:theme 
zplug "plugins/git",   from:oh-my-zsh

zplug "plugins/fasd",   from:oh-my-zsh,  as:plugin

#zplug "plugins/tldr",   from:oh-my-zsh,  as:plugin

zplug "plugins/vi-mode",   from:oh-my-zsh, as:plugin

zplug "lib/*", from:oh-my-zsh

#zplug "plugins/sudo",   from:oh-my-zsh, as:plugin

#zplug "plugins/web-search",   from:oh-my-zsh, as:plugin

zplug "hlissner/zsh-autopair", defer:2

zplug "zsh-users/zsh-autosuggestions"

zplug "zsh-users/zsh-history-substring-search"

zplug "djui/alias-tips"


# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
# zplug load --verbose
zplug load 

################ -----FASD-----#
################

alias v='f -e nvim' # quick opening files with vim
alias m='f -e vlc' # quick opening files with mplayer
alias o='a -e xdg-open' # quick opening files with xdg-open


###############################
#-----ZSH-AUTOSUGGESTIONS-----#
###############################
bindkey '^ ' autosuggest-accept

########################################
#-----ZSH-HISTORY-SUBSTRING-SEARCH-----#
########################################
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

#unset GREP_OPTIONS
test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || \
    eval "$(dircolors -b)" 

###############
#-----FZF-----#
###############
# Source fzf keybinds and completions
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh


# !! Contents within this block are managed by 'conda init' !!
#__conda_setup="$('/home/felipemarcelino/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
#if [ $? -eq 0 ]; then
#$    eval "$__conda_setup"
#else
#    if [ -f "/home/felipemarcelino/miniconda3/etc/profile.d/conda.sh" ]; then
#        . "/home/felipemarcelino/miniconda3/etc/profile.d/conda.sh"
#    else
#        export PATH="/home/felipemarcelino/miniconda3/bin:$PATH"
 #   fi
#fi
#unset __conda_setup
# <<< conda initialize <<<
[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh
conda activate ai-all
conda config --set changeps1 false
unset SUDO_UID SUDO_GID SUDO_USER

# Change cursor shape for different vi modes
# Change cursor shape for different vi modes.
function zle-keymap-select {
    if [[ ${KEYMAP} == vicmd ]] ||
        [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'

    elif [[ ${KEYMAP} == main ]] ||
        [[ ${KEYMAP} == viins ]] ||
        [[ ${KEYMAP} = '' ]] ||
        [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
    fi
}
zle -N zle-keymap-select

# Use beam shape cursor on startup.
echo -ne '\e[5 q'

# Use beam shape cursor for each new prompt.
preexec() {
    echo -ne '\e[5 q'
}

_fix_cursor() {
   echo -ne '\e[5 q'
}

precmd_functions+=(_fix_cursor)
export EDITOR=nvim

function ranger {
    local IFS=$'\t\n'
    local tempfile="$(mktemp -t tmp.XXXXXX)"
    local ranger_cmd=(
        command
        ranger
        --cmd="map Q chain shell echo %d > "$tempfile"; quitall"
    )
    
    ${ranger_cmd[@]} "$@"
    if [[ -f "$tempfile" ]] && [[ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]]; then
        cd -- "$(cat "$tempfile")" || return
    fi
    command rm -f -- "$tempfile" 2>/dev/null
}

# Colorls
source /home/felipemarcelino/.gem/ruby/2.7.0/gems/colorls-1.3.3/lib/tab_complete.sh
alias lc='colorls -lA --sd'

alias mirrorUpdate='sudo reflector --latest 250 --protocol https --sort rate --save /etc/pacman.d/mirrorlist'

# Export activated conda env to yml
alias expenv='conda env export | grep -v "^prefix: " > environment.yml'

# Nvim socket
export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket

