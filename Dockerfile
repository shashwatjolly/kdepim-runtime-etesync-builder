# cd into the source code dir for kdepim-runtime-etesync-20.08
# docker run --rm -v $(pwd):/kdepim-runtime-etesync-20.08 debian-sid-kde-libetebase  /kdepim-runtime-etesync-20.08/build/build-kdepim-runtime-etesync.sh

FROM debian:sid

ARG DEBIAN_FRONTEND=noninteractive

RUN set -ex \
    && grep '^deb ' /etc/apt/sources.list | perl -pe 's/deb /deb-src /' >> /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
               build-essential \
               cdbs \
               devscripts \
               equivs \
               fakeroot \
    && useradd shashwat \
    && groupadd docker

RUN apt-get install -y --no-install-recommends libssl-dev cargo

RUN apt build-dep -y kdepim-runtime

RUN apt-get install -y cmake checkinstall

COPY libetebase_0.3.1.deb /

RUN dpkg -i libetebase_0.3.1.deb

