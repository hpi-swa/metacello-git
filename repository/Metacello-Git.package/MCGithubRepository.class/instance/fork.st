github
fork
	| envPrefix |
	OSProcess isWindows ifTrue: [
		envPrefix := 'set GIT_USERNAME=' , GitUsername , ' && set GIT_PASSWORD=' , GitPassword , ' &&'.
	] ifFalse: [
		envPrefix := 'GIT_USERNAME=' , GitUsername , ' GIT_PASSWORD=' , GitPassword.
	].
	"&& is carefully chosen to work on Windows and Unix"
	self osCommand: 'cd ' , directory pathName , ' && ' , envPrefix , ' hub fork'.
	"XXX maybe not override origin"
	self gitCommand: 'remote set-url origin https://github.com/' , GitUsername , '/' , (self project: GitUsername).