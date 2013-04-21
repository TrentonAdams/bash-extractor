#!/bin/bash

install -m 755 -D "gen-extractor.sh" "/usr/local/share/bash-extractor/gen-extractor.sh"
install -m 644 -D "footer" "/usr/local/share/bash-extractor/footer"
install -m 755 -D "extract.sh" "/usr/local/share/bash-extractor/extract.sh"

ln -f -s "/usr/local/share/bash-extractor/gen-extractor.sh" /usr/local/bin

