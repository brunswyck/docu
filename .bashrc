# ~/.bashrc: executed by bash(1) for non-login shells.  # see /usr/share/doc/bash/examples/startup-files (in the package bash-doc) # for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=12000
HISTFILESIZE=24000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

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
force_color_prompt=yes

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

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
    export LANG=en_US.UTF-8
	
fi

# Start ssh-agent to keep you logged in with keys, use `ssh-add` to log in
agent=`pgrep ssh-agent -u $USER` # get only your agents           
if [[ "$agent" == "" || ! -e ~/.ssh/.agent_env ]]; then
    # if no agents or environment file is missing create a new one
    # remove old agents / environment variable files
    kill $agent running
    rm ~/.ssh/.agent_env 

    # restart
    eval `ssh-agent` 
    echo 'export SSH_AUTH_SOCK'=$SSH_AUTH_SOCK >> ~/.ssh/.agent_env             
    echo 'export SSH_AGENT_PID'=$SSH_AGENT_PID >> ~/.ssh/.agent_env             
fi

# create our own hardlink to the socket (with random name)           
source ~/.ssh/.agent_env                                                    
MYSOCK=/tmp/ssh_agent.${RANDOM}.sock                                        
ln -T $SSH_AUTH_SOCK $MYSOCK                                                
export SSH_AUTH_SOCK=$MYSOCK                                                

end_agent()                                                                     
{
    # if we are the last holder of a hardlink, then kill the agent
    nhard=`ls -l $SSH_AUTH_SOCK | awk '{print $2}'`                             
    if [[ "$nhard" -eq 2 ]]; then                                               
        rm ~/.ssh/.agent_env                                                    
        ssh-agent -k                                                            
    fi                                                                          
    rm $SSH_AUTH_SOCK                                                           
}                                                                               
trap end_agent EXIT                                                             
set +x

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
if [ -f ~/.xsessionrc ]; then
    . ~/.xsessionrc
fi
if [ -d ~/bashrc_addons/ ]; then
  for f in ~/bashrc_addons/*.sh;do source "$f";done
fi

