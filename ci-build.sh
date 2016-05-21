#!/bin/bash

# Configure
cd "$(dirname "$0")"
source 'ci-library.sh'
git_config user.email 'ci@msys2.org'
git_config user.name  'MSYS2 Continuous Integration'
git remote add upstream 'https://github.com/Alexpux/MINGW-packages'
git fetch --quiet upstream


# Build
execute 'Upgrading the system' pacman --noconfirm --noprogressbar --sync --refresh --refresh --sysupgrade --sysupgrade
package="mingw-w64-firefox"
execute 'Building binary' makepkg-mingw --noconfirm --noprogressbar --skippgpcheck --nocheck --syncdeps --rmdeps --cleanbuild
execute 'Building source' makepkg --noconfirm --noprogressbar --skippgpcheck --allsource --config '/etc/makepkg_mingw64.conf'

