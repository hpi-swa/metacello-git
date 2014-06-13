github
fork
	| envPrefix |
	OSProcess isWindows ifTrue: [
		envPrefix := 'set GITHUB_USER=' , GitUsername , ' && set GITHUB_PASSWORD=' , GitPassword , ' &&'.
	] ifFalse: [
		envPrefix := 'GITHUB_USER=' , GitUsername , ' GITHUB_PASSWORD=' , GitPassword.
	].
	"&& is carefully chosen to work on Windows and Unix"
	self osCommand: 'cd ' , directory pathName , ' && ' , envPrefix , ' hub fork'.
	"XXX maybe not override origin"
	self gitCommand: 'remote set-url origin https://github.com/' , GitUsername , '/' , (self project: GitUsername).