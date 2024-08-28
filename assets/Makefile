# We only allow compilation on linux!
ifneq ($(shell uname), Linux)
$(error OS must be Linux!)
endif

convert:
	yes | ffmpeg -i Maximum_Love-Black_Magic.mp3 -ac 1 -acodec pcm_u8 -ar 12000 12000kHz_8bit.wav
	# ffmpeg -i Maximum_Love-Black_Magic.mp3 -ac 1 -acodec pcm_u8 -ar 8000 8000kHz_8bit.wav
	# ffmpeg -i Maximum_Love-Black_Magic.mp3 -ac 1 -acodec pcm_u8 -ar 6000 6000kHz_8bit.wav
	# ffmpeg -i Maximum_Love-Black_Magic.mp3 -ac 1 -acodec pcm_u8 -ar 4000 4000kHz_8bit.wav
	# ffmpeg -i Maximum_Love-Black_Magic.mp3 -c:a libopus -ac 1 -ar 16000 -b:a 16000 out.opus

assets:
	mkdir -p mlbm
	../tools/custom_converter/build/convert 12000kHz_8bit.wav mlbm/sample.raw
	cd mlbm; split -b 16384 -d sample.raw -a 3
	# rm mlbm/sample.raw
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

compress:
	$(foreach file, $(wildcard ./mlbm/x???), ../tools/zx0/build/zx0 $(file);)
	
clean:
	# Remoe everything except source files
	rm -f -r mlbm/*
