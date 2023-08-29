# Prerequisite installation

In order to build qemu-qta and depending on your operating system you might need to install some prerequisites first. The following sections will give you a brief overview about how to install the necessary software to build QEMU and the qta plugin from source under Ubuntu Linux LTS 22.04 as well as under macOS v13 Ventura.

## Ubuntu 22.04 LTS

```bash
sudo apt install -y build-essential git libglib2.0-dev libxml2-dev ninja-build meson libpixman-1-dev python3-venv python3-pip sphinx graphviz graphviz-dev

sudo apt install -y python3-pygraphviz python3-lxml
```

## macOS Ventura 13.x

### Optional: Remove previously installed Command Line Tools
```bash
sudo rm -rf /Library/Developer/CommandLineTools
```
### Install Command Line Tools
#### macOS version <= 13 (Ventura, non-beta)
```bash
sudo xcode-select --install
```

#### macOS version 14+ (Sonoma or newer, currently beta)
Go to https://developer.apple.com/download/all/ and download the pre-release version of the Command Line Tools from there. Mount DMG and run installer.

### Install Homebrew package manager
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Install prerequisites for QEMU
```bash
brew install ninja meson pkg-config glib pixman make gnu-sed
```
### Install prerequisites for running the tests
```bash
# Setup python3 virtualenv
python3 -m venv .venv
source .venc/bin/activate

# Install graphviz
brew install graphviz

# Install pygraphviz
CFLAGS="-I$(brew --prefix graphviz)/include/" LDFLAGS="-L$(brew --prefix graphviz)/lib/" pip install pygraphviz

# Install lxml
pip install lxml
```

# Further reading and additional instructions
- [The QEMU build system architecture](https://qemu.readthedocs.io/en/latest/devel/build-system.html)
- [README on github.com/qemu](https://github.com/qemu/qemu/blob/master/README.rst)
- [QEMU Wiki: Hosts/Mac](https://wiki.qemu.org/Hosts/Mac) 
- [QEMU Wiki: Hosts/Linux](https://wiki.qemu.org/Hosts/Linux) 
- [QEMU Wiki: Hosts/W32](https://wiki.qemu.org/Hosts/W32) 
