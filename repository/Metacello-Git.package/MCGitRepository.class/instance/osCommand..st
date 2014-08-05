private
osCommand: cmd
	| proc |
	Transcript show: 'Running ', cmd, '...'.
	FileStream stderr reopen nextPutAll: '$ ' , cmd; cr.
	Smalltalk platformName = 'Win32'
		ifTrue: [
			proc := ExternalWindowsOSProcess command: cmd.
			[proc update: #runState. proc isRunning] whileTrue: [(Delay forMilliseconds: 10) wait]]
		ifFalse: [proc := OSProcess waitForCommand: cmd].
	(proc exitStatus = 0)
		ifTrue: [ Transcript show: ' done'. ]
		ifFalse: [ Transcript show: ' failed with ', proc exitStatus ].
	Transcript cr.
	^ proc.