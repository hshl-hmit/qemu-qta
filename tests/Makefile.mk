UNAME := $(shell uname)
ifeq ($(UNAME), Darwin)
SED := gsed
else ifeq ($(UNAME), Linux)
SED := sed
else
	$(error platform.mk: this operating system $(OS) is not supported!)
endif

export AIT2QTA   := $(abspath ../../util/ait2qta)
export QEMU_ARM  := $(abspath ../../qemu/bin/qemu-system-arm)
export QEMU_RV32 := $(abspath ../../qemu/bin/qemu-system-riscv32)
export QEMU_LIBQTA := $(abspath ../../libqta.so)

PASS=\033[0;92m
FAIL=\033[0;91m
RESET=\033[0m
NORMAL=\033[21;24m
BOLD=\033[1m

.PHONY: logfile_% verify_% %.qtdb %.pdf

verify_%: %.ref
	@printf "$(RESET)$(BOLD)--------------------------------------------------------------------------------$(RESET)\n"
	@printf "$(RESET)$(BOLD) VERIFY: $(<:.ref=)$(RESET)\n"
	@$(MAKE) logfile_$(<:.ref=)
	@printf "   $(PASS)[PASSED]$(RESET) logfile was written to $(<:.ref=.log).\n"
	@$(SED) "/^*[[:space:]]*Analysis[[:space:]]started\|duration/d" $(<:.ref=.log) | diff $< - || (@printf "   $(FAIL)[FAILED]$(RESET) logfile $(<:.ref=.log) does not match reference $<!\n" ; exit 1)
	@printf "   $(PASS)[PASSED]$(RESET) logfile $(<:.ref=.log) matches reference $<.\n"

%.qtdb: %.a3report
	$(AIT2QTA) -i $< -o $@ > /dev/null || (@printf "   $(FAIL)[FAILED]$(RESET) failed to generate time database $@ with ait2qta!"; exit 1)
	@printf "   $(PASS)[PASSED]$(RESET) generated time database $@ with ait2qta.\n"

%.pdf: %.a3report
	$(AIT2QTA) -i $< -g $@ > /dev/null || (@printf "   $(FAIL)[FAILED]$(RESET) failed to generate graphviz pdf $@ with ait2qta!"; exit 1)
	@printf "   $(PASS)[PASSED]$(RESET) generated graphviz pdf $@ with ait2qta.\n"
