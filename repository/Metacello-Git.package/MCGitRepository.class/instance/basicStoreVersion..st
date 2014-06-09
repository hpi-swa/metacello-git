overriding
basicStoreVersion: aVersion
	super basicStoreVersion: aVersion.
	self gitCommand: 'add --all'.
	self gitCommand: 'commit -m "' , aVersion info message , '" -m "Squeak version: ' , aVersion info name , '"'.
	self gitCommand: 'push'.