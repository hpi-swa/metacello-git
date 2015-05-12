accessing
directory

	self flag: #bug. "mt: Editing this repository's directory will spoil additional /repository suffixes."
	^ directory class on: (directory pathName, FileDirectory slash, 'repository')