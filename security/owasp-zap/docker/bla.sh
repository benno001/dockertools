SESSION_DATA_KEY=$(curl -i "https://accountsng-acc.nuon.nl/iamngacc/nlb2c/oauth2/authorize?scope=openid&response_type=id_token%20token&redirect_uri=https://mijn-acc.nuon.nl&client_id=qijpqfSweOsmIW26ZC_MjfeqnvUa&nonce=pWEp-K76j1GxmM89" | grep sessionDataKey | cut -d '=' -f 11 | cut -d '&' -f 1)
echo "//////////////////SESSION_DATA_KEY/////////////////////////"
echo "///////////////////////////////////////////"
echo $SESSION_DATA_KEY
echo "///////////////////////////////////////////"
echo "///////////////////////////////////////////"

RESPONSE=$(curl -i -d "email=10253384@nuon.com&password=12345678&sessionDataKey=${SESSION_DATA_KEY}" -X POST https://accountsng-acc.nuon.nl/iamngacc/nlb2c/commonauth/)
echo "/////////////////RESPONSE//////////////////////////"
echo "///////////////////////////////////////////"
echo $RESPONSE
echo "///////////////////////////////////////////"
echo "///////////////////////////////////////////"

COMMON_AUTH_ID=$(echo $RESPONSE | grep commonAuthId | cut -d '=' -f 4| cut -d ';' -f 1)
echo "/////////////////COMMON_AUTH_ID//////////////////////////"
echo "///////////////////////////////////////////"
echo $COMMON_AUTH_ID
echo "///////////////////////////////////////////"
echo "///////////////////////////////////////////"

RESPONSE2=$(curl -i -v --cookie "commonAuthId=${COMMON_AUTH_ID}" "https://accountsng-acc.nuon.nl/iamngacc/nlb2c/oauth2/authorize?scope=openid&response_type=id_token%20token&redirect_uri=https://mijn-acc.nuon.nl&client_id=qijpqfSweOsmIW26ZC_MjfeqnvUa&nonce=BbsM-HMyq8oU4kbT")
echo "/////////////////RESPONSE2//////////////////////////"
echo "///////////////////////////////////////////"
echo $RESPONSE2
echo "///////////////////////////////////////////"
echo "///////////////////////////////////////////"

TOKEN=$(echo $RESPONSE2 | cut -d '=' -f 3| cut -d '&' -f 1)
echo "/////////////////TOKEN//////////////////////////"
echo "///////////////////////////////////////////"
echo $TOKEN
echo "///////////////////////////////////////////"
echo "///////////////////////////////////////////"
