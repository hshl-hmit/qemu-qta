UNAME := $(shell uname)
export MAKE := make
export SED := sed
export ECHO := echo -e
ifeq ($(UNAME), Darwin)
export MAKE := gmake
export SED := gsed
export ECHO := echo
endif