overriding
basicStoreVersion: aVersion

	| retryCount |
	retryCount := 3.
	
	super basicStoreVersion: aVersion.
	self gitCommand: 'add --all'.
	[
		self gitCommand: 'commit ', (((aVersion info message copyReplaceTokens:'"' with: '\"'), String cr, aVersion info name) lines
			inject: '' into: [:cmd :line | cmd, '-m "', line, '" ']).
	] on: GitError
	do: [ :exc |
		retryCount > 0 ifTrue: [
			self ensureContactInfo ifTrue: [
				retryCount := retryCount - 1.
				exc retry]].
	]