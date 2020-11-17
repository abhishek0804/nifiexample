#!/bin/bash

## Taking out the server ip from config file ##
source config.properties

## get the process group id from NiFi##
groupid=$(curl -i -k -u $user:$pass -s  https://$baseurl/gateway/platform/nifi-app/nifi-api/flow/process-groups/root/status?recursive=true | grep -Po '"id":.*?[^\\]",' |awk -F" " '!_[$1]'| sed -e 's/\(^.*:"\)\(.*\)\(",.*$\)/\2/' | head -1)

echo $groupid
## Changing the template according to config file and changed groupId value###
java -jar Axml_parser.jar config.properties flow.xml $groupid

## Uploading the template to nifi ###
curl -i -k -u $user:$pass -F template=@flow.xml -X POST  https://$baseurl/gateway/platform/nifi-app/nifi-api/process-groups/$groupid/templates/upload



## Importing the template to Nifi ###
## getting the Template id for newly uploaded template ##
template=$(curl -s https://$baseurl/gateway/platform/nifi-app/nifi-api/flow/templates | grep -Po '"id":.*?[^\\]",' |awk -F" " '!_[$1]++' | sed -e 's/\(^.*:"\)\(.*\)\(",.*$\)/\2/')

## Import the template now ##
curl -i -k -u $user:$pass -X POST -H 'Content-Type:application/json' -d '{"originX": 2.0,"originY": 3.0,"templateId": "'"$template"'"}' https://$baseurl/nifi-api/process-groups/$groupid/template-instance

## Running the template ##
curl https://$baseurl/gateway/platform/nifi-app/nifi-api/flow/process-groups/$groupid -X PUT -H 'Accept-Encoding: gzip, deflate, sdch, br' -H 'Content-Type: application/json' -H 'Accept: application/json, text/javascript, */*; q=0.01' -H 'Referer: https://$baseUrl/nifi/' -H 'X-Requested-With: XMLhttpsRequest' -H 'Connection: keep-alive' --data-binary '{"id":"'"$groupid"'","state":"RUNNING"}' --compressed

