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
        SourcePath      = "$PSScriptRoot\HelloWorldPackage"
        DestinationPath = 'C:\HelloWorldPackage' 
        Recurse         = $true  
        Type            = 'Directory'   
    }
}