# We only allow compilation on linux!
ifneq ($(shell uname), Linux)
$(error OS must be Linux!)
endif

MCTRD = tools/mctrd/build/mctrd

all:
	# Create build dir.
	mkdir -p build

	# app
	sjasmplus src/covox.asm --syntax=F
	mv build/covox.bin build/covox000.C
	# compile done

	rm -f build/mlbm.trd
	./$(MCTRD) new build/mlbm.trd
	./$(MCTRD) -b -a 10 add assets/boot.B build/mlbm.trd
	#./$(MCTRD) rename build/mlbm.trd boot.B boom.B
	./$(MCTRD) add build/covox000.C build/mlbm.trd
	./$(MCTRD) add assets/mlbmscr0.C build/mlbm.trd
	./$(MCTRD) add assets/mlbm/x0000000.C build/mlbm.trd
	./$(MCTRD) add assets/mlbm/x0000001.C build/mlbm.trd
	./$(MCTRD) add assets/mlbm/x0000002.C build/mlbm.trd
	./$(MCTRD) add assets/mlbm/x0000003.C build/mlbm.trd
	./$(MCTRD) add assets/mlbm/x0000004.C build/mlbm.trd
	./$(MCTRD) add assets/mlbm/x0000005.C build/mlbm.trd
	./$(MCTRD) add assets/mlbm/x0000006.C build/mlbm.trd
	./$(MCTRD) add assets/mlbm/x0000007.C build/mlbm.trd
	./$(MCTRD) add assets/mlbm/x0000008.C build/mlbm.trd
	./$(MCTRD) add assets/mlbm/x0000009.C build/mlbm.trd
	./$(MCTRD) add assets/mlbm/x0000010.C build/mlbm.trd
	

clean:
	# Remoe everything except source files
	rm -f -r build

flash_asm_app:
	PCProg.exe COM18 build/loader.bin