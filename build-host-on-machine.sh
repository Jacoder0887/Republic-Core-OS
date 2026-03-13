#!/usr/bin/env bash

docker exec -i gcc-cross-compiler ./build.sh    

qemu-system-i386 -cdrom myos.iso -monitor stdio -d cpu_reset -no-reboot \
-vga std \
-display gtk,zoom-to-fit=on