# DSC module for AppPool / website and IIS advanced logging management
Modules contains resources (which is work in progress) to use DSC to manage afore mentioned parts of infrastructure. At the moment it supports only IIS 8.5

## Resources 
Guided walk through is available for this module. Please find the following links : 
* [DSC Module creation - AppPool -Part 1 ](http://rafpe.ninja/2015/08/07/powershell-creating-dsc-module-part-1/ "Part-1")
* [DSC Module creation - AppPool -Part 2 ](http://rafpe.ninja/2015/08/09/powershell-creating-dsc-module-part-2/ "Part-2")
* [DSC Module creation - AppPool -Part 3 ](http://rafpe.ninja/2015/08/16/powershell-creating-dsc-module-part-3/ "Part-3")

## Sample usage 
```PowerShell
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
       
        # Configure App Pool defaults as all apppools inherits those settings
        # on creation time
        cWebAppPool ConfigureAppPoolDefaults 
        {
            Name                =  'applicationPoolDefaults'        # by specyfying 'applicationPoolDefaults' as name we show we want to act on default  
            managedPipelineMode =  'Integrated'            
            autoStart           =  'true'
            startMode           =  'AlwaysRunning'
        }

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
           
    }
}


# Start-DscConfiguration -Path .\Config_AppPoolDefaaults -Wait -Debug
```
