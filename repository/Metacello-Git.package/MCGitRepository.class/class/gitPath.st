preferences
gitPath

	<preference: 'Path to git binary'
		category: 'Metacello'
		description: ''
		type: #String>
	^ GitPath ifNil: ['git']
