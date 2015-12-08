#!/usr/bin/python

import os
import xml.etree.ElementTree as ET

USER = os.getlogin()

CS6_LICFILE = "/Users/" + USER + "/Library/Preferences/Adobe Illustrator CS6 Settings/en_US/licenses.xml"
CC_2014_LICFILE = "/Users/" + USER + "/Library/Preferences/Adobe Illustrator 18 Settings/en_US/licenses.xml"
CC_2015_LICFILE = "/Users/" + USER + "/Library/Preferences/Adobe Illustrator 19 Settings/en_US/licenses.xml"

RESULT = "<result>"

if os.path.isfile(CS6_LICFILE):
	CURRENT = ET.parse(CS6_LICFILE)
	CROOT = CURRENT.getroot()

	for x in CROOT.getiterator():
		if x.text != '\n\n\n':
			RESULT += x.text + "\n"

if os.path.isfile(CC_2014_LICFILE):
	CURRENT = ET.parse(CC_2014_LICFILE)
	CROOT = CURRENT.getroot()

	for x in CROOT.getiterator():
		if x.text != '\n\n\n':
			RESULT += x.text + "\n"

if os.path.isfile(CC_2015_LICFILE):
	CURRENT = ET.parse(CC_2015_LICFILE)
	CROOT = CURRENT.getroot()

	for x in CROOT.getiterator():
		if x.text != '\n\n\n':
			RESULT += x.text + "\n"


RESULT += "</result>"

print RESULT
