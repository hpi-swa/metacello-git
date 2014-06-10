overriding
project: aRemoteName
	| file url |
	file := directory pathName, FileDirectory slash, '.git', FileDirectory slash, 'githubProject'.
	self gitCommand: 'config --local remote.' , aRemoteName , '.url'.
	url := (FileStream readOnlyFileNamed: file) contents lines first.
	^ url last: (url size - (url lastIndexOf: $/)).