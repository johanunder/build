#!/bin/bash
sudo apt install bc
sudo apt install gcc-arm-linux-gnueabi
sudo apt install gcc-aarch64-linux-gnu
export KBUILD_BUILD_USER=Olympus
export KBUILD_BUILD_HOST=zeus-host
# Compile plox
function compile() {
    make -j$(nproc) O=out ARCH=arm64 RMX1801_defconfig
    make -j$(nproc) ARCH=arm64 O=out \
                               CROSS_COMPILE=aarch64-linux-gnu- \
                               CROSS_COMPILE_ARM32=arm-linux-gnueabi-
}
compile
