curl -X POST https://api.twilio.com/2010-04-01/Accounts/<ACCOUNBT_SID>/Messages.json \
--data-urlencode "Body=$1" \
--data-urlencode "From=<Originating Twillio Number>" \
--data-urlencode "To=<Destination Mobile Number> \
-u <ACCOUNBT_SID>:<AUTH_TOKEN>
