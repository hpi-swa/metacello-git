preferences
gitPath

	<preference: 'Path to git binary'
		category: 'GitHub'
		description: ''
		type: #String>
	^ GitPath ifNil: ['git']
