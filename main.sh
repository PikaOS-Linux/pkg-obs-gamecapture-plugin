#! /bin/bash
set -e

# Clone Upstream
git clone https://github.com/nowrep/obs-vkcapture
cp -rvf ./debian ./obs-vkcapture/
cd ./obs-vkcapture

# Get build deps
apt-get build-dep ./ -y

# Build package
dpkg-buildpackage --no-sign

# Move the debs to output
cd ../
mkdir -p ./output
mv ./*.deb ./output/
