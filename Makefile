mkfile_path := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
EXES = hello

all: $(EXES)

run_all: $(EXES)
	@for exe in $^; do \
		echo "Running $$exe"; \
		./$$exe; \
	done

$(EXES): %: $(mkfile_path)/%.c
	cc -o $@ $^

.PHONY: all run_all clean
clean:
	rm -f $(EXES)
