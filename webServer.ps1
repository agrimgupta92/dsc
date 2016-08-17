Configuration MyService
{
    WindowsFeature IIS  
    {  
        Ensure          = 'Present'  
        Name            = 'Web-Server'  
    }

    WindowsProcess CheckProcess
    {
        Path      = 'C:\RunningService\HelloWorld.exe'
        Arguments = ''
        Ensure    = 'Absent'

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
        DependsOn       = "[WindowsProcess]CheckProcess"
    }

    WindowsProcess TestRun
    {
        Path      = 'C:\RunningService\HelloWorld.exe'
        Arguments = ''
        DependsOn = "[File]WebContent"
    }
}
