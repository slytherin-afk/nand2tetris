BIN_DIR = ./bin
BUILD = ./

build:
	make -f chips.make build

build_test: build
	make -f chips.make build_test

link_test: build_test
	make -f chips.make build_test

test: link_test
	make -f chips.make test

clean:
	make -f chips.make clean
