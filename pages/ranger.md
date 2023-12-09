- Installation problems on Mac M2
	- `brew install` on M2
		- no image preview, w3m has problems ref: https://github-wiki-see.page/m/ranger/ranger/wiki/Image-Previews
		- changing to kitty, cannot inject package pillow into installation because of brew folders in /opt/homebrew
	- `pipx install`
		- cannot work, broken because of <space> in path name "Application\ Support"
	- `clone git repo`
		- also has problems, cannot find the correct Python version
		- Solution:
			- `python3 -m pip install ranger-fm`
			- Also does not work, but files correctly installed
			- Need to symlink the following:
			- ```bash
			  ln -s /Library/Frameworks/Python.framework/Versions/3.12/bin/ranger   /Users/rodney/.local/bin/ranger
			  
			  ln -s /Library/Frameworks/Python.framework/Versions/3.12/bin/rifle   /Users/rodney/.local/bin/rifle
			  ```
		- For image previews using kitty
			- copy the config files using ranger --copy-config=all
			- edit rc.conf
				- set preview_images true
				- set preview_images_method kitty
			- You may need to install the package Pillow