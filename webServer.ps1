Configuration MyService
{
    Import-DSCResource -ModuleName PSDesiredStateConfiguration
	
	File HelloWorld
    {
        Ensure = 'Present'
        Type = 'Directory'
        Recurse = $true
        SourcePath = '.\HelloWorld'
        DestinationPath = 'C:\dsc\HelloWorld'
	}
}