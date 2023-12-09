- My Music convertion files in bash/python
  date:: [[Oct 29th, 2023]]
  tags:: #audio #music #flac #programs
  link::
- Content
	- These are the programs/scripts that I use to convert music to my music database files.  These scripts must be transferred to any other new system.
	- | script | purpose            |
	  |--------|--------------------|
	  |mkj     | make joined-flac from separate flac, wav files |
	  |mkjs    | rescale cover.jpg to 500x500 |
	  |mkjc    | get cover.jpg from ~/Downloads |
	  |mkjcc   | get cover.jpg and rescale 500x500 |
	  |maketemplate | collects any .cue information and makes new template file|
	  |cueflac | create mkmeta.sh from template|
	  |getcover | mvoes cover.jpg/png from ~/Downloads to working folder |
	  |jpg500.sh | uses imagemagick>convert to resize jpg file, renames original |
	  |musicdir | move cue, flac and jpg file to done/cdimages/ folder |
	  |doit    | do mkj, mkmeta, musicdir at one go |
	  |doitauto | do doit and then remove the temp files |
	  |----     |---- |
	  |2flac.sh | converts ape,wv,wav to flac |
	  |getCoverFromFlac.ns | gnome script to extract 500x500 cover.jpg from flac|
	  |flac2cd.sh| converts non-cd format flac to 16/44K CD format |
	- Required files:
		- mkj.sh
			- maketemplate.sh
			- cleanFilelist.py
			- multipleArtistCheck.py
			- shntool
			- cueflac.py
			- mkmeta.sh
				- created by mkj.sh
			- musicdir.sh
		- getcover.sh
			- jpg500.sh
				- uses imagemagick>convert to resize jpg file to 500x500
			- jpgmp3.sh
				- uses imagemagick>convert to resize jpg file to 300x300
		- shntool
			- (shorten utilities)[http://shnutils.freeshell.org/]
			- (shntool)[http://shnutils.freeshell.org/shntool/]
				- see shntool.txt for use
				- see source attached
				- available for (Ubuntu}[https://manpages.ubuntu.com/manpages/trusty/man1/shntool.1.html], (MacOSX)[https://ports.macports.org/port/shntool/]
		- music-catalog.sh
			- generates music catalog of albums
		- mf.sh
			- searches music.txt and new-albums.txt for albums/names
		- done-cdimages-catalog.sh
			- produces a catalog in ~/Dropbox/docs/new-albums.txt for searching
		- ```bash
		  #! /bin/bash
		  
		  # Version 3.1
		  # automated creation of .cue, .flac and .jpg music files using python3
		  
		  # usage: mkj <music file extension, default flac>
		  
		  # setup some parameters
		  # directory where you want to store the cdimages, so that I can make the directory there
		  
		  
		  # EDITOR="atom"
		  EDITOR="subl"
		  musicdir="$HOME/Music/done/cdimages"
		  
		  echo "mkj v4.0 - $EDITOR"
		  
		  # energise subl just in case
		  # $EDITOR &
		  
		  # check whether there are any arguments, if not set to flac
		  if [ -z $1 ]
		  then
		  	ext="flac"
		  else
		  	ext="$1"
		  	if [ "$1" == "ape" ]
		  	then
		  		ape2flac
		  		ext="flac"
		  	elif [ "$1" == "wv" ]
		  	then
		  		wv2flac
		  		ext="flac"
		  	fi
		  fi
		  
		  # extract the cue details from any other template files
		  # add a blank template
		  #
		  source makeTemplate.sh
		  
		  # process the music files in the folder
		  #     ls -C1 *.$ext > filelist.org
		  #     cp filelist.org filelist
		  # present a cleaner version for editing
		  # cat filelist.org | sed -f ~/bin/titlecase-cleanup-words.sed > filelist
		  
		  # list the files
		  cleanFilelist.py $ext > filelist
		  
		  read -p "Normal file, single artist? (y) " ans
		  if [ -n "$ans" ] && [ "$ans" == "n" ]
		  then
		      multipleArtistCheck.py
		  fi
		  
		  # allow user to check/edit template
		  eval "$EDITOR template filelist"
		  
		  
		  # open any .nfo files
		  
		  for i in *.nfo
		  do
		  	if [ -f "$i" ]
		  	then
		  		eval "$EDITOR \"$i\" &"
		  	fi
		  done
		  
		  
		  # join the music files using shntool
		  echo 'Joining files...'
		  if [ -f joined.cue ]
		  then
		  	rm joined.cue
		  fi
		  shntool cue -F filelist.org > joined.cue
		  # check whether shntool has errors
		  if [ $? -eq 0 ]
		  then
		  	echo "joined.cue created....."
		  else
		  	echo "Error exiting..."
		  	exit 1
		  fi
		  
		  # ok to join the files
		  echo "creating single flac file - joined.flac"
		  if [ -f joined.flac ]
		  then
		  	rm joined.flac
		  fi
		  shntool join -F filelist.org -o flac
		  read -p  "Press return when template file is OK :"
		  
		  # generate the .cue and .flac files
		  # create the mkmets.sh file for execution
		  cueflac.py
		  
		  artist=$(getTagFromTemplate.py artist)
		  album=$(getTagFromTemplate.py album)
		  year=$(getTagFromTemplate.py date)
		  
		  filename="$artist - $album"
		  
		  # check the cuefile
		  eval "$EDITOR \"$filename\".cue"
		  
		  read -p  "Press return when ready to insert tags for single flac file: "
		  
		  # check whether the cover is available
		  if [ ! -f cover.jpg ]
		  then
		  	echo "--------------------------------------------------------------------"
		  	echo "Missing file: cover.jpg"
		  	read -p "Press return when ready, otherwise will fail..."
		  fi
		  
		  source ./mkmeta.sh
		  
		  # move the files?
		  ans=""
		  read -p "Create the folder and move the files? (y) " ans
		  if [ -z "$ans" ] || [ "$ans" == "y" ]
		  then
		      echo "y" | source musicdir.sh "$filename.cue"
		  fi
		  
		  echo "Done!"
		  
		  ```
- Todo
	- Add assets to this location