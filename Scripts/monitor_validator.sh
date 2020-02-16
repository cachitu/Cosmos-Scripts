VP=1
while true
do
last_block=`gaiacli status | jq '.sync_info.latest_block_height'`
curl localhost:26657/validators?height=$last_block | jq '.result.validators' > validators.json
VP=`cat validators.json | jq ' .[] | select(.address=="2B89383448ACC1DD6B870385C16342F0F3950C31").voting_power | tonumber'`
CS=`curl localhost:26657/dump_consensus_state -s | grep 2B89383448AC | wc -l`
echo "Consenus count: $CS, Voting power: "$VP
if [ $VP -gt 0 ] && [ $CS -gt 2 ]
then
echo "good: at block $last_block we have voting power: "$VP
else
echo "bad: no voting power or cs count"
/home/test/telegram.sh "No voting power for gaiad testnet at block $last_block"
fi
sleep 15
done
