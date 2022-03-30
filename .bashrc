
############################################
# Terminal colors & coziness.
############################################

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'


############################################
# Variables.
############################################

export RC=~/.bashrc
export DC=~/dotfiles/.bashrc
export DOTNET_CLI_TELEMETRY_OPTOUT=1


############################################
# Alias definitions.
############################################

# Shortcuts
alias todo="vi ~/Desktop/todo.txt"
alias spyder='python3 /usr/lib/python3/dist-packages/spyder/app/start.py'
alias sublime='/opt/sublime_text/sublime_text'

# Shorthands
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias gut="git"
alias got="git"
alias bit="git"
alias sl="ls"
alias g="grep -i"
alias spip='sudo -H pip'
alias spip2='sudo -H pip2'
alias spip3='sudo -H pip3'
alias chx="chmod +x"
alias cd..="cd .."
alias ipython='ipython3'

# Utils
alias @@='$($(fc -ln -1) |& tail -1)'
alias yapff='yapf -ri -vv -e env .'
alias greprecursive='grep -rnw . -e'
alias greprecursivei='grep -rnwi . -e'
alias smi='while true; do sleep 1; nvidia-smi; done'
alias smi2='watch -n0.1 nvidia-smi'
alias wdf='watch -n0.1 df -H'

# Cleaning
alias rmpyc='find $(git rev-parse --show-cdup) -name "*.pyc" -delete && find $(git rev-parse --show-cdup) -name "__pycache__" -delete'
alias rmdstore='find $(git rev-parse --show-cdup) -name "_DS_Store" -delete'
alias rk="sudo rkhunter --check --pkgmgr DPKG --report-warnings-only"
alias clean='rm -rf .cache/spotify/Data/'


# Image editing
alias topdf='convert * -quality 70 -precision 300 final.pdf'
alias topdfhq='convert * -quality 95 -precision 300 final.pdf'
alias pdftojpg='convert -density 200 * -quality 90 -precision 100 -background white -alpha remove %04d.jpg'
alias pdftojpghq='convert -density 300 * -quality 100 -precision 300 -background white -alpha remove %04d.jpg'
alias toanimatedgif='convert -quality 100 -delay 20 -loop 0 * myimage.gif'
alias change_wallpaper="crontab -e"

#  Git
alias gitlog='git log --graph --oneline --all'
alias gitlogr='git log --graph --decorate --pretty=oneline --abbrev-commit --all'
alias gitlogf='git log --graph --all'
alias gitsta="gitstats . ./____gitstats && sensible-browser ./____gitstats/index.html"
alias gitadd="git add -A"
alias gst="git status"
alias gitstad="rm -rf ./____gitstats/"
alias gitnuke="git reset HEAD^"


