#!/bin/bash
set -e

[[ $(id -u) -eq 0 ]] || { echo "This script must be run as root"; exit 1; }
export PATH="${PATH/\/usr\/local\/bin:/}"

cd /usr/local
rm -rf "__brcr"
mkdir "__brcr"
cd "__brcr"

curl -L -o brcr-update \
  https://raw.githubusercontent.com/moudot/brcr-update/refs/heads/master/brcr-update

curl -L -o 7z.tar.xz \
  https://github.com/ip7z/7zip/releases/download/25.01/7z2501-linux-x64.tar.xz

tar -xf 7z.tar.xz

# on utilise BIEN le binaire 7zz
install -m 755 7zzs /usr/bin/unzip
install -m 755 brcr-update /usr/bin/brcr-update

cd /
rm -rf /usr/local/__brcr

echo "Done. unzip = 7zz"
