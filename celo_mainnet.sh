LAST_BLOCK=1
while true
do
PREV_BLOCK=$LAST_BLOCK
LAST_BLOCK=`docker logs --since 5m celo-validator 2>&1 | grep "Imported new chain segment" | tail -1 | awk '{print $12}'  | grep -Eo "[[:digit:]]+" | tail -1`
echo "Last Block"
echo $LAST_BLOCK
echo "Prev block"
echo $PREV_BLOCK
if [ $LAST_BLOCK -gt $PREV_BLOCK ]
then
echo "good"
else
echo "bad"
#/home/celo/telegram_alert.sh $LAST_BLOCK
fi
sleep 30
done
