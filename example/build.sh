#!/bin/bash

command -v docker >/dev/null 2>&1 || { echo "Docker is NOT installed!"; exit;}

IMAGE="logo.jpg"
OUTPUT="."

if [ -f $IMAGE ]; then
  SIZES=(16 24 29 32 40 48 57 58 60 64 70 72 76 80 87 96 114 120 128 144 150 152 167 180 192 196 256 310 320 512)
  for size in ${SIZES[@]}; do
    docker run -v "$PWD":/tmp -w /tmp gscloudcz/imagick convert -flatten -background none -resize ${size}x${size} $IMAGE $OUTPUT/favicon-${size}.png
    if [ -f favicon-${size}.png ]; then
      echo -ne "\e[0mconverting square: \e[92m$size px\e[0m\033[0K\r"
    else
      echo "ERROR: Could not process input file $IMAGE" >&2
      exit 1
    fi
  done
else
  echo "ERROR: Input file $IMAGE does not exist." >&2
  exit 1
fi
