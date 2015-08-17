configuration Config_AppPoolDefaaults
{
    param
    (
        # Target nodes to apply the configuration
        [string[]]$NodeName = 'localhost'
    )

    # Import the module that defines custom resources
    Import-DscResource -ModuleName 'cWebAdmin'
    Import-DscResource –ModuleName ’PSDesiredStateConfiguration’

    Node $NodeName
    {
       
        # still pointing to defaults - to be changed 
        cWebAppPoolDefaults ConfigureAppPoolDefaults 
        {
            Name                =  'applicationPoolDefaults'        # by pecyfying 'applicationPoolDefaults' as name we show we want to act on default  
            managedPipelineMode =  'Integrated'            
            autoStart           =  'true'
            startMode           =  'AlwaysRunning'
        }
           
    }
}


# Start-DscConfiguration -Path .\Config_AppPoolDefaaults -Wait -Debug