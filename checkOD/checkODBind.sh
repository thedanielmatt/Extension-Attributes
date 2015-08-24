#!/bin/bash

#designed as an extension attribute for use with the Casper Suite (JAMF Software)
#list LDAPv3 bindings and return

check4OD=$(dscl localhost -list /LDAPv3)
echo "<result>$check4OD</result>"
