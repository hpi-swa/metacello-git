instance creation
clone: anUrl to: aPath
	| repo |
	OSProcess waitForCommand: 'git clone "', anUrl , '" "', aPath , '"'.
	(FileDirectory on: aPath) createDirectory: 'repository'.
	repo := self path: aPath.
	repo remoteUrl: anUrl.
	^ repo.