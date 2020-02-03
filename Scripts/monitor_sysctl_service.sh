LAST_BLOCK=1
while true
do
PREV_BLOCK=$LAST_BLOCK
LAST_BLOCK=`journalctl --unit=$1 -n 1000 --no-pager --quiet | grep Executed | tail -1 | awk '{gsub(/[^0-9. ]/,"")}1 {print $6}'`
echo "Last Block:"
echo $LAST_BLOCK
echo "Previous block:"
echo $PREV_BLOCK
if [ $LAST_BLOCK -gt $PREV_BLOCK ]
then
echo "Good. Nothing to do."
else
echo "Bad: send your alert below this line"
fi
sleep 30
done
