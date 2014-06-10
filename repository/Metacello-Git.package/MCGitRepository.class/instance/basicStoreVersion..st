overriding
basicStoreVersion: aVersion
	super basicStoreVersion: aVersion.
	self gitCommand: 'add --all'.
	[
		self gitCommand: 'commit -m "' , aVersion info message , '" -m "Squeak version: ' , aVersion info name , '"'.
	] on: GitError
	do: [ :exc |
		self ensureContactInfo ifTrue: [
			exc retry.
		].
	]