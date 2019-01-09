#!/bin/sh
sudo echo "Starting..."
MKSQSHFS4='./bin/mksquashfs4'
PADJFFS2='./bin/padjffs2'
offset1=`grep -oba hsqs $1 | grep -oP '[0-9]*(?=:hsqs)'`
offset2=`wc -c $1 | grep -oP '[0-9]*(?= )'`
size2=`expr $offset2 - $offset1`
#echo $offset1 " " $offset2 " " $size2
dd if=$1 of=kernel.bin bs=1 ibs=1 count=$offset1
dd if=$1 of=secondchunk.bin bs=1 ibs=1 count=$size2 skip=$offset1
sudo unsquashfs secondchunk.bin 

