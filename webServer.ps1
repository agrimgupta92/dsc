Configuration MyService
{
    Import-DSCResource -ModuleName PSDesiredStateConfiguration
	
	File HelloWorld
    {
        Ensure = 'Present'
        DestinationPath = 'C:\dsc\HelloWorld'
        Contents = "Hello there fair traveler!"
	}
}