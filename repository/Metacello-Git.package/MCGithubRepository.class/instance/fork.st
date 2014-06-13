github
fork
	| hubPrefix envPrefix |
	OSProcess isWindows ifTrue: [
		envPrefix := 'set GITHUB_USER=' , GitUsername , ' && set GITHUB_PASSWORD=' , GitPassword , ' &&'.
	] ifFalse: [
		envPrefix := 'GITHUB_USER=' , GitUsername , ' GITHUB_PASSWORD=' , GitPassword.
	].
	hubPrefix := 'cd ', directory pathName, ' && ', envPrefix, ' '.
	"&& is carefully chosen to work on Windows and Unix"
	self gitCommand: 'config hub.protocol https'.
	self osCommand: hubPrefix, 'hub fork --no-remote'.
	self osCommand: hubPrefix, 'hub fetch ', GitUsername.
	self gitCommand: 'branch --set-upstream-to ', GitUsername, '/master'.