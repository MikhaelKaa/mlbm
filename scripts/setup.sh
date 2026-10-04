#! /usr/bin/env bash
# Установка зависимостей сборки.
# sjasmplus ставится в /opt/sjasmplus (или ~/.local/sjasmplus без sudo).
# Исходники кэшируются в $HOME/.cache, чтобы не клонировать/собирать заново (GitHub Actions cache).

SJASMPLUS_VERSION=${SJASMPLUS_VERSION:-v1.24.0}
SJASMPLUS_SRC_DIR="${SJASMPLUS_SRC_DIR:-$HOME/.cache/sjasmplus-$SJASMPLUS_VERSION}"

echo "Проверка установленного ПО для сборки"

# --- sjasmplus ---------------------------------------------------------------
sjasm_in_path() {
    local p
    for p in /opt/sjasmplus/bin "$HOME/.local/sjasmplus/bin"; do
        if [ -x "$p/sjasmplus" ]; then
            echo "$p"
            return 0
        fi
    done
    if command -v sjasmplus >/dev/null; then
        echo "system"
        return 0
    fi
    return 1
}

if SJASM_BIN_DIR=$(sjasm_in_path); then
   echo "sjasmplus installed: $SJASM_BIN_DIR"
else
   echo "sjasmplus not installed, building $SJASMPLUS_VERSION into /opt/sjasmplus"
   if [ ! -d "$SJASMPLUS_SRC_DIR" ]; then
      mkdir -p "$HOME/.cache"
      git clone --recursive --depth 1 -b "$SJASMPLUS_VERSION" \
          https://github.com/z00m128/sjasmplus.git "$SJASMPLUS_SRC_DIR"
   fi
   make -C "$SJASMPLUS_SRC_DIR" -j"$(nproc)"
   # /opt требует root; без sudo ставим в ~/.local/sjasmplus.
   if [ "$EUID" -eq 0 ] || sudo -n true; then
      sudo make -C "$SJASMPLUS_SRC_DIR" PREFIX=/opt/sjasmplus install
   else
      echo "sudo недоступен: ставлю в ~/.local/sjasmplus"
      make -C "$SJASMPLUS_SRC_DIR" PREFIX="$HOME/.local/sjasmplus" install
   fi
fi
# --- ffmpeg ------------------------------------------------------------------
if command -v ffmpeg >/dev/null; then
   echo "ffmpeg installed"
else
   sudo apt-get update && sudo apt-get install -y ffmpeg
fi
# --- тулзы проекта -----------------------------------------------------------
for tool in custom_converter mctrd zx0; do
    if [ -f "./tools/$tool/build/$(basename $tool)" ] || [ -x "./tools/$tool/build/convert" ]; then
       echo "$tool is build"
    else
       make -C "./tools/$tool"
    fi
done
