ALL_SRC=$(shell find . -name "*sv")

VERIBLE_LINT=verible-verilog-lint
VERIBLE_FORMAT=verible-verilog-format
VERIBLE_SYNTAX=verible-verilog-syntax

all:
	$(VERIBLE_LINT) $(ALL_SRC)
	$(VERIBLE_FORMAT) --inplace $(ALL_SRC)
	$(VERIBLE_SYNTAX) $(ALL_SRC)
