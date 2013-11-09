#!/bin/bash

MONTH=$(echo -n "month"; date +"%m" | sed 's/^0//g' | awk '{printf $0}'; echo .png)
DAY=$(echo -n "day"; date +"%e" | tr -d ' ' | awk '{printf $0}'; echo .png)
HOUR=$(echo -n "hour"; echo -n "$((`date +"%l"` * 5 + (`date +"%M"` / 12)))"; echo .png)
MINUTE=$(echo -n "minute"; date +"%M" | sed 's/^0//g' | awk '{printf $0}'; echo .png)

#echo "|$MONTH|"
#echo "|$DAY|"
#echo "|$HOUR|"
#echo "|$MINUTE|"

composite $MONTH bg.jpg out.png
composite $DAY out.png out.png
composite $MINUTE out.png out.png
composite $HOUR out.png out.png

#gsettings set org.mate.background picture-filename `readlink -f out.png`
