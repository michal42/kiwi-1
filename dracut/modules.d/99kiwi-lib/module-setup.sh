#!/bin/bash

# called by dracut
check() {
    return 0
}

# called by dracut
depends() {
    echo udev-rules
    return 0
}

# called by dracut
install() {
    inst_multiple \
        blkid parted dd mkdir grep fdasd cut tail head tr bc \
        btrfs xfs_growfs resize2fs \
        e2fsck btrfsck xfs_repair \
        fbiterm
    inst_simple \
        "$moddir/kiwi-lib.sh" "/lib/kiwi-lib.sh"
    inst_simple \
        "$moddir/kiwi-partitions-lib.sh" "/lib/kiwi-partitions-lib.sh"
    inst_simple \
        "$moddir/kiwi-filesystem-lib.sh" "/lib/kiwi-filesystem-lib.sh"
    inst_simple \
        "$moddir/kiwi-dialog-lib.sh" "/lib/kiwi-dialog-lib.sh"
    inst_simple \
        "$moddir/kiwi-mdraid-lib.sh" "/lib/kiwi-mdraid-lib.sh"
    inst_simple \
        "$moddir/kiwi-lvm-lib.sh" "/lib/kiwi-lvm-lib.sh"
    inst_simple \
        "$moddir/kiwi-luks-lib.sh" "/lib/kiwi-luks-lib.sh"
    inst_simple \
        "/usr/share/fbiterm/fonts/b16.pcf.gz" "/lib/b16.pcf.gz"
}