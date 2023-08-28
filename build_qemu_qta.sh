#!/usr/bin/env bash

# WARNING: Always run script inside this folder or fix relative paths first!

OS=$(uname -o)
if [ "$OS" == 'Darwin' ]; then
	MAKE="gmake -j$(sysctl -n hw.ncpu)"
elif [ "$OS" == 'GNU/Linux' ]; then
	MAKE="make -j$(nproc)"
else 
    echo "ERROR: This operating system ($OS) is not supported!"
    exit 1
fi

init() {
  git submodule update --init
	rm -f libqta.so
}

qemu_setup() {
	echo '|  --> fetched qemu source code                                |'
	echo '+--------------------------------------------------------------+'
	git checkout stable-8.1
	echo '|  --> checked out QEMU stable version 8.1                     |'
	cd ../bin/
	../src/configure --target-list=arm-softmmu,riscv32-softmmu --enable-plugins || exit 1
	echo '|  --> configured qemu source code                             |'
	echo '+--------------------------------------------------------------+'
}

qemu_compile() {
	$MAKE || exit 1
	echo '|  --> compilation finished                                    |'
	echo '+--------------------------------------------------------------+'
}

# Remove previous build files
echo '+-------------------------------------+                         '
echo '| STEP 1 / 2: Download & Compile QEMU |                         '
echo '+-------------------------------------+------------------------+'
echo '|  ---> getting the QEMU source tree...                        |'
init
mkdir -p qemu/bin
mkdir -p qemu/src
cd qemu/src
qemu_setup
qemu_compile
cd ../..
echo '|  --> DONE                                                    |'
echo '+--------------------------------------------------------------+'
echo ''

# Simulate all tutorial programs and verify the result against ref.
echo '+--------------------------------+                              '
echo '| STEP 2 / 2: Compile QTA plugin |                              '
echo '+--------------------------------+-----------------------------+'
$MAKE libqta.so
echo '|  --> DONE                                                    |'
echo '+--------------------------------------------------------------+'
echo ''
