#!/usr/bin/env bash
set -e -u

ruby_build="${HOME}/.rbenv/plugins/ruby-build" 

pushd "${HOME}/.rbenv"
    src/configure && make -C src
    mkdir -p "${ruby_build}"
    [[ -d "${ruby_build}/.git" ]] ||\
        git clone https://github.com/rbenv/ruby-build.git "${ruby_build}"
popd

rbenv install -s "${RUBY_VERSION}"
rbenv global "${RUBY_VERSION}"
gem install bundler
rbenv rehash
