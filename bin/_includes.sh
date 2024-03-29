#@author Fred Brooker <git@gscloud.cz>
#!/bin/bash

info() {
    echo -e "\n\e[1;32m*\e[0;1m ${*}\e[0m" 1>&2
}

warn() {
    echo -e "\n\n\n\e[1;33m***\e[0;1m ${*}\e[0m" 1>&2
}

fail() {
    echo -e "\n\n\n\e[1;31m***\e[0;1m ${*}\e[0m" 1>&2
    sleep 5
    exit 1
}

function yes_or_no () {
    while true
    do
        read -p "$* [y/N]: " yn
        case $yn in
            [Yy]*) return 0 ;;
            [Nn]*) return 1 ;;
            *) return 1 ;;
        esac
    done
}
