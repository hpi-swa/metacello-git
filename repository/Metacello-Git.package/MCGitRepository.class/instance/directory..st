accessing
directory: aDirectory

	super directory: aDirectory.
	
	directory in: [:dir |
		directory exists ifFalse: [^ self].
		(dir includesKey: 'repository') ifFalse: [dir createDirectory: 'repository']].