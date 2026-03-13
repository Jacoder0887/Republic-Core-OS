FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive
 
RUN apt-get update && apt-get install -y \
    curl \
    git \
    build-essential \
    bison \
    flex \
    libgmp3-dev \
    libmpc-dev \
    libmpfr-dev \
    texinfo \
    unzip \
    libc6-i386 \
    lib32stdc++6 \
    grub-pc-bin \
    grub-common \
    xorriso \
    mtools \
    iputils-ping \
    && rm -rf /var/lib/apt/lists/*
 
RUN curl -L https://github.com/lordmilko/i686-elf-tools/releases/download/7.1.0/i686-elf-tools-linux.zip -o /tmp/toolchain.zip \
    && unzip /tmp/toolchain.zip -d /usr/local \
    && rm /tmp/toolchain.zip
 
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --default-toolchain nightly-2021-05-10 \
    && . $HOME/.cargo/env \
    && rustup component add rust-src
 
ENV PATH="/root/.cargo/bin:/usr/local/bin:${PATH}"
 
WORKDIR /env
 
COPY . .


RUN chmod +x build.sh
RUN chmod +x build-host-on-machine.sh
RUN cargo clean
RUN ./build.sh

RUN rustup default nightly-2021-05-10