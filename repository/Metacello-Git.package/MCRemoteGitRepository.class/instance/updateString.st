displaying
updateString
	^ 'Pulling' , (remoteUrl ifNotNil: [ :s | ' from ', s ]) , '...'.