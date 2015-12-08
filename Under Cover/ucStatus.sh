#!/bin/bash

hiddenStatus=$(/usr/libexec/PlistBuddy -c "Print :com.orbicule.uc:Hide" /private/var/db/locationd/clients.plist)
locationStatus=$(/usr/libexec/PlistBuddy -c "Print :com.orbicule.uc:Authorized" /private/var/db/locationd/clients.plist)
UCAStatus=$(sqlite3 /Library/Application\ Support/com.apple.TCC/TCC.db "select exists(select allowed from access where access.client = 'com.orbicule.UCAgent')";)

#make the results pretty
if [[ "$hiddenStatus" == "1" ]]; then
	returnHidden="Hidden"
elif [ "$hiddenStatus" != "1" ]]; then
	returnHidden="Not Hidden"
fi

if [[ "$locationStatus" == "true" ]]; then
	returnLoc="Enabled"
elif [[ "$locationStatus" == "false" ]]; then
	returnLoc="Disabled"
elif [[ "$locationStatus" == 'Print: Entry, ":com.orbicule.uc:Authorized", Does Not Exist' ]]; then
	echo "Created entry"
	/usr/libexec/PlistBuddy -c "Add :com.orbicule.uc:Authorized bool true" /private/var/db/locationd/clients.plist
	returnLoc="Enabled"
fi

if [[ "$UCAStatus" == "1" ]]; then
	returnAccess="Enabled"
elif [[ "$UCAStatus" == "0" ]];then
	returnAccess="Disabled"
else
	returnAccess="Unknown"
fi

echo "<result>Hidden Status: $returnHidden"
echo "Location Status: $returnLoc"
echo "Accessibility: $returnAccess</result>"