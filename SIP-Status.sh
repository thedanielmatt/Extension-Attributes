#!/bin/bash
osVersion=$(sw_vers -productVersion | awk -F. '{print $2}')
if [[ ${osVersion} -lt 11 ]]; then
  systemIntegrityProtectionStatus="N/A"
else
  systemIntegrityProtectionStatus=$(csrutil status | awk '{print $5}')
fi
printf "<result>%s</result>" "${systemIntegrityProtectionStatus%?}"