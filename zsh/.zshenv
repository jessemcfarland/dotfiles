# .zshenv
#
# Set editor
export EDITOR=vim

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

# oh-my-zsh themes
ZSH_CUSTOM="${HOME}/.zsh-custom"
export TERM='xterm-256color'
BULLETTRAIN_PROMPT_ORDER=(
	time
	status
	custom
	context
	dir
	perl
	ruby
	virtualenv
	aws
	go
	elixir
	git
	hg
	cmd_exec_time
)
