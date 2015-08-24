#!/usr/bin/python

import os
import xml.etree.ElementTree as ET

USER = os.getlogin()

LICFILE = "/Users/" + USER + "/Library/Preferences/Adobe Illustrator CS6 Settings/en_US/licenses.xml"

CURRENT = ET.parse(LICFILE)
CROOT = CURRENT.getroot()

RESULT = "<result>"
for x in CROOT.getiterator():
	if x.text != '\n\n\n':
		RESULT += x.text + "\n"

RESULT += "</result>"

print RESULT
