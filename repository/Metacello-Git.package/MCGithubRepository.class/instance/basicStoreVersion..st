overriding
basicStoreVersion: aVersion
	[ super basicStoreVersion: aVersion ]
		on: GitError
		do: [ :exc |
			(exc command = 'push') ifTrue: [
				self class ensureCredentials.
				self fork.
				self gitCommand: 'push'.
			]
		].