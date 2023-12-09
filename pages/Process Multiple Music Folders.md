- Process Multiple Music Folders
  date:: [[Oct 29th, 2023]]
  tags:: #music #audio #conversion #bash
  link::
- Content
	- Assume that you need to change the ARTIST of a set of albums (flac) in a folder.  the folder contains separate folders (flac, cue, jpg) and you need to generate template files for mkj to work on.
	- Example of folder structure
	  ```
	  1972 - Hot August Night
	  1973 - Sweet Caroline
	  1992 - Glory Road
	  1992 - The Greatest Hits 1966-1992
	  1996 - In My Lifetime
	  1998 - The Movie Album- As Time Goes By
	  2002 - Play me, The complete UNI Studio recordings...plus (1968-1972)
	  2002 - The Essential
	  2012 - Hot August Night [40th Anniversary Deluxe Edition]
	  2013 - Alle 40 Goed
	  2017 - 50th Anniversary Collection
	  ```
- The script will process each file, extract the necessary cuesheet REM information and process them with mkj.
	- Cannot handle multiple CDs in the same folder e.g. CD)1, CD02
	- On error `mkj-process` kicks out
- `mkj-process.sh`
  ```bash
  #! /bin/bash
  
  for FOLDER in */
  do
  	YR=$(echo "$FOLDER" | cut -d "-" -f 1 | sed -e 's| *$|| ')
  	# AL=$(echo "$FOLDER" | cut -d "-" -f 2)
  	AL=$(echo "$FOLDER" | cut -d "-" -f 2 | sed -e 's|^ *||;s|/$|| ' )
  
  
  	echo "DISCID="                     > template
  	echo "ALBUM=$AL"                   >> template
  	echo "ARTIST=Neil Diamond"         >> template
  	echo "GENRE=Rock"                  >> template
  	echo "DATE=$YR"                    >> template
  	echo "COMMENT=$(date +%Y-%m-%d),NG59"   >> template
  	echo "COMPILATION="                >> template
  	echo "DISCNUMBER="                 >> template
  	echo "TOTALDISCS="                 >> template
  	cat template
  	mv template "$FOLDER"
  
  	# comment out the following to only place the template file in
  	pushd "$FOLDER"
  	source /home/rodney/bin/mkj-4.sh
  	popd
  
  ```
-