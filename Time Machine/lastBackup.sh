#!/bin/sh

# Gather Time Machine Last Backup Status for JSS
# Written by Chad Nielsen
# Forget Computers, Get Creative!
# Last Modified on October 25th, 2013.
# Updated by Rémy Schwarz on January 22th, 2014 / Habegger AG
# Updated by Daniel Shryock on Auguest 17, 2014

# Version History
# 1.0 - original attribute by JAMF Software supporting OS X 10.8 and lower.
# 1.1 - added ability to check status in OS X 10.9 Mavericks.
# 1.2 - Optimized the Command to find the latest TimeMachine-Backup-date on OS X 10.9 Mavericks.
# 1.3 - Updated to include support for Yosemite and El Capitan

# Determine the OS Version
OS=$(sw_vers | awk '/ProductVersion/{print substr($2,1,5)}')

# Check the OS, and then check the values in the appropriate corresponding files.
if [[ "$OS" = "10.9" || "$OS" = "10.10" || "$OS" = "10.11" ]]; then
    # Check to see if autobackup is enabled.
    autoBackupEnabled=$(defaults read /Library/Preferences/com.apple.TimeMachine | awk '/AutoBackup/{print $3}' | tr -d ";")
    # A value of 1 signifies that Time Machine is on, a value of 0 is off. 
    if [ "$autoBackupEnabled" = "1" ]; then
         lastBackupTime=$(defaults read /Library/Preferences/com.apple.TimeMachine Destinations | sed -n '/SnapshotDates/,$p' | grep -e '[0-9]' | awk -F '"' '{print $2}' | sort | tail -n1 | cut -d" " -f1,2)
    else
        lastBackupTime="Not enabled."
    fi
else
    # This is the traditional attribute code provided by JAMF, modified slightly.
    if [ -f /private/var/db/.TimeMachine.Results.plist ]; then
        lastBackupTime=$(defaults read /private/var/db/.TimeMachine.Results "BACKUP_COMPLETED_DATE")
    else
        lastBackupTime="Not enabled."
    fi
fi

# Report the Time Machine status to the JSS.
echo "<result>$lastBackupTime</result>"