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
        # Allow Write access to some section that normally don't have it.
        cWebAppPoolDefaults serverRuntime 
        {
            Name      =  'applicationPoolDefaults'
            autoStart =  'False'
        }
           
    }
}