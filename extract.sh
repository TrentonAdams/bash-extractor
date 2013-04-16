#!/bin/bash
# 
# This file is part of the bash-extractor.
# 
# Copyright Trenton D. Adams <trenton daught d daught adams at gmail daught com>
# 
# bash-extractor is free software: you can redistribute it and/or modify it under
# the terms of the GNU Lesser General Public License as published by the
# Free Software Foundation, either version 3 of the License, or (at your
# option) any later version.
# 
# bash-extractor is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser General Public
# License for more details.
# 
# You should have received a copy of the GNU Lesser General Public 
# License along with bash-extractor.  If not, see <http://www.gnu.org/licenses/>.
# 
# See the COPYING file for more information.
#
#
echo "Extracting file into /var/tmp/"
# searches for the line number where finish the script and start the tar.gz
#skip=`awk '/^__TARFILE_FOLLOWS__/ { print NR + 1; exit 0; }' $0`
skip=$(sed -n '/__TARFILE_FOLLOWS__/=' $0 | tail -1)
skip=$((($skip + 1)))
destination="$(mktemp -d /var/tmp/XXX)"

#remember our file name
this=`pwd`/$0
# take the tarfile and pipe it into tar
tail -n +$skip $this | tar -xvz -C "$destination"
# Any script here will happen after the tar file extract.
echo "Finished, extracted to $destination"
exit 0
