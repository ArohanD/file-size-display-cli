#!/usr/bin/env bash

TOTALBLOCKS=$(du -cks ./* | tail -1 | cut -f 1)
RAWOUT=$(du -cks ./*)

# Create Array to hold all files and sizes (excluding last line)
# Push each line of output as an "object" into array

echo "There are ${TOTALBLOCKS}kb worth of files"
echo $RAWOUT

DATAMASH=($RAWOUT)

# Iterate over array / 2
# for each i, print i*2 (file size), i*2 + 1 (file name)
length=$(expr ${#DATAMASH[@]} / 2)

for ((i=0; i<$length; i++))
do
    echo ${DATAMASH[i * 2]}
    echo ${DATAMASH[(i * 2) + 1]}
done

# ALLOUT=$(du)
# echo $ALLOUT