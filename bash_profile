# -*- mode: sh -*- 

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

# java setup
export JAVA_HOME=$(/usr/libexec/java_home)
export MAVEN_OPTS="-Xms512m -Xmx2048m -Xss128m -XX:MaxPermSize=1024M -XX:+CMSClassUnloadingEnabled"

# golang env setup
export GOPATH=$HOME/gocode
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

source ~/.bashrc