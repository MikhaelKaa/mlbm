# We only allow compilation on linux!
ifneq ($(shell uname), Linux)
$(error OS must be WSL or Linux!)
endif

MCTRD = ../tools/mctrd/build/mctrd
ASSETS = ../assets
all:

	# parsing assets size
	# Может можно проще? через размер файла высчитывать? Пусть пока будет так...
	rm -f build/temp.trd
	rm -f src/file_size_auto.asm
	echo "DEFAULT_SIZE EQU 64" >> src/file_size_auto.asm
	echo -n "SCREEN_SIZE EQU " >> src/file_size_auto.asm
	./$(MCTRD) new build/temp.trd
	./$(MCTRD) add $(ASSETS)/mlbm/mlbmszx0.C build/temp.trd
	./$(MCTRD) list build/temp.trd | grep mlbmszx0 | sed 's/\t/;/g' | cut -d ';' -f5 >> src/file_size_auto.asm
	echo -n "LAST_SAMPLE_SIZE EQU " >> src/file_size_auto.asm
	./$(MCTRD) add $(ASSETS)/mlbm/x0000010.C build/temp.trd
	./$(MCTRD) list build/temp.trd | grep x0000010 | sed 's/\t/;/g' | cut -d ';' -f5 >> src/file_size_auto.asm
	rm -f build/temp.trd

	# Create build dir.
	mkdir -p build

	# app
	sjasmplus ./src/covox.asm --syntax=F --inc=src && \
	mv build/covox.bin build/covox000.C
	# compile done

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