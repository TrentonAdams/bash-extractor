#!/bin/bash

# todo
# Do not require a specific type of package system.  Allow the script 
# to specify an operation instead.  However, perhaps support some 
# default operations for tar.gz.

echo "Extracting file into /var/tmp/"
# searches for the line number where finish the script and start the tar.gz
#skip=`awk '/^__TARFILE_FOLLOWS__/ { print NR + 1; exit 0; }' $0`
skip=$(sed -n '/__TARFILE_FOLLOWS__/=' $0 | tail -1)
skip=$((($skip + 1)))
destination="$(mktemp -d /var/tmp/XXX)"

#remember our file name
this=$0
# take the tarfile and pipe it into tar
tail -n +$skip $this | tar -xpz -C "$destination"
# Any script here will happen after the tar file extract.
echo "Finished, extracted to $destination"
