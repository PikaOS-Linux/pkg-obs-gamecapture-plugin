#! /bin/bash
set -e

# Clone Upstream
git clone https://github.com/nowrep/obs-vkcapture -b v1.4.9
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
