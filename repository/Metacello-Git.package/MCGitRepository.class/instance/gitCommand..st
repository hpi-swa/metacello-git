private
gitCommand: aString
	| proc cmdLine |
	cmdLine := 'git --git-dir="{1}/.git" --work-tree="{1}" {2}'
		format: {directory pathName. aString}.
	proc := self osCommand: cmdLine.
	(proc exitStatus == 0) ifFalse: [
		| cmd |
		cmd := aString upTo: ($ ).
		FileStream stdout reopen nextPutAll: 'git ' , cmd , ' failed: ' , proc exitStatus; cr; flush.
		GitError from: cmd with: proc exitStatus.
	]