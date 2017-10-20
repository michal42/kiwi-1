#!/bin/bash

# called by dracut
depends() {
    echo rootfs-block dm kiwi-lib
    return 0
}

# called by dracut
installkernel() {
    instmods squashfs loop overlay
}

# called by dracut
install() {
    inst_hook pre-mount 20 "$moddir/kiwi-repart-disk.sh"
    dracut_need_initqueue
}