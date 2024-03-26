#!/bin/bash
set -eu

#export ANDROID_NDK_ROOT=$ANDROID_NDK_HOME
export ANDROID_NDK_HOME=$ANDROID_NDK_ROOT

chmod +x ./build-openssl.sh
chmod +x ./build-curl.sh

./build-openssl.sh
./build-curl.sh
