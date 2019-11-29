# .zshrc
#
# oh-my-zsh configuration
#
# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="bullet-train"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(common-aliases git ruby tmux vi-mode)

source $ZSH/oh-my-zsh.sh

# User configuration
#
# Set directory-related options
setopt AUTO_CD
setopt AUTO_PUSHD
setopt CDABLE_VARS
setopt PUSHD_IGNORE_DUPS

# Set expansion- and globbing-related options
setopt EXTENDED_GLOB
setopt NO_MATCH

# Set history-related options
setopt INC_APPEND_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_SPACE

# Set miscellaneous options
setopt NO_BEEP
setopt NO_GLOBAL_RCS

# Use vi key bindings
bindkey -v

autoload -Uz compinit
compinit

# aliases
alias cd=' cd'
alias clear=' clear'
alias ls=' ls --color=auto'
[[ -s "${HOME}/.aliases.local" ]] && source "${HOME}/.aliases.local"

# golang setup
GO_INSTALL="${HOME}/.go"
GO_BIN="${GO_INSTALL}/bin"
[[ -d ${GO_BIN} ]] && path=(${GO_BIN} $path)
export GOPATH="${HOME}/go"
path=("${GOPATH}/bin" $path)

# Configure PATH
#
# Prefer GNU commands on macOS
if [[ $(uname) == 'Darwin' ]]; then
    GNUBIN='/usr/local/opt/coreutils/libexec/gnubin'
    GNUMAN='/usr/local/opt/coreutils/libexec/gnuman'
    [[ -d ${GNUBIN} ]] && path=(${GNUBIN} $path)
    [[ -d ${GNUMAN} ]] && manpath=(${GNUMAN} $manpath)
fi

# Add rbenv to PATH
path=("${HOME}/.rbenv/bin" $path)
eval "$(rbenv init -)"

path=("${HOME}/bin" $path)

# Enable python virtualenv
[[ -d "${HOME}/venv" ]] && source "${HOME}/venv/bin/activate"

# Ensure system paths are in PATH
typeset -a bins
bins=('/usr/local/bin' '/usr/local/sbin' '/usr/bin' '/usr/sbin' '/bin' '/sbin')
for bin in $bins; do
    [[ ! -L $bin && -d $bin ]] && path+=($bin)
done

# Enforce uniqueness for paths in PATH
typeset -U path
export PATH

# dircolors solarized
[[ -s "${HOME}/.dir_colors" ]] && eval $(dircolors "${HOME}/.dir_colors")

# Set secure umask
umask 027
