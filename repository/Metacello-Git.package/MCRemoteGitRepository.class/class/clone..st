instance creation
clone: anUri
	| dir |
	dir := self packageCache directory pathName , FileDirectory slash , ((anUri copyReplaceAll: '/' with: '%') copyReplaceAll: ':' with: '').
	^ self clone: anUri to: dir.