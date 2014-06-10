overriding
basicStoreVersion: aVersion
	self gitCommand: 'config --local core.askpass=echo'.
	[ super basicStoreVersion: aVersion ]
		on: GitError
		do: [ :exc |
			(exc command = 'push') ifTrue: [
				self class ensureCredentials.
				self fork.
				self gitCommand: 'push'.
			]
		].