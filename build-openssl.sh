#!/bin/bash

if [[ "$OSTYPE" == "darwin"* ]]; then
    export CORES=$((`sysctl -n hw.logicalcpu`+1))
else
    export CORES=$((`nproc`+1))
fi

export TOOLCHAIN=$NDK/toolchains/llvm/prebuilt/$HOST_TAG

export ANDROID_NDK_HOME=$NDK
PATH=$TOOLCHAIN/bin:$PATH

#mkdir -p build/openssl
cd openssl

# arm64
export TARGET_HOST=aarch64-linux-android
export ANDROID_ARCH=arm64-v8a
export AR=$TOOLCHAIN/bin/llvm-ar
export CC=$TOOLCHAIN/bin/$TARGET_HOST$MIN_SDK_VERSION-clang
export AS=$CC
export CXX=$TOOLCHAIN/bin/$TARGET_HOST$MIN_SDK_VERSION-clang++
export LD=$TOOLCHAIN/bin/$TARGET_HOST$MIN_SDK_VERSION-clang
export RANLIB=$TOOLCHAIN/bin/llvm-ranlib
export STRIP=$TOOLCHAIN/bin/llvm-strip

./Configure android-arm64 \
 --prefix=$PWD/build/$ANDROID_ARCH/usr

make CALC_VERSIONS="SHLIB_COMPAT=; SHLIB_SOVER=" -j$CORES
make install_sw
make clean
#mkdir -p ../build/openssl/$ANDROID_ARCH
cp -R $PWD/build/$ANDROID_ARCH/* ${CONF_SYSROOT}/${ANDROID_ARCH}/

# arm
#export TARGET_HOST=arm-linux-androideabi
#export ANDROID_ARCH=armeabi-v7a
#export AR=$TOOLCHAIN/bin/llvm-ar
#export CC=$TOOLCHAIN/bin/$TARGET_HOST$MIN_SDK_VERSION-clang
#export AS=$CC
#export CXX=$TOOLCHAIN/bin/$TARGET_HOST$MIN_SDK_VERSION-clang++
#export LD=$TOOLCHAIN/bin/$TARGET_HOST$MIN_SDK_VERSION-clang
#export RANLIB=$TOOLCHAIN/bin/llvm-ranlib
#export STRIP=$TOOLCHAIN/bin/llvm-strip
#
#./Configure android-arm \
# --prefix=$PWD/build/$ANDROID_ARCH/usr
#
#make CALC_VERSIONS="SHLIB_COMPAT=; SHLIB_SOVER=" -j$CORES
#make install_sw
#make clean
##mkdir -p ../build/openssl/$ANDROID_ARCH
#cp -R $PWD/build/$ANDROID_ARCH/* ${CONF_SYSROOT}/${ANDROID_ARCH}/

# x86
#export TARGET_HOST=i686-linux-android
#export ANDROID_ARCH=x86
#export AR=$TOOLCHAIN/bin/llvm-ar
#export CC=$TOOLCHAIN/bin/$TARGET_HOST$MIN_SDK_VERSION-clang
#export AS=$CC
#export CXX=$TOOLCHAIN/bin/$TARGET_HOST$MIN_SDK_VERSION-clang++
#export LD=$TOOLCHAIN/bin/$TARGET_HOST$MIN_SDK_VERSION-clang
#export RANLIB=$TOOLCHAIN/bin/llvm-ranlib
#export STRIP=$TOOLCHAIN/bin/llvm-strip
#
#./Configure android-x86 \
# --prefix=$PWD/build/$ANDROID_ARCH/usr
#
#make CALC_VERSIONS="SHLIB_COMPAT=; SHLIB_SOVER=" -j$CORES
#make install_sw
#make clean
##mkdir -p ../build/openssl/$ANDROID_ARCH
#cp -R $PWD/build/$ANDROID_ARCH/* ${CONF_SYSROOT}/${ANDROID_ARCH}/

# x64
export TARGET_HOST=x86_64-linux-android
export ANDROID_ARCH=x86_64
export AR=$TOOLCHAIN/bin/llvm-ar
export CC=$TOOLCHAIN/bin/$TARGET_HOST$MIN_SDK_VERSION-clang
export AS=$CC
export CXX=$TOOLCHAIN/bin/$TARGET_HOST$MIN_SDK_VERSION-clang++
export LD=$TOOLCHAIN/bin/$TARGET_HOST$MIN_SDK_VERSION-clang
export RANLIB=$TOOLCHAIN/bin/llvm-ranlib
export STRIP=$TOOLCHAIN/bin/llvm-strip

./Configure android-x86_64 \
 --prefix=$PWD/build/$ANDROID_ARCH/usr

make CALC_VERSIONS="SHLIB_COMPAT=; SHLIB_SOVER=" -j$CORES
make install_sw
make clean
#mkdir -p ../build/openssl/$ANDROID_ARCH
cp -R $PWD/build/$ANDROID_ARCH/* ${CONF_SYSROOT}/${ANDROID_ARCH}/

cd ..
