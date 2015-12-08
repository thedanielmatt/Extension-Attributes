#!/bin/bash

curUser=$(ls -l /dev/console | cut -d " " -f 4)
prefFile="/Library/Preferences/com.extensis.UniversalTypeClient.conf"

#UTSServerString=$(sudo -u $curUser defaults read /Users/$curUser/Library/Preferences/com.extensis.UniversalTypeClient.plist LoginDialogLastServerAddress)

if [[ -e "$prefFile" ]]; then
    UTSServerString=$(cat /Library/Preferences/com.extensis.UniversalTypeClient.conf | grep server.address | cut -d = -f 2)
    echo "<result>$UTSServerString</result>"
else
	UTSServerString=$(sudo -u $curUser defaults read /Users/$curUser/Library/Preferences/com.extensis.UniversalTypeClient.plist LoginDialogLastServerAddress)
	echo "<result>$UTSServerString</result>"
fi

exit 0