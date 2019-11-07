#!/usr/bin/env bash
set -e -u

package="go${GO_VERSION}.linux-amd64.tar.gz"
download_file="/tmp/${package}"
download_url="https://dl.google.com/go/${package}"

curl -o "${download_file}" "${download_url}"
[[ -d "${HOME}/go" ]] && rm -rf "${HOME}/go"
tar xvzf "${download_file}" --directory "${HOME}"
rm -f "${download_file}"
