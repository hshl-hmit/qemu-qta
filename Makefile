# -*- Mode: makefile -*-
include $(CURDIR)/./platform.mk

CFLAGS = $(shell pkg-config --cflags glib-2.0)
CFLAGS += $(shell pkg-config --cflags --libs libxml-2.0)
CFLAGS += $(if $(findstring no-psabi,$(QEMU_CFLAGS)),-Wpsabi)
CFLAGS += -I$(CURDIR)/qemu/src/include/qemu -Wall -Werror -fPIC

LOG_INFO = $(CURDIR)/log_info.txt
LOG_ERROR = $(CURDIR)/log_error.txt
PIPE_OUTPUT = >> $(LOG_INFO) 2>> $(LOG_ERROR)

all: tests

qemu: qemu/bin/qemu-system-arm qemu/bin/qemu-system-riscv32

qemu/bin/CONFIGURED:
	@echo '+--------------------+                                          '
	@echo '| Download QEMU v8.1 |                                          '
	@echo '+--------------------+-----------------------------------------+'
	@echo '|  --> initializing QEMU repository "./qemu/src"               |'
	@git submodule update --init $(PIPE_OUTPUT)
	@echo '|  --> checking out branch "stable-v8.1"                       |'
	@cd qemu/src && git checkout stable-8.1 $(PIPE_OUTPUT)
	@echo '|  --> configuring for arm & riscv32 with plugin support       |'
	@mkdir -p qemu/bin
	@cd qemu/bin && ../src/configure --target-list=arm-softmmu,riscv32-softmmu --enable-plugins $(PIPE_OUTPUT)
	@echo '|  --> SUCCESS                                                 |'
	@echo '+--------------------------------------------------------------+'
	@touch qemu/bin/CONFIGURED

qemu/bin/qemu-system-arm: qemu/bin/CONFIGURED
	@echo '+--------------------------------------+                        '
	@echo '| Build QEMU v8.1 for ARM architecture |                        '
	@echo '+--------------------------------------+-----------------------+'
	@cd qemu/bin && $(MAKE) -j$(NCPUS) qemu-system-arm $(PIPE_OUTPUT)
	@echo '|  --> SUCCESS                                                 |'
	@echo '+--------------------------------------------------------------+'

qemu/bin/qemu-system-riscv32: qemu/bin/CONFIGURED
	@echo '+------------------------------------------+                    '
	@echo '| Build QEMU v8.1 for RISCV32 architecture |                    '
	@echo '+------------------------------------------+-------------------+'
	@cd qemu/bin && $(MAKE) -j$(NCPUS) qemu-system-riscv32 $(PIPE_OUTPUT)
	@echo '|  --> SUCCESS                                                 |'
	@echo '+--------------------------------------------------------------+'

plugin: qemu libqta.so

libqta.so: src/plugin.c src/qta.c
	@echo '+---------------------------------+                             '
	@echo '| Compile QEMU plugin "libqta.so" |                             '
	@echo '+---------------------------------+----------------------------+'
	@$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(PIPE_OUTPUT)
	@echo '|  --> SUCCESS                                                 |'
	@echo '+--------------------------------------------------------------+'

tests: plugin
	$(MAKE) -s -C tests all

clean:
	@rm -rf qemu/bin qemu/src
	@mkdir -p qemu/src
	@rm -f libqta.so $(LOG_INFO) $(LOG_ERROR)
	@$(MAKE) -s -C tests clean

.PHONY: all qemu plugin tests clean
