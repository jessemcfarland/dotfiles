# Set golang-related parameters
[[ -s '/usr/local/go/bin' ]] && path=('/usr/local/go/bin' $path)
export GOPATH="${HOME}/.go"
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
ZSH_TMUX_AUTOSTART=false

# Set PATH
path=("${HOME}/bin" $path)
case $(uname) in
    Darwin)
        path+=('/usr/bin')
        path+=('/bin')
        path+=('/usr/sbin')
        path+=('/sbin')
        ;;
    Linux)
        path+=('/usr/bin')
        path+=('/usr/sbin')
        ;;
esac
typeset -U path
export PATH
