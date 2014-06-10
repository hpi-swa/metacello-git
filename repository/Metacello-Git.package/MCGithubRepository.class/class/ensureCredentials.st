authorization
ensureCredentials
	| storeName |
	storeName := Smalltalk imageName , '.github-cred'.
	self gitCommand: 'config --local credential.helper "store --file=' , storeName , '"'.
	GitUsername ifNil: [
		| store |
		GitUsername := FillInTheBlank request: 'Git HTTPS username?'.
		GitUsername ifNil: [ ^false ].
		GitPassword := FillInTheBlank requestPassword: 'Github password?'.
		GitPassword ifNil: [ ^false ].
		store := FileStream fileNamed: storeName.
		store nextPutAll: 'https://' , GitUsername , ':' , GitPassword  , '@github.com'; lf.
	].
	^ true.