actions
clone

	| branch |
	Transcript showln: '[Metacello-Git] Cloning ', self remoteUrl, ' to ', directory fullName.

	directory exists ifTrue: [
		(UIManager default confirm: 'The directory already exists and will be removed.' title: 'Delete Local Checkout')
			ifFalse: [^ self].
		UIManager default
			informUser: 'Deleting local checkout... ', directory fullName
			during: [directory recursiveDelete]].
	
	branch := UIManager default
		request: 'Which branch?'
		initialAnswer: 'master'.
	branch ifNil: [branch := 'master'].
	
	UIManager default
		informUser: 'Cloning a git repository... ', self remoteUrl
		during: [
			directory assureExistence.
	
			self osCommand:
				self class gitPath, 
				' clone -b "',
				branch,
				'" --single-branch "', 
				self remoteUrl , '" "', 
				directory fullName, '"'].
	
	directory exists ifFalse: [
		^ self error: 'Cloning failed.'].
	
	"Update internal caches."
	self directory: directory.