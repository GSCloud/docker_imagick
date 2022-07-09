#!/bin/bash
#@author Fred Brooker <git@gscloud.cz>

export PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin:/usr/local/go/bin
dir="$(dirname "$0")"
. "$dir/_includes.sh"

command -v docker >/dev/null 2>&1 || fail "Docker is NOT installed!"

# MarkDown -> ADOC
find . -type d \( -path ./node_modules -o -path ./vendor \) -prune -false -o -iname "*.md" \
    -exec echo "Converting {} to ADOC" \; \
    -exec docker run --rm -v "$(pwd)":/data pandoc/core -f markdown -t asciidoc -i {} -o "{}.adoc" \;

# ADOC -> PDF
find . -type d \( -path ./node_modules -o -path ./vendor \) -prune -false -o -iname "*.adoc" \
    -exec echo "Converting {} to PDF" \; \
    -exec docker run --rm -v $(pwd):/documents/ asciidoctor/docker-asciidoctor:latest asciidoctor-pdf "{}" \;

exit 0
