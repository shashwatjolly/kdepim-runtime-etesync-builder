# cd into the source code dir for kdepim-runtime with the etesync resource
# docker run --rm -v $(pwd):/code debian-sid-kde-libetebase  

FROM debian:sid

ARG DEBIAN_FRONTEND=noninteractive

RUN set -ex \
    && grep '^deb ' /etc/apt/sources.list | perl -pe 's/deb /deb-src /' >> /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
               build-essential \
               openssl  

RUN apt build-dep -y kdepim-runtime

RUN apt-get install -y cmake checkinstall

COPY libetebase_0.3.1.deb /

RUN dpkg -i libetebase_0.3.1.deb

COPY build.sh /

