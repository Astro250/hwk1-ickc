SHELL := /usr/bin/env bash

# `make dummy` create dummy test files
# `make test` compared expected output of `findit.sh` from these dummy files to the actual output

dummy:
	mkdir -p data/hwk1
	for i in $$(seq 1 1000); do touch data/hwk1/$$i.fits; done
	for i in $$(seq 500 1500); do touch data/hwk1/$$i.cat; done
	: > test.txt; for i in $$(seq 1 499); do echo "data/hwk1/$$i.cat" >> test.txt; done

test:
	diff=$$(./findit.sh data/hwk1 | sort --version-sort | diff -3 test.txt -); if [[ -z $$diff ]]; then echo "Test passed"; else echo "Test failed"; fi

time:
	time ./findit.sh data/hwk1

clean:
	rm -rf data
	rm -f test.txt
