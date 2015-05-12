actions
clone

	Transcript showln: '[Metacello-Git] Cloning ', self remoteUrl, ' to ', directory fullName.

	directory exists ifTrue: [
		(UIManager default confirm: 'The directory already exists and will be removed.' title: 'Delete Local Checkout')
			ifFalse: [^ self].
		UIManager default
			informUser: 'Deleting local checkout... ', directory fullName
			during: [directory recursiveDelete]].
	
	UIManager default
		informUser: 'Cloning a git repository... ', self remoteUrl
		during: [
			directory assureExistence.
	
			self osCommand:
				self class gitPath, 
				' clone "', 
				self remoteUrl , '" "', 
				directory fullName, '"'].
	
	directory exists ifFalse: [
		^ self error: 'Cloning failed.'].
	
	"Update internal caches."
	self directory: directory.