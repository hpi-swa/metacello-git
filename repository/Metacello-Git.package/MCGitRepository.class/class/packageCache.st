compatibility
packageCache
	"Workaround for Squeak 4.4."
	
	self flag: #deprecated. "mt: Drop Squeak 4.4. support?"
	^ MCCacheRepository default