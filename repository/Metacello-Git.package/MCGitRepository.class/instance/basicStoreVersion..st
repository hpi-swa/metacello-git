overriding
basicStoreVersion: aVersion

	super basicStoreVersion: aVersion.
	self gitCommand: 'add --all'.
	[
		self gitCommand: 'commit ', ((aVersion info message, String cr, aVersion info name) lines
			inject: '' into: [:cmd :line | cmd, '-m "', line, '" ']).
	] on: GitError
	do: [ :exc |
		self ensureContactInfo ifTrue: [
			exc retry.
		].
	]