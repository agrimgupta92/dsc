Configuration MyService
{
    Import-DscResource -Name MSFT_xServiceResource -ModuleName xPSDesiredStateConfiguration

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

    xService RunningExample
    {
        Name           = "ExampleService"
        StartupType    = "Automatic"
        State          = "Running"
        DependsOn      = "[File]WebContent"  
        Path           = "C:\RunningService\HelloWorld.exe"
        BuiltInAccount = "LocalSystem"
        Ensure         = "Present"
    }

}

MyService