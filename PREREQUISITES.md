# Prerequisite installation

In order to build qemu-qta and depending on your operating system you might need to install some prerequisites first. The following sections will give you a brief overview about how to install the necessary software to build QEMU and the qta plugin from source under Ubuntu Linux LTS 22.04 as well as under macOS v13 Ventura.

## Ubuntu 22.04 LTS

```bash
sudo apt install -y build-essential git libglib2.0-dev libxml2-dev ninja-build meson libpixman-1-dev python3-venv python3-pip sphinx graphviz graphviz-dev

sudo apt install -y python3-pygraphviz python3-lxml
```

## macOS Ventura 13.x

```bash
# Install Homebrew Package Manager (https://brew.sh/)
# -> Run the following command in macOS Terminal
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Install prerequisites
brew install glib gnutls jpeg libpng libtool libusb lzo make nettle ninja pixman pkg-config snappy

# Make newly installed gmake (temporarily) take higher precedence
export PATH="/usr/local/opt/make/libexec/gnubin:$PATH"
```

# Further reading and additional instructions
- [The QEMU build system architecture](https://qemu.readthedocs.io/en/latest/devel/build-system.html)
- [README on github.com/qemu](https://github.com/qemu/qemu/blob/master/README.rst)
- [QEMU Wiki: Hosts/Mac](https://wiki.qemu.org/Hosts/Mac) 
- [QEMU Wiki: Hosts/Linux](https://wiki.qemu.org/Hosts/Linux) 
- [QEMU Wiki: Hosts/W32](https://wiki.qemu.org/Hosts/W32) 
