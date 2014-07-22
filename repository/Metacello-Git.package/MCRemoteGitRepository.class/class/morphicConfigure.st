configuring
morphicConfigure
	| clone repo |
	clone := FillInTheBlank request: 'Git clone URL:' initialAnswer: 'https://github.com/'.
	UIManager default informUser: 'Hardcore cloning action...' during: [repo := self clone: clone].
	^ repo