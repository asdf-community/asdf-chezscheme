#!/usr/bin/env bash

set -eo pipefail

GH_REPO="https://github.com/cisco/chezscheme"

ASDF_CHEZ_DEFAULT_OPTS=("--threads")

fail() {
  echo -e "\e[31mFail:\e[m $*"
  exit 1
}

curl_opt=("-L")

if test -n "$GITHUB_API_TOKEN"; then
  curl_opt+=("-H" "'Authorization: token $GITHUB_API_TOKEN'")
fi

sort_versions() {
  sed 'h; s/[+-]/./g; s/.p\([[:digit:]]\)/.z\1/; s/$/.z/; G; s/\n/ /' |
    LC_ALL=C sort -t. -k 1,1 -k 2,2n -k 3,3n -k 4,4n -k 5,5n | awk '{print $2}'
}

list_github_tags() {
  git ls-remote --tags --refs "$GH_REPO" | grep -o 'refs/tags/.*' | cut -d/ -f3- |
    sed 's/^v//'
}

list_all_versions() {
  list_github_tags
}

download_release() {
  local version filename url
  version="$1"
  filename="$2"

  url="$GH_REPO/releases/download/v${version}/csv${version}.tar.gz"

  echo "* Downloading chezscheme release $version..."
  curl "${curl_opt[@]}" --output "$filename" -C - "$url" || fail "Could not download $url"
}

install_version() {
  local install_type="$1"
  local version="$2"
  local install_path="$3"

  if [ "$install_type" != "version" ]; then
    fail "asdf-chezscheme supports release installs only"
  fi

  local release_file="$install_path/chezscheme-$version.tar.gz"
  (
    mkdir -p "$install_path/build"
    download_release "$version" "$release_file"
    tar -xzf "$release_file" -C "$install_path/build" --strip-components=1 || fail "Could not extract $release_file"

    (
      cd "$install_path/build"
      ./configure --installprefix="$install_path" "${ASDF_CHEZ_CONFIGURE_OPTS[@]:-${ASDF_CHEZ_DEFAULT_OPTS[@]}}"
      make
      make install
    )

    rm -rf "$install_path/build" "$release_file"

    test -x "$install_path/bin/scheme" || fail "Expected $install_path/bin/$tool_cmd to be executable."

    echo "chezscheme $version installation was successful!"
  ) || (
    rm -rf "$install_path"
    fail "An error ocurred while installing chezscheme $version."
  )
}
