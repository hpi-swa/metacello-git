overriding
basicStoreVersion: aVersion
	[ super basicStoreVersion: aVersion ]
		on: GitError
		do: [ :exc |
			(exc command = 'push') ifTrue: [
				self ensureCredentials.
				self fork.
				self gitCommand: 'push'.
			]
		].