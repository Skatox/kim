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

kdeinstdir=`qmake -query QT_INSTALL_PREFIX`

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
