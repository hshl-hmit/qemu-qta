UNAME := $(shell uname -o)

ifeq ($(UNAME), Darwin)
export MAKE := gmake
export SED := gsed
export ECHO := echo
LDFLAGS = -shared -undefined dynamic_lookup -Wl,-install_name,$@
else  ifeq ($(UNAME), GNU/Linux)
@echo "ERROR: This operating system ($OS) is not supported!"
export MAKE := make
export SED := sed
export ECHO := echo -e
LDFLAGS = -shared -Wl,-soname,$@
else
@echo "ERROR: This operating system ($OS) is not supported!"
exit 1
endif