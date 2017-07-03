# Set golang-related parameters
path=('/usr/local/go/bin' $path)
GOPATH="${HOME}/.go"
path=("${GOPATH}/bin" $path)

# Set history-related parameters
HISTFILE="${HOME}/.zhistory"
HISTSIZE=10000
SAVEHIST=10000

# Set language and locale to utf-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# oh-my-zsh plugins
#
# tmux
ZSH_TMUX_AUTOSTART=true

# Set PATH
path=("${HOME}/bin" $path)
path+=('/usr/sbin')
typeset -U path
export PATH
