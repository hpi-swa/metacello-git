authorization
ensureCredentials
	| storeName |
	storeName := Smalltalk imageName , '.github-cred'.
	self gitCommand: 'config --local credential.helper "store --file=' , storeName , '"'.
	GitUsername ifNil: [
		| store |
		GitUsername := FillInTheBlank request: 'Github username?'.
		GitUsername ifNil: [ ^false ].
		GitPassword := FillInTheBlank requestPassword: 'Github password?'.

		GitPassword ifNil: [ ^false ].
		store := FileStream fileNamed: storeName.
		store nextPutAll: 'https://' , GitUsername , ':' , GitPassword  , '@github.com'; lf.
		self gitCommand: 'config --local user.name "' , GitUsername , '"'.
		self gitCommand: 'config --local user.email "fixme@example.com"'.
	].
	^ true.