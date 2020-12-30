#!/bin/sh

# rename this script in "reboot" and move it to /usr/local/bin
# sudo chown root:wheel /usr/local/bin/reboot

FVStatus=`fdesetup status`
# echo "Status: $FVStatus"  #

if [ "$FVStatus" = "FileVault is On." ]
then
	echo "$(tput setaf 7)$(tput setab 1)$FVStatus Restart with authentication. (Exit code: $?) $(tput sgr 0)"

	# Check if Filevaul reboot is supported
	isFVRestartSupported=`fdesetup supportsauthrestart`

	if [ $isFVRestartSupported = true ]
	then
	  # Restart authenticated. Must be sudo. User credentials needeed for restart
		sudo fdesetup authrestart
	else
	  echo "fdesetup authrestart is not supported. (Exit code: $?)"
	fi
else
	#echo "$FVStatus Reboot normally. (Exit code: $?)"
	reboot
fi
