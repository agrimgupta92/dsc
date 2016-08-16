Configuration MyService
{
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

}
