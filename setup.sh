#!/usr/bin/env bash
set -e -u

backup_location="${HOME}/.dotfiles_backup"
script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
packages=(editorconfig git ruby tmux vim zsh)
ruby_build="${HOME}/.rbenv/plugins/ruby-build"
ruby_version='2.6.5'

git submodule update --init --merge --remote
mkdir -p "${backup_location}"
for pkg in "${packages[@]}"; do
    find "${script_dir}/${pkg}" -mindepth 1 -maxdepth 1 |\
        while read cfg; do
            cfg_link="${HOME}/$(basename ${cfg})"
            if [[ ! -L "${cfg_link}" && -e "${cfg_link}" ]]; then
                mv "${cfg_link}" "${backup_location}"
            fi
            ln -frsT "${cfg}" "${cfg_link}"
        done
done

cd "${HOME}/.rbenv" && src/configure && make -C src
mkdir -p "${ruby_build}"
[[ -d "${ruby_build}/.git" ]] ||\
    git clone https://github.com/rbenv/ruby-build.git "${ruby_build}"
rbenv install -s "${ruby_version}"
rbenv global "${ruby_version}"
gem install bundler
rbenv rehash
