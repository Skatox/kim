#!/bin/bash
#
# This file is part of Kde Image Menu for Plasma 6 (KIM6). KIM6 is a fork 
# from KIM which was created by Charles Bouveyron <charles.bouveyron@free.fr>.
# 
# KIM6 is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# any later version.
# 
# KIM6 is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with Foobar; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA

detect_prefix() {
    # 1. Honor explicit overrides
    if [ -n "$KIM_PREFIX" ]; then
        echo "$KIM_PREFIX"
        return 0
    fi

    if [ -n "$KDE_INSTALL_PREFIX" ]; then
        echo "$KDE_INSTALL_PREFIX"
        return 0
    fi

    # 2. Try qmake6 if available
    if command -v qmake6 >/dev/null 2>&1; then
        qmake6 -query QT_INSTALL_PREFIX 2>/dev/null && return 0
    fi

    # 3. Try qtpaths6 or qtpaths as a fallback
    if command -v qtpaths6 >/dev/null 2>&1; then
        # Example: GenericDataLocation -> /usr/share, take parent
        datadir=$(qtpaths6 --paths GenericDataLocation 2>/dev/null | head -n1)
        if [ -n "$datadir" ]; then
            echo "${datadir%/share}"
            return 0
        fi
    fi

    if command -v qtpaths >/dev/null 2>&1; then
        datadir=$(qtpaths --paths GenericDataLocation 2>/dev/null | head -n1)
        if [ -n "$datadir" ]; then
            echo "${datadir%/share}"
            return 0
        fi
    fi

    # 4. Last resort: assume /usr
    echo "/usr"
    return 0
}

kdeinstdir=$(detect_prefix)

cp src/kim*.desktop $kdeinstdir/share/kio/servicemenus
cp src/bin/kim* $kdeinstdir/bin/
chmod a+rx $kdeinstdir/bin/kim*
chmod a+r $kdeinstdir/share/kio/servicemenus/kim*.desktop

mkdir -p $kdeinstdir/share/apps/kim
cp language/kim.pot $kdeinstdir/share/apps/kim/
cp -Rf language/locale/* $kdeinstdir/share/locale/

cp -Rf src/slideshow $kdeinstdir/share/apps/kim/
cp -Rf src/gallery $kdeinstdir/share/apps/kim/

mkdir -p $kdeinstdir/share/doc/kim
cp AUTHORS $kdeinstdir/share/doc/kim/
cp INSTALL $kdeinstdir/share/doc/kim/
cp COPYING $kdeinstdir/share/doc/kim/
cp ChangeLog $kdeinstdir/share/doc/kim/
cp README.md $kdeinstdir/share/doc/kim/


echo "KIM6 has been installed. Good bye."
