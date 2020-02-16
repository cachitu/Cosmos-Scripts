VP=1
while true
do
last_block=`gaiacli status | jq '.sync_info.latest_block_height'`
curl localhost:26657/validators?height=$last_block | jq '.result.validators' > validators.json
VP=`cat validators.json | jq ' .[] | select(.address=="D43F2F5CF003859AB7319A1C760AA6A05572B214").voting_power | tonumber'`
echo "Voting power: "$VP
if [ $VP -gt 0 ]
then
echo "good: we have voting power: "$VP
else
echo "bad: no voting power"
fi
sleep 15
done
