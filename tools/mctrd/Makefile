# We only allow compilation on linux!
ifneq ($(shell uname), Linux)
$(error OS must be Linux!)
endif

all:
	mkdir -p build
	gcc -Wall -std=c99 -o build/mctrd src/main.c