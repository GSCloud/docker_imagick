#@author Fred Brooker <git@gscloud.cz>
FROM ubuntu:latest
LABEL version=latest
LABEL description="ImageMagick is a free and open-source cross-platform software suite for displaying, creating, converting, modifying, and editing raster images."
LABEL maintainer="Fred Brooker <git@gscloud.cz>"
RUN apt-get update -yq
RUN apt-get install imagemagick -yq
CMD ["/usr/bin/convert"]
