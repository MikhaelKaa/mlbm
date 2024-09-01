#! /usr/bin/env bash
echo "Проверка установленного ПО для сборки"

# Проверяем установлен ли sjasmplus.
SJASMPLUS=`which sjasmplus` 
if [ -n "$SJASMPLUS" ]      # Проверяем что строка не пуста.
then
   echo "sjasmplus installed"
else
   echo "sjasmplus not installed"
   echo "https://github.com/z00m128/sjasmplus/blob/master/INSTALL.md"
   git clone --recursive -j8 https://github.com/z00m128/sjasmplus.git
   cd sjasmplus
   make
   sudo make install
   cd ..
fi

# Проверяем установлен ли ffmpeg.
FFMPEG=`which ffmpeg`   
if [ -n "$FFMPEG" ] 
then
   echo "ffmpeg installed" 
else
   echo "ffmpeg not installed"
   sudo apt install ffmpeg
fi

# Проверяем установлен собран ли custom_converter.   
if [ -f ./tools/custom_converter/build/convert ]
then
   echo "custom converter is build" 
else
   echo "custom converter not build"
   cd ./tools/custom_converter/; make; cd ../..
fi

# Проверяем установлен собран ли mctrd.   
if [ -f ./tools/mctrd/build/mctrd ]
then
   echo "mctrd is build" 
else
   echo "mctrd not build"
   cd ./tools/mctrd/; make; cd ../..
fi

# Проверяем установлен собран ли пакер zx0.   
if [ -f ./tools/zx0/build/zx0 ]
then
   echo "zx0 packer is build" 
else
   echo "zx0 packer not build"
   cd ./tools/zx0/; make; cd ../..
fi
