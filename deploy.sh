#!/bin/bash

cd "$(dirname "$0")"
export PATH=$PATH:/snap/bin:/usr/local/go/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

command -v docker >/dev/null 2>&1 || {
    echo -en "\nDocker is NOT installed!\n\n"
    exit 1
}

docker rm searx --force
docker run -d -p 8888:8888 --restart unless-stopped --name searx gscloudcz/searx
