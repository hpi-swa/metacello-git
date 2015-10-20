accessing
directory: aDirectory

	super directory: aDirectory.
	
	directory in: [:dir |
		directory exists ifFalse: [^ self].
		(dir includesKey: self class packagesFolderName) ifFalse: [dir createDirectory: self class packagesFolderName]].