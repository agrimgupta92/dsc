Configuration MyService
{
    Import-DSCResource -ModuleName PSDesiredStateConfiguration, xNetworking
	
	Node webServer
	{
		WindowsFeature webServer
		{
			Ensure = 'Present'
			Name = 'Web-Server'
		}
		Package HelloWorld
		{
			Enusre = 'Present'
			Name = 'HelloWorld'
			Source = 'https://github.com/agrimgupta92/dsc/blob/master/HelloWorld.zip'
		}
		xFirewall HTTP
		{
			Name = 'WebServer-HTTP-In-TCP'
			Group = 'Web Server'
			Ensure = 'Present'
			Action = 'Allow'
			Enabled = 'True'
			Profile = 'Any'
			Direction = 'Inbound'
			Protocol = 'TCP'
			LocalPort = 80
			DependsOn = '[WindowsFeature]webServer'
		}
	}
}