# We only allow compilation on linux!
ifneq ($(shell uname), Linux)
$(error OS must be Linux!)
endif

all: build_dir build_

build_dir:
	mkdir -p build

build_:
	gcc src/convert.c -o build/convert
	
clean:
	# Remove everything except source files
	rm -r -f build
