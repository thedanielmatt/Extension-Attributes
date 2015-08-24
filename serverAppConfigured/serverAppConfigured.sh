#!/bin/sh

# Is serverinfo present
if [ ! -f /usr/sbin/serverinfo ]; then
	# Return False - not running 10.8 or later.
	echo "<result>False</result>"
else
    # Run serverinfo and save output as result
	result=`/usr/sbin/serverinfo --configured`
    # Switch depeneding on the product version
    case `sw_vers -productVersion` in
    # For 10.8.X & 10.9.X
    10.[8-9]*)
        # Check result string to see if it is NOT a server
    	if [ "$result" == "This system does NOT have server software configured." ]; then
    	# Return False - not a server.
    	echo "<result>False</result>"
    	fi
	    # Check Result String to see if it is a server
    	if [ "$result" == "This system has server software configured." ]; then
    	# Return True - 10.8+ server
    	echo "<result>True</result>"
    	fi
	# End Case for 10.8 & 10.9
	;;
	# End Case
	esac
fi
# Script done return 0
exit 0