#!/usr/bin/env bash

TOTALBLOCKS=$(du -cks ./* | tail -1 | cut -f 1)
RAWOUT=$(du -cks ./*)

# Create Array to hold all files and sizes (excluding last line)
# Push each line of output as an "object" into array

echo "There are ${TOTALBLOCKS}kb worth of files"
echo "${RAWOUT}"

DATAMASH=($RAWOUT)
echo ${DATAMASH[2]}

# Iterate over array / 2
# for each i, print i*2 (file size), i*2 + 1 (file name)
echo "length"
length=$(expr ${#DATAMASH[@]} / 2)
echo $length

for i in $length
    do
        echo $i #${DATAMASH[i]}
    done

# ALLOUT=$(du)
# echo $ALLOUT