#!/bin/bash

CURRENT_FOLDER=$(dirname $0)

MONTH=$(echo -n "month"; date +"%m" | sed 's/^0//g' | awk '{printf $0}'; echo .png)
DAY=$(echo -n "day"; date +"%e" | tr -d ' ' | awk '{printf $0}'; echo .png)
HOUR=$(echo -n "hour"; echo -n "$((`date +"%l" | sed 's/^0//g'` * 5 + (`date +"%M" | sed 's/^0//g'` / 12)))"; echo .png)
MINUTE=$(echo -n "minute"; date +"%M" | sed 's/^0//g' | awk '{printf $0}'; echo .png)

#echo "|$MONTH|"
#echo "|$DAY|"
#echo "|$HOUR|"
#echo "|$MINUTE|"

composite $CURRENT_FOLDER/$MONTH $CURRENT_FOLDER/bg.jpg $CURRENT_FOLDER/out_temp.png
composite $CURRENT_FOLDER/$DAY $CURRENT_FOLDER/out_temp.png $CURRENT_FOLDER/out_temp.png
composite $CURRENT_FOLDER/$MINUTE $CURRENT_FOLDER/out_temp.png $CURRENT_FOLDER/out_temp.png
composite $CURRENT_FOLDER/$HOUR $CURRENT_FOLDER/out_temp.png $CURRENT_FOLDER/out_temp.png
mv $CURRENT_FOLDER/out_temp.png $CURRENT_FOLDER/out.png

gsettings set org.mate.background picture-filename `readlink -f $CURRENT_FOLDER/out.png` &>/dev/null
