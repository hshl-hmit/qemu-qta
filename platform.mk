UNAME := $(shell uname)
export MAKE := make
export SED := sed
ifeq ($(UNAME), Darwin)
export MAKE := gmake
export SED := gsed
endif