# We only allow compilation on linux!
ifneq ($(shell uname), Linux)
$(error OS must be Linux!)
endif

.PHONY: assets
assets:
	mkdir -p mlbm
	../tools/custom_converter/build/convert sample.wav mlbm/sample.raw
	cd mlbm; split -b 16384 -d sample.raw -a 3
	rm mlbm/sample.raw
	cd mlbm; mv x000 x0000000.C
	cd mlbm; mv x001 x0000001.C
	cd mlbm; mv x002 x0000002.C
	cd mlbm; mv x003 x0000003.C
	cd mlbm; mv x004 x0000004.C
	cd mlbm; mv x005 x0000005.C
	cd mlbm; mv x006 x0000006.C
	cd mlbm; mv x007 x0000007.C
	cd mlbm; mv x008 x0000008.C
	cd mlbm; mv x009 x0000009.C
	cd mlbm; mv x010 x0000010.C
	rm -f mlbmscr0.C.zx0
	../tools/zx0/build/zx0 mlbmscr0.C
	mv mlbmscr0.C.zx0 mlbm/mlbmszx0.C

compress:
	$(foreach file, $(wildcard ./mlbm/x???), ../tools/zx0/build/zx0 $(file);)
	
clean:
	# Remove everything except source files
	rm -f -r mlbm
