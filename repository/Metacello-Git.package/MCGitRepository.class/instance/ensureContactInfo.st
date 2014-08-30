authorization
ensureContactInfo
	GitUser ifNil: [
		GitUser := FillInTheBlank request: 'Git user?'.
		GitUser ifEmpty: [ ^false ].
		GitEmail := FillInTheBlank request: 'Git email?'.
		GitEmail ifEmpty: [ ^false ].
		self gitCommand: 'config --local user.name "' , GitUser , '"'.
		self gitCommand: 'config --local user.email "' , GitEmail , '"'.
	].
	^ true.