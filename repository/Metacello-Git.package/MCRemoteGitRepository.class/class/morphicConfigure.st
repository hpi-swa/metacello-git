configuring
morphicConfigure
	
	| repository remotePath localPath |
	remotePath := FillInTheBlank request: 'Enter Git clone URL' initialAnswer: 'git@github.com:User/Project.git'.
	remotePath ifEmpty: [^ nil].

	(FileDirectory on: self gitCachePath) assureExistence.

	localPath := self gitCachePath, (((remotePath findTokens: '/') last allButLast: 4 ".git") copyReplaceAll: ':' with: '').
	localPath := FillInTheBlank request: 'Enter local path' initialAnswer: localPath.
	localPath ifEmpty: [^ nil].
	
	repository := self path: localPath.
	repository remoteUrl: remotePath.
	
	(UIManager default confirm: ('Do you want to clone the repository?\Remote: {1}\Local: {2}' withCRs
		format: {remotePath.localPath})) ifTrue: [repository clone].	
	
	^ repository