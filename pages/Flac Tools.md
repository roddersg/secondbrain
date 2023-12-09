- Flac Tools
  date:: [[Oct 29th, 2023]]
  tags:: #flac #music #bash
  link::
- Content
	- Set of tools to work on flac files, usually one-liners
	- Split an album into separate tracks (flac)
		- [How to split a flac into single files using cue](https://bytebin.wordpress.com/2009/11/20/split-flac-by-cue-file-in-linux/)
		- ```bash
		  shnsplit -f CUEFILE -o flac -t "%n-%t" FLACFILE <"Linda Ronstadt - CUEFILE
		  ```
	- Converts flac to mp3 using `flac2mp3.sh`
	  requires `cuetools` and `id3v2` for tags
	  ```bash
	  flac2mp3.sh -f <input flac file> -s <cue file for split> -e mp3
	  ```
- Tools
	- [Offical flac website](https://xiph.org/flac/faq.html#general__tagging)
	- [metaflac](https://xiph.org/flac/documentation_tools_metaflac.html) utility to read/write FLAC file metadata, alternatively vorbis comments (vorbistcomment part of [vorbis-tools](https://wiki.xiph.org/Vorbis-tools))
	- tools to access the [MusicBrainz](https://musicbrainz.org/) library
		- [Picard](https://picard.musicbrainz.org/) a GUI application
		- If you sometimes want to skip the GUI, then maybe [Operon](https://quodlibet.readthedocs.io/en/latest/guide/commands/operon.html) (part of music player Quod Libet, and in Debian and derived distributions part of package [exfalso](https://packages.debian.org/exfalso) might be suitable for you.
		- If you want to locally rip and auto-tag full albums, then I recommend [whipper](https://github.com/whipper-team/whipper/). Other similar but more sloppy tools are [abcde](https://abcde.einval.com/) and [ripit.](http://www.ripit.pl/ripit/news.php)
		- For only tagging, but still oriented towards full albume, there is [Flactag](http://flactag.sourceforge.net/).