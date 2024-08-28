
# auto-generated: Wed Aug 28 14:53:48 MSK 2024

.PHONY: banner build
.DEFAULT_GOAL:= banner
.SILENT: build

define HEADER

⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠁⣀⠈⢻⣿⣿⠿⠿⣿⣿⣿⠁⣀⠈⢻⡟⢀⣀⠙⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣄⠈⣠⣼⣿⡇⠠⡄⠈⣿⣿⣄⠀⣠⣼⣧⡀⠁⣤⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⣿⣿⣿⣧⡄⢠⣴⣿⣿⠋⢀⣿⣿⣿⠃⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⠈⢻⣿⣿⡇⢸⣿⣿⡇⢠⣾⣿⡟⠉⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⢸⣿⣿⡇⢸⣿⣿⡇⢸⣿⣿⡇⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⡿⠿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⠿⠀⠄⠸⠇⠀⠀⠸⠇⠀⠀⠸⠇⠠⠀⠿⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⢿⣿⣿⣿⣿
⣿⣿⣿⣿⠁⢠⡄⠈⠛⠛⠛⠿⣿⣿⣿⡇⢰⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⡆⢸⣿⣿⣿⣿⠟⠛⠛⠛⠀⢠⠀⢹⣿⣿⣿
⣿⣿⣿⣿⣧⣄⣀⣼⣿⣿⣶⣄⣀⣉⠀⠄⢸⣿⠀⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⣤⠀⣿⡇⠠⠀⣉⣁⣀⣤⣾⣿⣿⣤⣀⣤⣾⣿⣿⣿
⣿⣿⣿⡿⠟⠛⠿⣿⣿⣿⣿⣿⣿⣿⠶⠆⢸⣿⠀⣿⣿⣿⣿⣿⣿⣿⣿⠿⠋⣻⣿⠀⣿⡇⠰⠶⣿⣿⣿⣿⣿⣿⣿⠿⠛⠻⢿⣿⣿⣿
⣿⣿⣿⡇⠀⠂⠀⣉⣉⣉⣉⣉⣉⣉⠀⠀⢸⣿⠀⣿⣿⣿⣿⠟⠁⠝⠋⣠⣼⣿⣿⠀⣿⡇⠀⠀⣉⣉⣉⣉⣉⣉⣉⠀⠒⠀⢸⣿⣿⣿
⣿⣿⣿⣿⣦⣤⣾⠛⠛⠻⣿⣿⣿⣿⠶⠆⢸⣿⠀⣿⣿⠟⠁⠄⠊⣠⣴⣿⣿⣿⣿⠀⣿⡇⠰⠶⣿⣿⣿⡿⠛⠛⠻⣶⣤⣶⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣇⠀⠒⠀⣈⣉⣉⣉⠀⠀⢸⣿⠀⣟⠁⣠⣾⣤⣴⣿⣿⣿⣿⣿⣿⠀⣿⡇⠀⠀⣉⣉⣉⡁⠀⠒⠀⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⠶⠆⢸⣿⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⣿⡇⠰⠶⣿⣿⣿⣿⣶⣶⣶⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⡟⠉⠉⠙⣿⣿⡿⠋⠉⣉⣉⠀⠂⢸⣿⠀⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠀⣿⡇⠐⠀⣉⣉⡉⠙⢿⣿⣿⠉⠉⠉⢻⣿⣿⣿
⣿⣿⣿⣇⠀⠁⢀⣤⣤⣤⣴⣿⣿⣿⣿⡇⠸⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠿⠇⢸⣿⣿⣿⣿⣧⣤⣤⣤⠀⠉⠀⣸⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣶⠀⠂⢰⡆⠀⠀⢰⡆⠀⠀⢰⡆⠐⠀⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇⢸⣿⣿⡇⢸⣿⣿⡇⢸⣿⣿⡇⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⢀⣼⣿⣿⠇⢸⣿⣿⡇⢸⣿⣿⣇⠈⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠁⢠⣿⣿⣿⠃⢠⣾⣿⡿⠃⠘⢿⣿⣿⣷⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠀⠘⢿⡿⠛⠀⠛⣿⣿⠀⠰⠀⢸⣿⡿⠛⠀⠛⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡀⠘⠀⣸⣇⠀⠂⠀⣿⣿⣷⣶⣶⣾⣿⣇⠀⠃⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣾⣿⣿⣷⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿

[zx-uvc/wrapper]
usage:
  make init
  make build
  make clean

endef
export HEADER
export MAKEFLAGS=--no-print-directory

init:
	(exec ./scripts/setup.sh)
build:
	(exec ./scripts/build.sh)

clean:
	(exec ./scripts/clean.sh)
    
help:banner
	@LC_ALL=C make -pRrq -f $(lastword $(MAKEFILE_LIST)) : 2>/dev/null | awk -v RS= -F: '/(^|\n)# Files(\n|$$)/,/(^|\n)# Finished Make data base/ {if ($$1 !~ "^[#.]") {print "make ",$$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$'

#
# INDOCK: build in docker
#
indock:
	@echo action /mnt/c/Users/Mikhail.Kargapolcev/Documents/Speccy/mlbm $(filter-out $@,$(MAKECMDGOALS)) &&	docker run -it --rm -w /mnt/c/Users/Mikhail.Kargapolcev/Documents/Speccy/mlbm -v /mnt/c/Users/Mikhail.Kargapolcev/Documents/Speccy/mlbm:/mnt/c/Users/Mikhail.Kargapolcev/Documents/Speccy/mlbm yocto/dunffel:last /bin/sh -c "./configure && make && exit"

_upload:
	@echo action /mnt/c/Users/Mikhail.Kargapolcev/Documents/Speccy/mlbm $(filter-out $@,$(MAKECMDGOALS)) &&	scp ./deploy/*.img user@localhost:/tmp/

gitsync:
	@echo "dummy: gitsync"
banner:
	@echo "$${HEADER}"

_init_:
	@echo "dummy: _init_"

# arg pass jammer
%:;     # thanks to chakrit
#@:;    # thanks to William Purse
