#!/bin/sh
EXTPATH=/home/jiang//work/lede-openwrt7621/
$EXTPATH/staging_dir/host/bin/mksquashfs4 squashfs-root root.squashfs -nopad -noappend -root-owned -comp xz -Xpreset 9 -Xe -Xlc 0 -Xlp 2 -Xpb 2  -b 256k -p '/dev d 755 0 0' -p '/dev/console c 600 0 0 5 1' -processors 1
test -f pifii-rom.bin && rm -rf pifii-rom.bin
cat kernel.bin root.squashfs > pifii-rom.bin
$EXTPATH/staging_dir/host/bin/padjffs2 pifii-rom.bin

