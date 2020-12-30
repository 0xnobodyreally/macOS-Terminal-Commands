#!/usr/bin/env bash

  APPNAME="AppCleaner_3.5"
  LOG=/tmp/myMenu-$APPNAME.log
  DATE=`date +%d/%m/%Y--%H:%M:%S`      			   		  #	Print Date and Time

  echo "$DATE" > $LOG                               # Wipe old log file
  #	Download $APPNAME
  echo "Dowloading $APPNAME.zip" >> $LOG;
  curl https://freemacsoft.net/downloads/AppCleaner_3.5.zip > /tmp/AppCleaner_3.5.zip;
	ContinueIfNoErrors;											# Abort and go back to menu in case of errors
  echo "Decompressing $APPNAME.zip" >> $LOG;
  cd /tmp/
  unzip AppCleaner_3.5.zip                   # Mount DMG file
	ContinueIfNoErrors;											# Abort and go back to menu in case of errors
	echo "Copying $APPNAME to the Applications folder.." >> $LOG;
  sudo cp -r "AppCleaner.app" /Applications/   # Copy Chrome to the Application folder
	ContinueIfNoErrors;											# Abort and go back to menu in case of errors
  echo "Deleting .zip file" >> $LOG
  rm /tmp/AppCleaner_3.5.zip >> $LOG
	ContinueIfNoErrors;											# Abort and go back to menu in case of errors
  echo "AppCleaner has been installed." >> $LOG
  echo "exit code $?" >> $LOG
  result=$(cat $LOG 2> /dev/null)
  display_result "Result:"





echo "exit code $?"

exit