curl -X POST https://api.twilio.com/2010-04-01/Accounts/<ACCOUNBT_SID>/Messages.json \
--data-urlencode "From=whatsapp:<WATSAPP_SANDBOX_NB>" \
--data-urlencode "Body=$1" \
--data-urlencode "To=whatsapp:<WATSAPP_NB>" \
-u <ACCOUNBT_SID>:<AUTH_TOKEN>
