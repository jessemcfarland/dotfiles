# Set editor
export EDITOR=vim

# Set golang-related parameters
[[ -d '/usr/local/go/bin' ]] && path=('/usr/local/go/bin' $path)
export GOPATH="${HOME}/.go"
path=("${GOPATH}/bin" $path)

# Set history-related parameters
HISTFILE="${HOME}/.zhistory"
HISTSIZE=10000
SAVEHIST=10000

# Set language and locale to utf-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Add rvm to PATH
[[ -d "${HOME}/.rvm/bin" ]] && path=("${HOME}/.rvm/bin" $path)

# oh-my-zsh plugins
#
# tmux
ZSH_TMUX_AUTOSTART=false

# Set PATH
path=("${HOME}/bin" $path)
typeset -a bins
bins=('/usr/bin' '/bin' '/usr/sbin' '/sbin')
for bin in $bins; do
    [[ ! -L $bin && -d $bin ]] && path+=($bin)
done
typeset -U path
export PATH
