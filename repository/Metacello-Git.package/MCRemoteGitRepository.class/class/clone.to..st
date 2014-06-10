instance creation
clone: anUrl to: aPath
	| repo |
	OSProcess waitForCommand: 'git clone "', anUrl , '" "', aPath , '"'.
	repo := self path: aPath.
	repo remoteUrl: anUrl.
	^ repo.