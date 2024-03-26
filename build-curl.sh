#!/bin/bash
set -eux

#mkdir -p build/curl
cd curl
./buildconf

export TOOLCHAIN=$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/$HOST_TAG
PATH=$TOOLCHAIN/bin:$PATH

export AR=$TOOLCHAIN/bin/llvm-ar
export AS=$TOOLCHAIN/bin/llvm-as
export LD=$TOOLCHAIN/bin/ld
export RANLIB=$TOOLCHAIN/bin/llvm-ranlib
export STRIP=$TOOLCHAIN/bin/llvm-strip

# arm64
export TARGET_HOST=aarch64-linux-android
export CC=$TOOLCHAIN/bin/$TARGET_HOST$MIN_SDK_VERSION-clang
export CXX=$TOOLCHAIN/bin/$TARGET_HOST$MIN_SDK_VERSION-clang++
export SSL_DIR=$PWD/../openssl/build/arm64-v8a/usr
export PKG_CONFIG_PATH=$SSL_DIR/lib/pkgconfig

./configure --host=$TARGET_HOST \
            --target=$TARGET_HOST \
            --prefix=$PWD/build/arm64-v8a/usr \
            --with-openssl \
            --disable-verbose \
            --disable-manual \
            --disable-unix-sockets \
            --disable-ares \
            --disable-rtsp \
            --disable-ipv6 \
            --disable-proxy \
            --disable-versioned-symbols \
            --without-librtmp \
            --without-zlib \
            --without-libpsl \
            --disable-dict \
            --disable-file \
            --disable-ftp \
            --disable-gopher \
            --disable-imap \
            --disable-pop3 \
            --disable-smb \
            --disable-smtp \
            --disable-telnet \
            --disable-tftp

make -j4
make install
make clean
#mkdir -p ../build/curl/arm64-v8a
cp -R $PWD/build/arm64-v8a/* ${CONF_SYSROOT}/arm64-v8a/

# arm
#export TARGET_HOST=armv7a-linux-androideabi
#export CC=$TOOLCHAIN/bin/$TARGET_HOST$MIN_SDK_VERSION-clang
#export CXX=$TOOLCHAIN/bin/$TARGET_HOST$MIN_SDK_VERSION-clang++
#export SSL_DIR=$PWD/../openssl/build/armeabi-v7a/usr
#export PKG_CONFIG_PATH=$SSL_DIR/lib/pkgconfig
#
#./configure --host=$TARGET_HOST \
#            --target=$TARGET_HOST \
#            --prefix=$PWD/build/armeabi-v7a/usr \
#            --with-openssl \
#            --disable-verbose \
#            --disable-manual \
#            --disable-unix-sockets \
#            --disable-ares \
#            --disable-rtsp \
#            --disable-ipv6 \
#            --disable-proxy \
#            --disable-versioned-symbols \
#            --without-librtmp \
#            --without-zlib \
#            --without-libpsl \
#            --disable-dict \
#            --disable-file \
#            --disable-ftp \
#            --disable-gopher \
#            --disable-imap \
#            --disable-pop3 \
#            --disable-smb \
#            --disable-smtp \
#            --disable-telnet \
#            --disable-tftp
#
#make -j4
#make install
#make clean
##mkdir -p ../build/curl/armeabi-v7a
#cp -R $PWD/build/armeabi-v7a/* ${CONF_SYSROOT}/armeabi-v7a/

# x86
#export TARGET_HOST=i686-linux-android
#export CC=$TOOLCHAIN/bin/$TARGET_HOST$MIN_SDK_VERSION-clang
#export CXX=$TOOLCHAIN/bin/$TARGET_HOST$MIN_SDK_VERSION-clang++
#export SSL_DIR=$PWD/../openssl/build/x86/usr
#export PKG_CONFIG_PATH=$SSL_DIR/lib/pkgconfig
#
#./configure --host=$TARGET_HOST \
#            --target=$TARGET_HOST \
#            --prefix=$PWD/build/x86/usr \
#            --with-openssl \
#            --disable-verbose \
#            --disable-manual \
#            --disable-unix-sockets \
#            --disable-ares \
#            --disable-rtsp \
#            --disable-ipv6 \
#            --disable-proxy \
#            --disable-versioned-symbols \
#            --without-librtmp \
#            --without-zlib \
#            --without-libpsl \
#            --disable-dict \
#            --disable-file \
#            --disable-ftp \
#            --disable-gopher \
#            --disable-imap \
#            --disable-pop3 \
#            --disable-smb \
#            --disable-smtp \
#            --disable-telnet \
#            --disable-tftp
#
#make -j4
#make install
#make clean
##mkdir -p ../build/curl/x86
#cp -R $PWD/build/x86/* ${CONF_SYSROOT}/x86/

# x64
export TARGET_HOST=x86_64-linux-android
export CC=$TOOLCHAIN/bin/$TARGET_HOST$MIN_SDK_VERSION-clang
export CXX=$TOOLCHAIN/bin/$TARGET_HOST$MIN_SDK_VERSION-clang++
export SSL_DIR=$PWD/../openssl/build/x86_64/usr
export PKG_CONFIG_PATH=$SSL_DIR/lib/pkgconfig

./configure --host=$TARGET_HOST \
            --target=$TARGET_HOST \
            --prefix=$PWD/build/x86_64/usr \
            --with-openssl \
            --disable-verbose \
            --disable-manual \
            --disable-unix-sockets \
            --disable-ares \
            --disable-rtsp \
            --disable-ipv6 \
            --disable-proxy \
            --disable-versioned-symbols \
            --without-librtmp \
            --without-zlib \
            --without-libpsl \
            --disable-dict \
            --disable-file \
            --disable-ftp \
            --disable-gopher \
            --disable-imap \
            --disable-pop3 \
            --disable-smb \
            --disable-smtp \
            --disable-telnet \
            --disable-tftp

make -j4
make install
make clean
#mkdir -p ../build/curl/x86_64
cp -R $PWD/build/x86_64/* ${CONF_SYSROOT}/x86_64/

cd ..
