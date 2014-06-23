configuring
morphicConfigure
	| clone dir repo |
	clone := FillInTheBlank request: 'Git clone URL:' initialAnswer: 'https://github.com/'.
	dir := self packageCache directory pathName , FileDirectory slash , ((clone copyReplaceAll: '/' with: '%') copyReplaceAll: ':' with: '').
	UIManager default informUser: 'Hardcore cloning action...' during: [OSProcess waitForCommand: 'git clone "', clone , '" "', dir , '"'].
	repo := self path: dir.
	repo remoteUrl: clone.
	^ repo.