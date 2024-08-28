# We only allow compilation on linux!
ifneq ($(shell uname), Linux)
$(error OS must be WSL or Linux!)
endif

CC = gcc
#CFLAGS  = -ox -ob -ol+ -onatx -oh -zp8 -g0 -Ofast -oe -ot -Wall -xc -s -finline-functions  -floop-optimize -fno-stack-check -march=i386 -mtune=i686
CFLAGS = -Wall
RM = rm

all: build_dir zx0 dzx0

build_dir:
	mkdir -p build

zx0: 
	$(CC) $(CFLAGS) -o build/zx0 src/zx0.c src/optimize.c src/compress.c src/memory.c

dzx0:
	$(CC) $(CFLAGS) -o build/dzx0 src/dzx0.c

clean:
	# Remove everything except source files
	rm -r -f build
