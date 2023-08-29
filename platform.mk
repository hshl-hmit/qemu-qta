UNAME := $(shell uname -o)

ifeq ($(UNAME), Darwin)

export MAKE = gmake
export SED = gsed
export ECHO = echo
LDFLAGS += -shared -undefined dynamic_lookup -Wl,-install_name,$@
NCPUS = $(shell sysctl -n hw.ncpu)

else ifeq ($(UNAME), GNU/Linux)

export MAKE = make
export SED = sed
export ECHO = echo -e
LDFLAGS += -shared -Wl,-soname,$@
NCPUS = $(shell nproc)

else

$(error platform.mk: this operating system $(OS) is not supported!)

endif