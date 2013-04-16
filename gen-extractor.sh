# additional script to be run
name="$1"
script="$2"

cat extract.sh footer "${name}" > "${name}-extract.sh"
chmod a+x "${name}-extract.sh"
