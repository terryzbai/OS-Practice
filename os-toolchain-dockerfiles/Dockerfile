# Start with a Debian base image
FROM debian:bullseye

# Avoid prompts from apt during build
ENV DEBIAN_FRONTEND=noninteractive

# Update system and install cross-compilation toolchain and other essential tools
RUN apt-get update && apt-get install -y \
    crossbuild-essential-armhf \
    gcc-arm-linux-gnueabihf \
    g++-arm-linux-gnueabihf \
    binutils-arm-linux-gnueabihf \
    gdb-arm-none-eabi \
    make \
    cmake \
    git \
    nasm \
    qemu-kvm qemu-system qemu-utils python3 python3-pip libvirt-clients libvirt-daemon-system bridge-utils virtinst libvirt-daemon virt-manager \
    --no-install-recommends \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set up the working directory (optional)
WORKDIR /host

# Default command on container start
CMD [ "/bin/bash" ]