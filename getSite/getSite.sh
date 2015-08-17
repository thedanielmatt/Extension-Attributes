#!/bin/bash
# For use with Casper Suite as an extension attribute to be able to search and scope based on Site.
# e.g. To find which devices are not assigned to a Site.

jssURL="<http://host.domain.tld:8443"
outputFile="/tmp/computerRecord.xml"
reportUser="<api user>"
reportPass="<api user password>"

#grab the serial number of the device
serial=$(ioreg -c "IOPlatformExpertDevice" | awk -F '"' '/IOPlatformSerialNumber/ {print $4}')

#Query the JSS for the serial number's inventory report
curl -s "$jssURL"/JSSResource/computers/serialnumber/"$serial" --user "$reportUser:$reportPass" > "$outputFile"

#parse the xml for the key we need
xmllint -format "$outputFile" -output "$outputFile"
serialSite=$(xmllint $outputFile --xpath /computer/general/site/name |  grep "<name>")

#clean up result string to remove XML tag
serialSite=${serialSite#<name>}
serialSite=${serialSite%<\/name>}

#return the result in JSS extension attribute format
echo "<result>$serialSite</result>"
