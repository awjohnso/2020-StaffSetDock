# 2020-StaffSetDock
This script will do an initial set of the user's Dock.

It makes use of the utility dockutil 
created by Kyle Crawford (https://github.com/kcrawford/dockutil).

After the script runs it will not run again because it checks for a dockutil file placed
in the following location: $HOME/Library/dockutil. This way users can further
modify the dock to their desires.

This needs to run in conjunction with a LaunchAgent to get it to run at login.
