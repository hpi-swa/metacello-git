overriding
basicStoreVersion: aVersion

	super basicStoreVersion: aVersion.
	self gitCommand: 'push'.