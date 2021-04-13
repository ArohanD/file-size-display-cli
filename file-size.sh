#!/usr/bin/env bash

TOTALBLOCKS=$(du -cks ./* | tail -1 | cut -f 1)
RAWOUT=( $(du -cks ./*) )
echo $RAWOUT
TERMINAL_WIDTH=$(tput cols)
BAR_SIZE=$(($TERMINAL_WIDTH*60/100))
[[ BAR_SIZE -lt 10 ]] && BAR_SIZE=10

# Create Array to hold all files and sizes (excluding last line)
# Push each line of output as an "object" into array

echo "There are ${TOTALBLOCKS}kb worth of files"

DATAMASH=($RAWOUT)

# Function def, params: file/folder size, total size
# Output string in format  "[FILE/FOLDER NAME] [[/////-----] [PERCENTAGE TAKEN]]"
create_bar () {
    local rounded_percent=$(($1 * $BAR_SIZE / $2))
    # echo "Percentage: $rounded_percent"
    local bar_string=""
    local i
    for ((i=0; i<$BAR_SIZE; i++))
        do
            # if i < rounded_percent, then character is /
            local char_for_bar=""
            [[ i -lt $rounded_percent ]] && char_for_bar='/' || char_for_bar='-'
            bar_string="$bar_string$char_for_bar"
        done
    
    echo "[$bar_string]"
}

transcribe_output () {
    # echo "File ${1:2} takes up $2 kilobytes out of $TOTALBLOCKS"
    output=$(create_bar $2 $TOTALBLOCKS)
    format_bar_size=$(($BAR_SIZE+2))
    format="%20s %${format_bar_size}s %2.2f%%\n"
    printf "$format" "${1:2}" "$output" "$(($2 * 100 / $TOTALBLOCKS))"
}

# Iterate over array / 2
# for each i, print i*2 (file size), i*2 + 1 (file name)
length=$(expr ${#DATAMASH[@]} / 2)

for ((i=0; i<$length - 1; i++))
do
    # echo ${DATAMASH[(i * 2) + 1]} 
    # echo ${DATAMASH[i * 2]}
    transcribe_output ${DATAMASH[(i * 2) + 1]} ${DATAMASH[i * 2]}
done