#!/usr/bin/env bash
set -e -u

package="go${GO_VERSION}.linux-amd64.tar.gz"
download_file="/tmp/${package}"
download_url="https://dl.google.com/go/${package}"
install_dir="${HOME}/.go"

curl -o "${download_file}" "${download_url}"
[[ -d "${install_dir}" ]] && rm -rf "${install_dir}"
mkdir -p "${install_dir}"
tar xvzf "${download_file}" --strip-components 1 --directory "${install_dir}"
rm -f "${download_file}"
