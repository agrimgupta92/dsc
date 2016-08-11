Configuration MyService
{
    Import-DSCResource -ModuleName PSDesiredStateConfiguration
	
	File HelloWorld
    {
        Ensure = 'Present'
        DestinationPath = 'C:\HelloWorld'
        Contents = "Hello there fair traveler!"
	}
}