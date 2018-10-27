# .bashrc

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

PATH=$PATH:/root


DISABLE_AUTO_TITLE=true
tmux_init()
{

    
    tmux new-session -s "kumu" -d -n "local"
    tmux new-window -n "jidev01" "goto jidev01"
    tmux new-window -n "jiprd01" "goto jiprd01"
    tmux new-window -n "jigitlab" "goto jigitlab"
    tmux new-window -n "jimonitor" "goto jimonitor"
    tmux new-window -n "jijenkins" "goto jijenkins"
    tmux new-window -n "node1" "go_node1"
    #tmux new-window -n "jiGPU" "go_jigpu"
    #tmux new-window -n "local_bypass" "go_jilocal"
   
    #tmux split-window -h
    #tmux split-window -v "go jimonitor"
    tmux -2 attach-session -d
}

# 判断是否已有开启的tmux会话，没有则开启
if which tmux 2>&1 >/dev/null; then
    test -z "$TMUX" && (tmux attach || tmux_init)
fi
export GOROOT=/usr/local/go
export GOPATH=/usr/local/go/bin
export PATH=$PATH:$GOROOT:$GOPATH:$GOPATH/bin
export GOBIN=$GOPATH/bin
