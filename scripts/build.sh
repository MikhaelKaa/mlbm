#! /usr/bin/env bash

# sjasmplus из setup.sh: /opt/sjasmplus (root) или ~/.local/sjasmplus.
export PATH="/opt/sjasmplus/bin:$HOME/.local/sjasmplus/bin:$PATH"

### Сборка ресурсов.
cd ./assets
make assets; cd ..

### Сборка ядра и trd.
cd ./src
make; cd ..