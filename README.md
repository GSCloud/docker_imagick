# Image Magic

DockerHub: [https://hub.docker.com/r/gscloudcz/imagick]  
GitHub: [https://github.com/GSCloud/docker_imagick]  
BitBucket: [https://bitbucket.org/gscloud/docker_imagick]

## What is imagick

ImageMagick is a free and open-source cross-platform software suite for displaying, creating, converting, modifying, and editing raster images. Created in 1987 by John Cristy, it can read and write over 200 image file formats. It and its components are widely used in open-source applications.

## Usage

* **make** - CLI help
* 🆘 make build - rebuild image
* 🆘 make docs - rebuild documentation
* 🆘 make test - test image

## Configuration

* **.env**

## Run

* `docker run --rm --name imagick gscloudcz/imagick convert`

## Example

* creating website favicons from JPEG source **example/**
* `docker run -v "$PWD":/tmp -w /tmp gscloudcz/imagick convert -flatten -background none -resize 16x16 input.jpg favicon-16.png`

Author: Fred Brooker 💌 <git@gscloud.cz>
