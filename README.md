# mlbm
Простая демо программа для ZX Pentagon с расширением памяти 1024К (для демо нужно 256кб) и ZS Scorpion 256.

Вывод звука идет в порт Covox 0xfb и через NeoGS или ZX- MultiSound.

Для классическо GS сборки пока нет.

Для сборки проекта необходим Linux или WSL(Ubuntu).



Склонируйте репозитарий:

git clone https://github.com/MikhaelKaa/mlbm.git

Выполните в директории репозитария:

sudo ./configure

make init (утановит sjasmplus и ffmpeg, соберет вспомогательные утилиты для сборки)

make build

собранный trd файл будет находится в ./player/build/