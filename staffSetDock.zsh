#!/bin/zsh

# Author: Andrew W. Johnson
# Date: 2020.05.05.
# Version 1.10
# Organization: Stony Brook Univeristy/DoIT

# This script will do an initial set of the user's dock. It makes use of the utility dockutil 
# created by Kyle Crawford (https://github.com/kcrawford/dockutil).
#
# After this script runs it will not run again because it checks for a dockutil file placed
# in the following location: $HOME/Library/dockutil. This way users can further
# modify the dock to their desires.
#
# This needs to run in conjunction with a LaunchAgent to get it to run at login.

	
	# Check for the presence of dockutil.
if [ ! -e /usr/local/bin/dockutil ]; then
	/bin/echo "Please install dockutil."
	exit 1
fi

	# Get the logged in user.
myUser=$( /usr/bin/defaults read /Library/Preferences/com.apple.loginwindow lastUserName )
	# Get the location of the home directory of the user.
myHome=$( /usr/bin/dscl . read Users/${myUser} NFSHomeDirectory | /usr/bin/awk '{print $2}' )

	# Check to see if the $HOME/Library/dockutil file is there. If so, don't run.
if [ ! -f ${myHome}/Library/dockutil ]; then
	/bin/echo "dockutil did not run..."

	/usr/local/bin/dockutil -v --remove all --no-restart $myHome
	/usr/local/bin/dockutil -v --add "/Applications/Adobe Acrobat Reader DC.app" --no-restart $myHome
	/usr/local/bin/dockutil -v --add "/Applications/BBEdit.app" --no-restart $myHome
	/usr/local/bin/dockutil -v --add "/Applications/Google Chrome.app" --no-restart $myHome
	/usr/local/bin/dockutil -v --add "/System/Applications/Music.app" --no-restart $myHome
	/usr/local/bin/dockutil -v --add "/Applications/Microsoft Word.app" --no-restart $myHome
	/usr/local/bin/dockutil -v --add "/Applications/Microsoft Excel.app" --no-restart $myHome
	/usr/local/bin/dockutil -v --add "/Applications/Microsoft PowerPoint.app" --no-restart $myHome
	/usr/local/bin/dockutil -v --add "/Applications/Safari.app" --no-restart $myHome
	/usr/local/bin/dockutil -v --add "/System/Applications/System Preferences.app" --no-restart $myHome
	/usr/local/bin/dockutil -v --add "/Applications/Self Service.app" --no-restart $myHome
	/usr/local/bin/dockutil -v --add '~/Downloads' --view list --display folder $myHome

	/usr/bin/touch ${myHome}/Library/dockutil
else
	/bin/echo "dockutil has already run for user ${myUser}"
fi

exit 0
