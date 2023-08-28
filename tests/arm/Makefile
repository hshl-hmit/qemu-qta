include ../Makefile.mk

run_%: %.elf %.qtdb
	@$(MAKE) -s $(<:.elf=.qtdb)
	$(QEMU_ARM) -M netduino2 -nographic -kernel $< -plugin $(QEMU_LIBQTA),qtdb=$(<:.elf=.qtdb)

logfile_%: %.elf %.qtdb
	$(QEMU_ARM) -M netduino2 -nographic -kernel $< -plugin $(QEMU_LIBQTA),qtdb=$(<:.elf=.qtdb),log=$(<:.elf=.log) > /dev/null || (echo -e '   $(FAIL)[FAILED]$(RESET) Simulation crashed with $< and $(<:.elf=.qtdb).' ; exit 1)
