as yet unclassified
ensureCredentials
	| storeName |
	storeName := Smalltalk imageName , '.github-cred'.
	self gitCommand: 'config --local credential.helper "store --file=' , storeName , '"'.
	GitUsername ifNil: [
		| store |
		GitUsername := FillInTheBlank request: 'Github username?'.
		GitPassword := FillInTheBlank requestPassword: 'Github password?'.
		store := FileStream fileNamed: storeName.
		store nextPutAll: 'https://' , GitUsername , ':' , GitPassword  , '@github.com'; lf.
	].