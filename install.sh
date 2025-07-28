#!/bin/bash
#
# This file is part of Kde Image Menu (KIM). KIM was created by
# Charles Bouveyron <charles.bouveyron@free.fr>.
# 
# KIM is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# any later version.
# 
# KIM is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with Foobar; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA

kdeinstdir=`kde4-config --prefix`

cp src/kim*.desktop $kdeinstdir/share/kde4/services/
cp src/bin/kim* $kdeinstdir/bin/
chmod a+rx $kdeinstdir/bin/kim*
chmod a+r $kdeinstdir/share/kde4/services/kim*.desktop

mkdir $kdeinstdir/share/apps/kim
cp language/kim.pot $kdeinstdir/share/apps/kim/
cp -Rf language/locale/* /usr/share/locale/

cp -Rf src/slideshow $kdeinstdir/share/apps/kim/
cp src/galery $kdeinstdir/share/apps/kim/

mkdir /usr/share/doc/kim
cp AUTHORS /usr/share/doc/kim/
cp INSTALL /usr/share/doc/kim/
cp COPYING /usr/share/doc/kim/
cp ChangeLog /usr/share/doc/kim/
cp README /usr/share/doc/kim/


echo "Installation completed. Good bye."