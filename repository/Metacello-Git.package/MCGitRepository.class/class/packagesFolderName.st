preferences
packagesFolderName
	<preference: 'Packages Folder Name'
		category: #Metacello
		description: 'Name of the folder with file-tree structure.'
		type: #String>
	^ PackagesFolderName ifNil: ['repository']