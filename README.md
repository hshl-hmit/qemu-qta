# QTA: The QEMU Timing Analyzer Plugin

Welcome to the QEMU QTA plugin. This extension adds time simulation and analysis support to the free System Emulator QEMU.

## Set up your simulation and test environmant

In order to build `qemu-qta` and depending on your operating system you might need to install some prerequisites first. The QEMU compilation usually needs some libraries and tools that are not available on all systems. 

> Please refer to [/PREREQUISITES.md](/PREREQUISITES.md) for details how to set up your system accordingly. 

## Testing the toolschain

The QEMU Timing Analyzer comes with a set of binary test programs for both ARM and RISC-V. Each test is accompanied by a suitable simulation-grade timing model for co-simulation. In addition, reference values regarding the outputs of all tests are included. These can be used to check whether the QTA toolchain behaves as expected. You can run these tests with

```code
make tests
```

from here. For each of the three test binaries a time simulation will be run and their simulation output is validated against reference results.

## How to write timing models

Please refer to [/TUTORIAL.md](/TUTORIAL.md) for a step-by-step guide that explains how to write a QTA timing annotation database (.qtdb) for binary program and how to run the time simulation afterwards.

## Further reading and additional instructions

- [The QEMU build system architecture](https://qemu.readthedocs.io/en/latest/devel/build-system.html)
- [README on github.com/qemu](https://github.com/qemu/qemu/blob/master/README.rst)
- [QEMU Wiki: Hosts/Mac](https://wiki.qemu.org/Hosts/Mac) 
- [QEMU Wiki: Hosts/Linux](https://wiki.qemu.org/Hosts/Linux) 
- [QEMU Wiki: Hosts/W32](https://wiki.qemu.org/Hosts/W32) 
