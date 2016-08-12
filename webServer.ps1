Configuration MyService
{
    Import-DSCResource -ModuleName PSDesiredStateConfiguration
    $directorypath = (Get-Item -Path ".\" -Verbose).FullName
    $settingspath = $directorypath + '\HelloWorld'
	File HelloWorld
    {
        Ensure = "Present"  
        Type = "Directory" 
        Recurse = $true 
        SourcePath = $settingspath
        DestinationPath = "C:\HelloWorldPackage" 
	}
}