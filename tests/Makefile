include Makefile.mk

# Run tests sequentially for better readability
all:
	@printf "$(RESET)$(BOLD)--------------------------------------------------------------------------------$(RESET)\n"
	@printf "$(RESET)$(BOLD) ARCHITECTURE: riscv32 $(<:.ref=)$(RESET)\n"
	@$(MAKE) -s -C riscv32 verify_program01
	@$(MAKE) -s -C riscv32 verify_program02
	@$(MAKE) -s -C riscv32 verify_program04
	@printf "$(RESET)$(BOLD)--------------------------------------------------------------------------------$(RESET)\n"
	@printf "\n"
	@printf "$(RESET)$(BOLD)--------------------------------------------------------------------------------$(RESET)\n"
	@printf "$(RESET)$(BOLD) ARCHITECTURE: arm $(<:.ref=)$(RESET)\n"
	@$(MAKE) -s -C arm verify_program03
	@printf "$(RESET)$(BOLD)--------------------------------------------------------------------------------$(RESET)\n"

clean:
	rm -f arm/*.pdf
	rm -f arm/*.log
	rm -f arm/program03.qtdb
	rm -f arm/*.disas
	rm -f riscv32/*.pdf
	rm -f riscv32/*.log
	rm -f riscv32/program04.qtdb
	rm -f riscv32/*.disas
