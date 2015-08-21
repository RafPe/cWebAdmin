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

        cWebAppPool ConfigureAppPoolDefaults 
        {
            Name                =  'applicationPoolDefaults'        # by specyfying 'applicationPoolDefaults' as name we show we want to act on default  | Also we do not need to specify Ensure and State!
            managedPipelineMode =  'Integrated'            
            autoStart           =  'true'
            startMode           =  'AlwaysRunning'
        }

        # Here we create some new app pool (reconfigure existing)
        cWebAppPool MyNewAppPool 
        {
            Ensure                =  'Present'
            State                 =  'Stopped'
            queueLength           =  '123'
            enable32BitAppOnWin64 =  'false'
            logonType             =  'LogonBatch'
            Name                  =  'mySweetAppPool'        
            managedPipelineMode   =  'Classic'            
            autoStart             =  'true'
            startMode             =  'OnDemand'            
        }

       
        cWebAppPool Hs 
        {
            Ensure              =  'Present'
            Name                =  'HeaderSize'        
            managedPipelineMode =  'Classic'            
            autoStart           =  'false'
            startMode           =  'AlwaysRunning'
            
        }
           
    }
}


# Start-DscConfiguration -Path .\Config_AppPoolDefaaults -Wait -Debug
<#
        # Here we create some new app pool (reconfigure existing)
        cWebAppPool MyNewAppPool 
        {
            DependsOn           =  '[cWebAppPool]ConfigureAppPoolDefaults'
            Ensure              =  'Present'
            Name                =  'mySweetAppPool'        
            managedPipelineMode =  'Integrated'            
            autoStart           =  'true'
            startMode           =  'AlwaysRunning'
            
        }



                # Configure App Pool defaults as all apppools inherits those settings
        # on creation time
        cWebAppPool ConfigureAppPoolDefaults 
        {
            Name                =  'applicationPoolDefaults'        # by specyfying 'applicationPoolDefaults' as name we show we want to act on default  | Also we do not need to specify Ensure and State!
            managedPipelineMode =  'Integrated'            
            autoStart           =  'true'
            startMode           =  'AlwaysRunning'
        }

        # Here we create some new app pool (reconfigure existing)
        cWebAppPool MyNewAppPool 
        {
            Ensure              =  'Present'
            Name                =  'mySweetAppPool'        
            managedPipelineMode =  'Classic'            
            autoStart           =  'false'
            startMode           =  'OnDemand'
            
        }

#>