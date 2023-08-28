include $(CURDIR)/../platform.mk
include Makefile.mk

# Run tests sequentially for better readability
all:
	@$(ECHO) "$(RESET)$(BOLD)--------------------------------------------------------------------------------$(RESET)"
	@$(ECHO) "$(RESET)$(BOLD) ARCHITECTURE: riscv32 $(<:.ref=)$(RESET)"
	@$(MAKE) -s -C riscv32 verify_program01
	@$(MAKE) -s -C riscv32 verify_program02
	@$(MAKE) -s -C riscv32 verify_program04
	@$(ECHO) "$(RESET)$(BOLD)--------------------------------------------------------------------------------$(RESET)"
	@$(ECHO) ""
	@$(ECHO) "$(RESET)$(BOLD)--------------------------------------------------------------------------------$(RESET)"
	@$(ECHO) "$(RESET)$(BOLD) ARCHITECTURE: arm $(<:.ref=)$(RESET)"
	@$(MAKE) -s -C arm verify_program03
	@$(ECHO) "$(RESET)$(BOLD)--------------------------------------------------------------------------------$(RESET)"

clean:
	rm -f arm/*.pdf
	rm -f arm/*.log
	rm -f arm/program03.qtdb
	rm -f arm/*.disas
	rm -f riscv32/*.pdf
	rm -f riscv32/*.log
	rm -f riscv32/program04.qtdb
	rm -f riscv32/*.disas