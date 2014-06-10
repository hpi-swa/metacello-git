private
gitCommand: aString
	| proc cmdLine |
	cmdLine := 'git -C "' , directory pathName , '" ' , aString.
	FileStream stdout nextPutAll: cmdLine; cr; flush.
	proc := OSProcess waitForCommand: cmdLine.
	(proc exitStatus == 0) ifFalse: [
		| cmd |
		cmd := aString upTo: ($ ).
		GitError from: cmd with: proc exitStatus.
	]