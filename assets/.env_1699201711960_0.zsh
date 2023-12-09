# .env.zsh
#
# Source additional local files if they exist.
# z4h source ~/.env.zsh
#

# environmental variables
export EDITOR=subl
export PAGER=""


# commands---------------------------------------------------

alias zsh_version='printf "zsh4Humans V5 RD 1.00"'

# alias ls="${aliases[ls]:-ls} --color=auto --group-directories-first"

alias ls='ls --color=auto --group-directories-first'
alias l='ls -1'				# one column
alias ll='ls -lh '			# long, human-readable size
alias lla='ls -lAh '		# long, human-readable size, Almost all (no . ..)
alias lt='ll -t'			# long, sorted by date

alias grep='grep --color'
alias igrep='grep -i'

# system
alias zsh_edit_aliases='subl ~/.zsh_aliases'
alias zsh_edit='subl ~/.zshrc'
alias zsh_reload='exec ~/.zshrc'
alias zsh_aliases_reload='source ~/.zsh_aliases'
alias reboot='sudo shutdown --reboot'
alias poweroff='sudo shutdown --poweroff'


# some personal programs
alias mf='mf.sh'							# searchmusic catalog
alias ff='ff.sh'							# search folders for movie codes
alias jav='cd ~/idrive/JD/00akiba'			# change to jav folder
alias music='cd ~/Music/done/cdimages'		# music cd images
alias nvim="/home/rodney/bin/appimage/nvim.appimage"
alias vim=nvim



# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/rodney/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/rodney/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/rodney/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/rodney/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<