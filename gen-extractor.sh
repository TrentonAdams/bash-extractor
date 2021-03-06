# !/bin/bash
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
# additional script to be run
name="$1"
script="$2"
sourcedir="$(dirname $(readlink -f "$0"))"

exit_code=0;

echo -n '' > "${name}.sh"
for sh in "$sourcedir/extract.sh" "$script" "$sourcedir/footer" "${name}"; do 
  if [ "$sh" != "" ]; then
    /bin/cat "$sh" >> "${name}.sh";
    exit_code=$(($exit_code + $?))
  fi;
done;
chmod a+x "${name}.sh"
exit_code=$(($exit_code + $?))
echo "File created: ${name}.sh"

exit $exit_code;
