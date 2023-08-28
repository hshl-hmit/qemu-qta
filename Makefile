# -*- Mode: makefile -*-
#
# This Makefile example is fairly independent from the main makefile
# so users can take and adapt it for their build. We only really
# include config-host.mak so we don't have to repeat probing for
# cflags that the main configure has already done for us.
-include $(CURDIR)/./qemu/bin/config-host.mak
include $(CURDIR)/./platform.mk

# The main QEMU uses Glib extensively so it's perfectly fine to use it
# in plugins (which many examples do).
CFLAGS = $(shell pkg-config --cflags glib-2.0)
CFLAGS += $(shell pkg-config --cflags --libs libxml-2.0)
CFLAGS += $(if $(findstring no-psabi,$(QEMU_CFLAGS)),-Wpsabi)
CFLAGS += -I$(SRC_PATH)/include/qemu -Wall -Werror -fPIC

all: tests

libqta.so: src/plugin.c src/qta.c
	@echo -e '--------------------------------------------------------------------------------'
	@echo -e '-  Compile libqta.so                                                           -'
	@echo -e '--------------------------------------------------------------------------------'
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^

tests: libqta.so
	$(MAKE) -s -C tests all

clean:
	rm -f libqta.so
	$(MAKE) -s -C tests clean

.PHONY: all tests clean
