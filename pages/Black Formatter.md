- Black Formatter
  date:: [[Oct 30th, 2023]]
  tags:: #python #vscode
  link::
- Content
	- YouTube videos
		- MathByte Academy [Black and isort libraries](video https://youtu.be/5ut5Rm5jWRU?si=tGY4VkQP3D-OHYd7) is a good tutorial
		- Carberra [Code Formatting with Black](https://youtu.be/A6S2nZAXgT8?si=O3fbLtMTAluiSMuI)
	- Black formatter simple commands
		- Black is a code formatter which is "opionionated" with little-to-none changes allowed.  The formatter will change the original file.
		- Installation:
		  ```
		  pip3 install black
		  ```
		- Run Black
		  ```bash
		  % black .					# run on all files in folder
		  % black . -l72				# black limits to 88 chars
		  ```
		- Tell Black not to format certain lines
		  ```
		  # fmt: off
		  text = 'This is a line of text'
		  # fmt: on
		  ```
	- A fuller tutorial, by MathByte with [Github Repo](https://github.com/fbaptiste/python-blog)
		- Recommended that you run in an venv
		- Use the pyproject.toml to specify the Black configuration, also use the .toml file to let isort know that you are using black
		  ```
		  # pyproject.toml
		  [tool.black]
		  line-length =100
		  
		  [tool.isort]
		  profile = "black"
		  ```
		- You could also tell Black not to change the original file, but to only show the changes
		  ```
		  % black --diff <folder/file>
		  ```
	- Typical run would be to run isort followed by black, however, you could use a Makefile
	  ```
	  # Makefile
	  standardize-diff:
	  	isort --diff .
	      black --diff .
	      
	  standardize:
	  	isort .
	      black .
	   
	  ```
		- Setup for VSCode
		  Run in a venv would be best 
		  ```
		  # settings.json
		  {
		  	"python.pythonPath":  "venv/Scripts/python.exe",
		      "editor.formatOnSave": true,
		      "python.formatting.provider": "black",
		      "python.formatting.blackArgs": [
		      					"--line-length=119"
		      ],
		      "python.sortImports.args": [
		      					"--profile=black"
		      ],
		      "[python]":{
		              "editor.codeActionOnSave": {
		                           "source.organizeImports": true,
		                }
		        }
		  }
		  ```