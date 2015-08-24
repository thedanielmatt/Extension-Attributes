#!/usr/bin/python

import os

#  Check for CS6 Swatches

Coated_CS6 = "/Applications/Adobe Illustrator CS6/Presets.localized/en_US/Swatches/Color Books/PANTONE+ Solid Coated-336.acb"
Uncoated_CS6 = "/Applications/Adobe Illustrator CS6/Presets.localized/en_US/Swatches/Color Books/PANTONE+ Solid Uncoated-336.acb"

if os.path.isfile(Coated_CS6) and os.path.isfile(Uncoated_CS6):
	result = "CS6 Installed\n"
elif os.path.isfile(Coated_CS6) and not os.path.isfile(Uncoated_CS6):
	result = "CS6 Uncoated Missing\n"
elif not os.path.isfile(Coated_CS6) and os.path.isfile(Uncoated_CS6):
	result = "CS6 Coated Missing\n"
elif not os.path.isfile(Coated_CS6) and not os.path.isfile(Uncoated_CS6):
	result = "CS6 Not Installed\n"

# Check for CC (2014) Swatches
Coated_CC = "/Applications/Adobe Illustrator CC/Presets.localized/en_US/Swatches/Color Books/PANTONE+ Solid Coated.acb"
Uncoated_CC = "/Applications/Adobe Illustrator CC/Presets.localized/en_US/Swatches/Color Books/PANTONE+ Solid Uncoated.acb"

if os.path.isfile(Coated_CC) and os.path.isfile(Uncoated_CC):
	result += "CC Installed\n"
elif os.path.isfile(Coated_CC) and not os.path.isfile(Uncoated_CC):
	result += "CC Uncoated Missing\n"
elif not os.path.isfile(Coated_CC) and os.path.isfile(Uncoated_CC):
	result += "CC Coated Missing\n"
elif not os.path.isfile(Coated_CC) and not os.path.isfile(Uncoated_CC):
	result += "CC Not Installed\n"

# Check for CC 2015 Swatches

Coated_CC2015 = "/Applications/Adobe Illustrator CC 2015/Presets.localized/en_US/Swatches/Color Books/PANTONE+ Solid Coated.acb"
Uncoated_CC2015 = "/Applications/Adobe Illustrator CC 2015/Presets.localized/en_US/Swatches/Color Books/PANTONE+ Solid Uncoated.acb"

if os.path.isfile(Coated_CC2015) and os.path.isfile(Uncoated_CC2015):
	result += "CC 2015 Installed\n"
elif os.path.isfile(Coated_CC2015) and not os.path.isfile(Uncoated_CC2015):
	result += "CC 2015 Uncoated Missing\n"
elif not os.path.isfile(Coated_CC2015) and os.path.isfile(Uncoated_CC2015):
	result += "CC 2015 Coated Missing\n"
elif not os.path.isfile(Coated_CC2015) and not os.path.isfile(Uncoated_CC2015):
	result += "CC 2015 Not Installed\n"

print "<result>" + result + "</result>"