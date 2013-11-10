#!/bin/bash

CURRENT_FOLDER=$(dirname $0)

#If a pre-generated image already exists, use it
if [[ -e $CURRENT_FOLDER/pre_gen.png ]]
then
	mv $CURRENT_FOLDER/pre_gen.png $CURRENT_FOLDER/out.png
	gsettings set org.mate.background picture-filename `readlink -f $CURRENT_FOLDER/out.png` &>/dev/null
else
	#Figure out the file names of the current time that should be combined
	MONTH=$(echo -n "month"; date +"%m" | sed 's/^0//g' | awk '{printf $0}'; echo .png)
	DAY=$(echo -n "day"; date +"%e" | tr -d ' ' | awk '{printf $0}'; echo .png)
	HOUR=$(echo -n "hour"; echo -n "$((`TEST=$(date +"%l" | sed 's/^0//g'); [[ $TEST == 12 ]] && echo 0 || echo $TEST` * 5 + (`date +"%M" | sed 's/^0//g'` / 12)))"; echo .png)
	MINUTE=$(echo -n "minute"; date +"%M" | sed 's/^0//g' | awk '{printf $0}'; echo .png)

	#Generate current time's wallpaper
	composite $CURRENT_FOLDER/$MONTH $CURRENT_FOLDER/bg.jpg $CURRENT_FOLDER/out_temp.png
	composite $CURRENT_FOLDER/$DAY $CURRENT_FOLDER/out_temp.png $CURRENT_FOLDER/out_temp.png
	composite $CURRENT_FOLDER/$MINUTE $CURRENT_FOLDER/out_temp.png $CURRENT_FOLDER/out_temp.png
	composite $CURRENT_FOLDER/$HOUR $CURRENT_FOLDER/out_temp.png $CURRENT_FOLDER/out_temp.png
	mv $CURRENT_FOLDER/out_temp.png $CURRENT_FOLDER/out.png

	gsettings set org.mate.background picture-filename `readlink -f $CURRENT_FOLDER/out.png` &>/dev/null
fi

#Figure out the file names of the (current time + 1 minute) that should be combined
MONTH_PLUS_1=$(echo -n "month"; date --date="1 minute" +"%m" | sed 's/^0//g' | awk '{printf $0}'; echo .png)
DAY_PLUS_1=$(echo -n "day"; date --date="1 minute" +"%e" | tr -d ' ' | awk '{printf $0}'; echo .png)
HOUR_PLUS_1=$(echo -n "hour"; echo -n "$((`TEST=$(date --date="1 minute" +"%l" | sed 's/^0//g'); [[ $TEST == 12 ]] && echo 0 || echo $TEST` * 5 + (`date --date="1 minute" +"%M" | sed 's/^0//g'` / 12)))"; echo .png)
MINUTE_PLUS_1=$(echo -n "minute"; date --date="1 minute" +"%M" | sed 's/^0//g' | awk '{printf $0}'; echo .png)

#Generate (current time + 1 minute)'s wallpaper
composite $CURRENT_FOLDER/$MONTH_PLUS_1 $CURRENT_FOLDER/bg.jpg $CURRENT_FOLDER/pre_gen.png
composite $CURRENT_FOLDER/$DAY_PLUS_1 $CURRENT_FOLDER/pre_gen.png $CURRENT_FOLDER/pre_gen.png
composite $CURRENT_FOLDER/$MINUTE_PLUS_1 $CURRENT_FOLDER/pre_gen.png $CURRENT_FOLDER/pre_gen.png
composite $CURRENT_FOLDER/$HOUR_PLUS_1 $CURRENT_FOLDER/pre_gen.png $CURRENT_FOLDER/pre_gen.png
