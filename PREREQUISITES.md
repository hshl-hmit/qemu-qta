# Prerequisites

In order to build `qemu-qta` and depending on your operating system you might need to install some prerequisites first. The following sections will give you a brief overview about how to install the necessary software to build QEMU and the qta plugin from source under `Ubuntu Linux LTS 22.04` as well as under `macOS v13 Ventura`.

## Ubuntu 22.04 LTS

#### Dependencies for QEMU

```console
sudo apt install -y build-essential git libglib2.0-dev libxml2-dev ninja-build meson libpixman-1-dev python3-venv
```

#### Required python packages for running the tests

```console
sudo apt install -y graphviz graphviz-dev python3-pygraphviz python3-lxml
```

## macOS

#### Command Line Tools

```console
# Delete old version (optional)
sudo rm -rf /Library/Developer/CommandLineTools

# Fetch and install
sudo xcode-select --install
```

> #### If you are running a pre-relase version of macOS:
>     
> For pre-release versions of macOS, the `xcode-select --install` command will not work. Instead, you need to login to the [Apple Developer](https://developer.apple.com/download/all/) website and download the latest beta version of the Command Line Tools from there. 
>     
> At the time of writing these instructions, the latest **Command Line Tools for Xcode 15 beta 7** work with **macOS Version 14.0 Sonoma**. They can be downloaded [here](https://download.developer.apple.com/Developer_Tools/Command_Line_Tools_for_Xcode_15_beta_7/Command_Line_Tools_for_Xcode_15_beta_7.dmg). Open the DMG file and install the toolchain.

#### Homebrew Package Manager

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

#### Dependencies for QEMU

```console
brew install ninja meson pkg-config glib pixman make gnu-sed
```

#### Required python packages for running the tests

##### virtualenv

```console
python3 -m venv .venv
source .venv/bin/activate
```

##### pygraphviz

```console
brew install graphviz
CFLAGS="-I$(brew --prefix graphviz)/include/" LDFLAGS="-L$(brew --prefix graphviz)/lib/" pip install pygraphviz
```

##### lxml

```console
pip install lxml
```
