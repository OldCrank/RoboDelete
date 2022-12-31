## RoboDelete, PowerShell script by Craig Lavender 15/12/2022 ##

This script uses the RoboCopy command, with the purge option to copy an empty folder to a list of target folders; 
deleting the files they contain.
The reason I had for doing this is was my backups. Over time, it would create folders and paths
too long for Windows Explorer to delete.

## USAGE ##
This script relies on an empty folder, to copy to and purge the files in the target folders.
The script loops through a list of folders to empty. 

The empty folder is currently hardcoded as "Z:\empty", but the script can be edited to another path.

When the script is run, it will prompt for an input directory; this is the base directory 
for the folders that need to be emptied.

The second prompt is for a filter. This is so you can selectively empty folders that match.
For example: "Users 2021*(Incremental)" will empty all folders that begin with "Users 2021"
  and end with "(Incremental)"
If your folders do not have easy names to filter by, you can easily just rename the ones
  you want emptied, to something that is easier to apply a filter to.

  ## I know this is just a very rough script for now, but it helps me ##
