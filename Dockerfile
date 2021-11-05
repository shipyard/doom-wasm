FROM ubuntu:bionic

WORKDIR /srv

# Install system dependencies
RUN apt update -qqy && apt install -qqy \
    bash \
    python2.7 \
    python-pip \
    python3 \
    cmake \
    wget \
    libssl-dev \
    libtool \
    libsdl2-2.0 \
    libsdl2-mixer-2.0-0 \
    libsdl2-mixer-dev \
    libsdl2-net-2.0-0 \
    curl \
    gcc \
    lsb-release \
    git \
    m4 \
    autotools-dev \
    automake \
    emscripten \
    unzip

ADD . ./

# Get DOOM wad file
RUN wget https://distro.ibiblio.org/slitaz/sources/packages/d/doom1.wad && \
    mv doom1.wad ./src/

CMD cd src && python -m SimpleHTTPServer