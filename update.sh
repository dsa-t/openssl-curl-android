#!/bin/bash
set -eu -o pipefail
set -x

pushd() {
    command pushd "$@" > /dev/null
}

popd() {
    command popd "$@" > /dev/null
}

update-to-latest-tag() {
	pushd "$1"
	git fetch --all
	git checkout "$(git describe  --abbrev=0 origin/$2)"
	popd
}

get-tag() {
	pushd "$1"
	git describe  --abbrev=0
	popd
}

update-to-latest-tag curl master
update-to-latest-tag openssl OpenSSL_1_1_1-stable

openssl_tag="$(get-tag openssl)"
curl_tag="$(get-tag curl)"
git commit -am "curl $curl_tag openssl $openssl_tag"
git push
