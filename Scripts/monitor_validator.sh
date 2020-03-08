VP=1
ERCOUNT=0
while true
do
last_block=`gaiacli status | jq '.sync_info.latest_block_height'`
curl -s localhost:26657/validators?height=$last_block | jq '.result.validators' > validators.json
VP=`cat validators.json | jq ' .[] | select(.address=="BF4CB4D59D19D451CF5E7BC49349DF4AA222D78B").voting_power | tonumber'`
CS=`curl localhost:26657/dump_consensus_state -s | grep BF4CB4D59D19 | wc -l`
if [ $VP -gt 0 ] && [ $CS -gt 2 ]
then
ERCOUNT=0
else
echo "Bad: no voting power or cs count. Err count: $ERRCOUNT"
if [ $ERCOUNT -gt 2 ]
then
echo "Send alert. Err count: $ERCOUNT"
/home/kytzu/telegram.sh "No voting power for gaiad mainnet kytzu at block $last_block. Error count: $ERCOUNT"
ERCOUNT=$((ERCOUNT+1))
else
echo "Increase ercount: $ERCOUNT"
ERCOUNT=$((ERCOUNT+1))
fi
fi
sleep 8
done
