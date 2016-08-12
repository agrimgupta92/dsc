Configuration MyService
{
    Import-DSCResource -ModuleName PSDesiredStateConfiguration
	$invocation = (Get-Variable MyInvocation).Value
    $directorypath = Split-Path $invocation.MyCommand.Path
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