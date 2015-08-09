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
       
       LocalConfigurationManager
        {
            ConfigurationModeFrequencyMins = 15
            ConfigurationMode =  'ApplyAndAutoCorrect'
            RefreshFrequencyMins = 30

        }

        cWebAppPoolDefaults ConfigureAppPoolDefaults 
        {
            Name                =  'applicationPoolDefaults'         
            managedPipelineMode =  'Classic'              
            autoStart           =  'false'
            CLRConfigFile       =  'whatever'
        }
           
    }
}