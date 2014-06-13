github
fork
	| envPrefix |
	OSProcess isWindows ifTrue: [
		envPrefix := 'set GITHUB_USER=' , GitUsername , ' && set GITHUB_PASSWORD=' , GitPassword , ' &&'.
	] ifFalse: [
		envPrefix := 'GITHUB_USER=' , GitUsername , ' GITHUB_PASSWORD=' , GitPassword.
	].
	"&& is carefully chosen to work on Windows and Unix"
	self gitCommand: 'config hub.protocol https'.
	self osCommand: 'cd ' , directory pathName , ' && ' , envPrefix , ' hub fork --no-remote'.
	self osCommand: 'cd ' , directory pathName , ' && hub fetch ' , GitUsername.
	self gitCommand: 'branch --set-upstream-to ', GitUsername , '/master'.