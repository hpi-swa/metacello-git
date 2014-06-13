private
osCommand: cmd
	| proc |
	Transcript show: 'Running ', cmd, '...'.
	FileStream stderr nextPutAll: '$ ' , cmd; cr.
	proc := OSProcess waitForCommand: cmd.
	(proc exitStatus = 0)
		ifTrue: [ Transcript show: ' done'. ]
		ifFalse: [ Transcript show: ' failed with ', proc exitStatus ].
	Transcript cr.
	^ proc.