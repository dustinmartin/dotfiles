#!/usr/bin/env zsh -f
# Purpose: Convert HEIC formatted images to JPG
#
# From:	Timothy J. Luoma
# Mail:	luomat at gmail dot com
# Date:	2019-10-02


	# Use this if you want to ignore logging
LOG='/dev/null'

	# if you want logging, uncomment this line
# LOG="$HOME/Desktop/$NAME.log"

############ You shouldn't have to change anything below this line
############ but look at PATH= if you're a Terminal nerd


NAME="$0:t:r"

if [[ -e "$HOME/.path" ]]
then
	source "$HOME/.path"
else
		# this isn't a bad PATH to use if needed. If you have
		# already set your PATH another way, delete this
	PATH='/usr/local/scripts:/usr/local/di:/usr/local/sbin:/usr/local/bin:/opt/homebrew/bin:/opt/homebrew/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/local/bin:/Library/TeX/texbin:$HOME/.iterm2'
fi

for i in "$@"
do

	EXT="$i:e:l"

	if [[ "$EXT" == "heic" ]]
	then

		JPG="$i:r.jpg"

		if [[ -e "$JPG" ]]
		then
			echo "$NAME: '$JPG' already exists. Skipping." | tee -a "$LOG"
		else

				# magick (part of 'imagemagick') consistently makes smaller JPGs which look
				# just as good, to me, as what 'sips' creates. so we'll use that if we find it
				# `brew install imagemagick`

			if (( $+commands[magick] ))
			then

				echo "$NAME: 'magick' converting '$i' to '$JPG'..." | tee -a "$LOG"

				magick convert "$i" "$JPG" 2>&1 | tee -a "$LOG"

			else

				sips -s format jpeg "${i}" --out "$JPG" 2>&1 | tee -a "$LOG"

			fi # if/else magick

		fi # if 'jpg' does not already exist

	fi # if extension is 'heic'

done

exit 0
#EOF