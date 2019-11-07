#!/usr/bin/env bash
set -e -u

backup_location="${HOME}/.dotfiles_backup"
script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
packages=(editorconfig git ruby tmux vim zsh)

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
