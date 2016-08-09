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
			Ensure = 'Present'
			Name = 'HelloWorld'
			Path = 'C:\dsc\HelloWorld.exe'
			ProductId = ''
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