instance creation
clone: anUrl to: aPath
	| repo |
	OSProcess waitForCommand: self class gitPath, ' clone "', anUrl , '" "', aPath , '"'.
	(FileDirectory on: aPath) in: [:dir |
		(dir includesKey: 'repository') ifFalse: [dir createDirectory: 'repository']].
	repo := self path: aPath.
	repo remoteUrl: anUrl.
	^ repo.