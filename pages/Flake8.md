- Flake8
  date:: [[Oct 30th, 2023]]
  tags:: #python #vscode
  link::  mathByte YouTube [Flake8]({{video https://youtu.be/_nienWbA4TU?si=B7DOoGGwUd9fVAw3}}),  [Github Repo](https://github.com/fbaptiste/python-blog/tree/main/2022/10%20-%20October/flake8)
- Content
	- Flake8 is used to check your program for pep8 consistency.
	- Has a number of plugins which help
	  ```
	  pip install flake8
	  pip install flake8-bugbear
	  pip install flake8-comprehensions
	  pip install flake8-implicit-str-concat
	  pip install pep8-naming
	  pip install flake8-builtins
	  pip install flake8-bandit
	  pip install flake8-eradicate
	  pip install flake8-print			# usually not in prod code
	  ```
	- You can configure Flake8 by using the `.flake8`configuration file
	  ```
	  [flake8]
	  max-line-length = 80
	  
	  # McCabe complexity
	  max-complexity = 11
	  
	  # B901: return statements in generators - in Python 3 that's allowed.
	  # E203: leading space in front of :, not good in slices
	  # E226:
	  # E302:
	  # E722: duplicate of B001, so can be excluded
	  # S101
	  # S311
	  # I004
	  # N818
	  # T002
	  # T003
	  extend-ignore=B901,E203,E226,E302,E722,S101,S311,I004,N818,T002,T003
	  ```
	- Basically, you are asking flake8 to ignore certain errors when in the code.