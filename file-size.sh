
TOTALBLOCKS=$(du -cks * | tail -1 ) | cut -d ' ' -f 1
echo $TOTALBLOCKS


