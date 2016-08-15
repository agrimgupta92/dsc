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
        DestinationPath = 'C:\Package2' 
        Recurse         = $true  
        Type            = 'Directory'  
        Force           = $true 
        Checksum        = 'SHA-256'
    }

    File WebContentNext  
    {  
        Ensure          = 'Present'  
        SourcePath      = "$PSScriptRoot\HelloWorld"
        DestinationPath = 'C:\Package' 
        Recurse         = $true  
        Type            = 'Directory'   
        Force           = $true
        Checksum        = 'SHA-256'
    }
}