alias py='ipython'
# alias ls='ls -GF'
alias dev='ssh -A tracy@dev-tracy'

export PATH=/usr/local/bin:/opt/local/bin:/opt/local/sbin:$PATH

# export CLICOLOR=1
# export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

SSH_ENV="$HOME/.ssh/environment"

function start_agent {
     echo "Initialising new SSH agent..."
     /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
     echo succeeded
     chmod 600 "${SSH_ENV}"
     . "${SSH_ENV}" > /dev/null
     /usr/bin/ssh-add;
}

# Source SSH settings, if applicable
if [ -f "${SSH_ENV}" ]; then
     . "${SSH_ENV}" > /dev/null
     ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
         start_agent;
     }
else
     start_agent;
fi

dsh20 () {
    usage="$0 group cmd"
    [ -z "$1" ] && echo $usage && return 1
    [ -z "$2" ] && echo $usage && return 1
    dsh -r ssh -o "-o ConnectTimeout=10" -o "-o CheckHostIP=no" -o "-o StrictHostKeyChecking=no" -F 20 -M -c -g "$1" "$2"
}

# added by Anaconda 1.7.0 installer
export PATH="//anaconda/bin:$PATH"

# golang env setup
export GOPATH=$HOME/gocode
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
