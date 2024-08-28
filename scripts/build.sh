#! /usr/bin/env bash

### Сборка ресурсов.
cd ./assets
make assets; cd ..

### Сборка плеера и trd.
cd ./player
make; cd ..
