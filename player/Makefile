# We only allow compilation on linux!
ifneq ($(shell uname), Linux)
$(error OS must be WSL or Linux!)
endif

MCTRD = ../tools/mctrd/build/mctrd
ASSETS = ../assets
all:
	# Create build dir.
	mkdir -p build

	# app
	sjasmplus ./src/covox.asm --syntax=F --inc=src
	mv build/covox.bin build/covox000.C
	# compile done
	# TODO: не видно ошибки сборки

	rm -f build/mlbm.trd
	./$(MCTRD) new build/mlbm.trd
	./$(MCTRD) -b -a 10 add $(ASSETS)/boot.B build/mlbm.trd
	./$(MCTRD) add build/covox000.C build/mlbm.trd
	./$(MCTRD) add $(ASSETS)/mlbm/mlbmszx0.C build/mlbm.trd
	./$(MCTRD) add $(ASSETS)/mlbm/x0000000.C build/mlbm.trd
	./$(MCTRD) add $(ASSETS)/mlbm/x0000001.C build/mlbm.trd
	./$(MCTRD) add $(ASSETS)/mlbm/x0000002.C build/mlbm.trd
	./$(MCTRD) add $(ASSETS)/mlbm/x0000003.C build/mlbm.trd
	./$(MCTRD) add $(ASSETS)/mlbm/x0000004.C build/mlbm.trd
	./$(MCTRD) add $(ASSETS)/mlbm/x0000005.C build/mlbm.trd
	./$(MCTRD) add $(ASSETS)/mlbm/x0000006.C build/mlbm.trd
	./$(MCTRD) add $(ASSETS)/mlbm/x0000007.C build/mlbm.trd
	./$(MCTRD) add $(ASSETS)/mlbm/x0000008.C build/mlbm.trd
	./$(MCTRD) add $(ASSETS)/mlbm/x0000009.C build/mlbm.trd
	./$(MCTRD) add $(ASSETS)/mlbm/x0000010.C build/mlbm.trd
	

clean:
	# Remove everything except source files
	rm -f -r build