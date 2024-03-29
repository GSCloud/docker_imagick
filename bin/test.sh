#!/bin/bash
#@author Fred Brooker <git@gscloud.cz>

export PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin:/usr/local/go/bin
ABSPATH=$(readlink -f $0)
ABSDIR=$(dirname $ABSPATH)

. $ABSDIR/_includes.sh

command -v docker >/dev/null 2>&1 || fail "Docker is NOT installed!"

if [ ! -n $(id -Gn "$(whoami)" | grep -c "docker") ]
    then if [ "$(id -u)" != "0" ]; then fail "Add yourself to the 'docker' group or run this script as root!"; fi
fi

if [ ! -r ".env" ]; then fail "Missing .env file!"; fi
source .env

if [ -z "$TAG" ]; then fail "Missing TAG definition!"; fi

info "Imagick version"
docker run -v "$PWD":/tmp -w /tmp $TAG convert -version

exit 0
