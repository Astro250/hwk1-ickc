SHELL := /usr/bin/env bash

# `make dummy` create dummy test files
# `make test` compared expected output of `findit.sh` from these dummy files to the actual output

dummy:
	mkdir -p data/hwk1
	for i in $$(seq 1 1000); do touch "data/hwk1/\n $$i.fits"; done
	for i in $$(seq 500 1500); do touch "data/hwk1/\n $$i.cat"; done
	: > test.txt; for i in $$(seq 1 499); do printf "%s\n" "data/hwk1/\n $$i.fits" >> test.txt; done

test: dummy
	diff=$$(./findit.sh data/hwk1 | sort --version-sort | diff -3 test.txt -); if [[ -z $$diff ]]; then echo "Test passed"; exit 0; else echo "Test failed"; exit 1; fi

time:
	time ./findit.sh data/hwk1

clean:
	rm -rf data
	rm -f test.txt
