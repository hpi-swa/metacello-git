instance creation
path: aPath from: aRemoteUrl
	| repo |
	repo := super path: aPath.
	repo remoteUrl: aRemoteUrl.
	^ repo.