overriding
fork
	"XXX fix in Windows"
	OSProcess waitForCommand: 'cd ' , directory pathName , '; GIT_USERNAME=' , GitUsername , ' GIT_PASSWORD=' , GitPassword , ' hub fork --no-remote'.
	self gitCommand: 'remote set-url origin https://github.com/' , GitUsername , '/' , self project.