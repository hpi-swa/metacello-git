instance creation
clone: anUri
	| dir |
	dir := self packageCache directory pathName , FileDirectory slash , (((anUri findTokens: '/') last allButLast: 4 ".git") copyReplaceAll: ':' with: '').
	^ self clone: anUri to: dir.