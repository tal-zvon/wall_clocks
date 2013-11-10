Wall Clock
==========

Usage
-----

Step 1::
	Download clock from http://www.vladstudio.com/wallpaperclocks/browse.php

Step 2::
	Extract it with file roller

Step 3::
	Move the folder that was extracted to ~/Pictures/

Step 4::
	Copy the script to the folder

Step 5::
	Tell cron to run the script once a minute
	$ crontab -e
		*/1 * * * * /bin/bash -c '/home/[USER]/Pictures/[wall clock folder name]/wall_clocks.sh'
	Note: Replace [USER] with your username and [wall clock folder name] with the name of the folder you extracted
