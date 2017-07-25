#!/usr/bin/env bash
set -e -u

BACKUP="${HOME?}/.dotfiles_backup"
DOTFILES=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
PACKAGES=(editorconfig git ruby tmux vim zsh)
RUBY_VERSION='2.4.1'

git submodule update --init --merge --remote
mkdir -p "${BACKUP?}"
for PKG in "${PACKAGES[@]?}"; do
    find "${DOTFILES?}/${PKG?}" -mindepth 1 -maxdepth 1 |\
        while read CONFIG; do
            CONFIG_LINK="${HOME?}/$(basename ${CONFIG?})"
            if [[ ! -L "${CONFIG_LINK?}" && -e "${CONFIG_LINK?}" ]]; then
                mv "${CONFIG_LINK?}" "${BACKUP?}"
            fi
            ln -frsT "${CONFIG?}" "${CONFIG_LINK?}"
        done
done
cd ${HOME}/.rbenv && src/configure && make -C src
RBENV_INIT=$(rbenv init 2>&1 | sed -e '/^#/d' -e '/^$/d')
${RBENV_INIT} && rbenv install ${RUBY_VERSION?}
