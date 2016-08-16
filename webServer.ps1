Configuration MyService
{
    Import-DscResource -ModuleName PSDesiredStateConfiguration

    WindowsFeature IIS  
    {  
        Ensure          = 'Present'  
        Name            = 'Web-Server'  
    }

    File WebContent  
    {  
        Ensure          = 'Present'  
        SourcePath      = "$PSScriptRoot\HelloWorld"
        DestinationPath = 'C:\RunningService' 
        Recurse         = $true  
        Type            = 'Directory'  
        Force           = $true 
        Checksum        = 'SHA-256'
    }

    Service ServiceExample
    {
        Name           = "TermService"
        StartupType    = "Automatic"
        State          = "Running"
        DependsOn      = "[File]WebContent"  
        Path           = "C:\RunningService\HelloWorld.exe"
        BuiltInAccount = "LocalSystem"
    }

}