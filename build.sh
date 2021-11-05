#!/bin/bash
set -eu

export ANDROID_NDK_ROOT=$ANDROID_NDK_HOME

chmod +x ./build-openssl.sh
chmod +x ./build-curl.sh

./build-openssl.sh
./build-curl.sh
