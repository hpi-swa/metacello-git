actions
refresh
	super refresh.
	UIManager default
		informUser: self updateString
		during: [self gitCommand: 'pull']