#!/bin/bash

export ARCH=arm
export CROSS_COMPILE=/build/j500fn/linaro/gcc-linaro-arm-none-eabi-4.8-2014.04_linux/bin/arm-none-eabi-
mkdir output

make -C $(pwd) O=output msm8916_sec_defconfig VARIANT_DEFCONFIG=msm8916_sec_j5nlte_eur_defconfig SELINUX_DEFCONFIG=selinux_defconfig
make -j9 -C $(pwd) O=output

cp output/arch/arm/boot/Image $(pwd)/arch/arm/boot/zImage
tools/dtbTool -s 2048 -o output/arch/arm/boot/dt.img -p output/scripts/dtc/ output/arch/arm/boot/dts/ -v
cp output/arch/arm/boot/dt.img arch/arm/boot/dt.img
