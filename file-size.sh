
TOTALBLOCKS=$(du -cks * | tail -1 | cut -f 1)
echo "There are ${TOTALBLOCKS}kb worth of files"


