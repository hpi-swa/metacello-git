private
gitCommand: aString
	| proc |
	proc := OSProcess waitForCommand: 'git -C "' , directory pathName , '" ' , aString.
	(proc exitStatus == 0) ifFalse: [
		| cmd |
		cmd := aString upTo: ($ ).
		GitError from: cmd with: proc exitStatus.
	]