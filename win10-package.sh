#!/bin/bash

pacman -S git mingw-w64-x86_64-toolchain mingw-w64-x86_64-python2 mingw-w64-x86_64-python2-pip mingw-w64-x86_64-python2-numpy mingw-w64-x86_64-ffmpeg mingw-w64-x86_64-opencl-headers
echo -e "[build]\ncompiler=mingw32" > C:/msys64/mingw64/lib/python2.7/distutils/distutils.cfg  # is this needed?

build_package() {
  cd mingw-packages/$1
  makepkg-mingw -f
  pacman -U mingw-w64-x86_64-$1-*-any.pkg.tar.xz
  cd ..
}

build_package ocl-icd-git
build_package opencv2

python setup.py build
python setup.py build_exe
