#!/bin/bash

##################################################################################
## AUTHOR : Emmanuel ZIDEL-CAUFFET - Zidmann (emmanuel.zidel@gmail.com)
##################################################################################
## 2021/11/05 - First release of the script
##################################################################################


##################################################################################
# Beginning of the script - definition of the variables
##################################################################################
SCRIPT_VERSION="0.0.8"

# Return code
RETURN_CODE=0

NAME_PARAM="$1"
if [ "$NAME_PARAM" == "" ]
then
	echo "Usage : $0 <NAME_PARAM>"
	exit "$RETURN_CODE"
fi

echo "Version: $SCRIPT_VERSION"
echo "Hello $NAME_PARAM"

exit 0
