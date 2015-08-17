function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [parameter(Mandatory = $true)]
        [System.String]
        $Name
    )

    #Remove debug from params
    $psboundparameters.Remove('Debug') | Out-Null
    $psboundparameters.Remove('Verbose') | Out-Null

    #TODO - schedule fix up 
    $psboundparameters.Remove('schedule') | Out-Null

    #Write-Verbose "Use this cmdlet to deliver information about command processing."

    #Write-Debug "Use this cmdlet to write debug information while troubleshooting."

    Write-Verbose 'Checking for app pool specified credentials'
    $appPoolUserName = Invoke-AppPoolSetting -propertyName userName -action get

    if($appPoolUserName)
    {
                Write-Verbose 'app pool has specific identity - creating PSCredential object'

                $AppPoolPassword = Invoke-AppPoolSetting -propertyName password -action get | ConvertTo-SecureString -AsPlainText -Force
                $AppPoolCred     = new-object -typename System.Management.Automation.PSCredential -argumentlist $appPoolUserName,$AppPoolPassword
    }
    else
    {
                Write-Verbose 'app pool does not have specific identity - nothing to do here'
                $AppPoolCred =$null
    }

    
    $returnValue = @{
        Name                          = Invoke-AppPoolSetting -propertyName Name -action get;
        queueLength                   = Invoke-AppPoolSetting -propertyName queueLength -action get;
        autoStart                     = Invoke-AppPoolSetting -propertyName autoStart -action get;
        enable32BitAppOnWin64         = Invoke-AppPoolSetting -propertyName enable32BitAppOnWin64 -action get;
        managedRuntimeVersion         = Invoke-AppPoolSetting -propertyName managedRuntimeVersion -action get;
        managedRuntimeLoader          = Invoke-AppPoolSetting -propertyName managedRuntimeLoader -action get;
        enableConfigurationOverride   = Invoke-AppPoolSetting -propertyName enableConfigurationOverride -action get;
        managedPipelineMode           = Invoke-AppPoolSetting -propertyName managedPipelineMode -action get;
        CLRConfigFile                 = Invoke-AppPoolSetting -propertyName CLRConfigFile -action get;
        passAnonymousToken            = Invoke-AppPoolSetting -propertyName passAnonymousToken -action get;
        startMode                     = Invoke-AppPoolSetting -propertyName startMode -action get;
        identityType                  = Invoke-AppPoolSetting -propertyName identityType -action get;
        userName                      = $appPoolUserName;
        Password                      = $AppPoolPassword;
        loadUserProfile               = Invoke-AppPoolSetting -propertyName loadUserProfile -action get;
        setProfileEnvironment         = Invoke-AppPoolSetting -propertyName setProfileEnvironment -action get;
        logonType                     = Invoke-AppPoolSetting -propertyName logonType -action get;
        manualGroupMembership         = Invoke-AppPoolSetting -propertyName manualGroupMembership -action get;
        idleTimeout                   = Invoke-AppPoolSetting -propertyName idleTimeout -action get;
        idleTimeoutAction             = Invoke-AppPoolSetting -propertyName idleTimeoutAction -action get;
        maxProcesses                  = Invoke-AppPoolSetting -propertyName maxProcesses -action get;
        shutdownTimeLimit             = Invoke-AppPoolSetting -propertyName shutdownTimeLimit -action get;
        startupTimeLimit              = Invoke-AppPoolSetting -propertyName startupTimeLimit -action get;
        pingingEnabled                = Invoke-AppPoolSetting -propertyName pingingEnabled -action get;
        pingInterval                  = Invoke-AppPoolSetting -propertyName pingInterval -action get;
        pingResponseTime              = Invoke-AppPoolSetting -propertyName pingResponseTime -action get;
        disallowOverlappingRotation   = Invoke-AppPoolSetting -propertyName disallowOverlappingRotation -action get;
        disallowRotationOnConfigChange = Invoke-AppPoolSetting -propertyName disallowRotationOnConfigChange -action get;
        logEventOnRecycle             = Invoke-AppPoolSetting -propertyName logEventOnRecycle -action get;
        memory                        = Invoke-AppPoolSetting -propertyName memory -action get;
        privateMemory                 = Invoke-AppPoolSetting -propertyName privateMemory -action get;
        requests                      = Invoke-AppPoolSetting -propertyName requests -action get;
        time                          = Invoke-AppPoolSetting -propertyName time -action get;
        schedule                      = '';# TODO - investigate schedule setup Invoke-AppPoolSetting -propertyName schedule -action get;
        loadBalancerCapabilities      = Invoke-AppPoolSetting -propertyName loadBalancerCapabilities -action get;
        orphanWorkerProcess           = Invoke-AppPoolSetting -propertyName orphanWorkerProcess -action get;
        orphanActionExe               = Invoke-AppPoolSetting -propertyName orphanActionExe -action get;
        orphanActionParams            = Invoke-AppPoolSetting -propertyName orphanActionParams -action get;
        rapidFailProtection           = Invoke-AppPoolSetting -propertyName rapidFailProtection -action get;
        rapidFailProtectionInterval   = Invoke-AppPoolSetting -propertyName rapidFailProtectionInterval -action get;
        rapidFailProtectionMaxCrashes = Invoke-AppPoolSetting -propertyName rapidFailProtectionMaxCrashes -action get;
        autoShutdownExe               = Invoke-AppPoolSetting -propertyName autoShutdownExe -action get;
        autoShutdownParams            = Invoke-AppPoolSetting -propertyName autoShutdownParams -action get;
        limit                         = Invoke-AppPoolSetting -propertyName limit -action get;
        action                        = Invoke-AppPoolSetting -propertyName action -action get;
        resetInterval                 = Invoke-AppPoolSetting -propertyName resetInterval -action get;
        smpAffinitized                = Invoke-AppPoolSetting -propertyName smpAffinitized -action get;
        smpProcessorAffinityMask      = Invoke-AppPoolSetting -propertyName smpProcessorAffinityMask -action get;
        smpProcessorAffinityMask2     = Invoke-AppPoolSetting -propertyName smpProcessorAffinityMask2 -action get;
        processorGroup                = Invoke-AppPoolSetting -propertyName processorGroup -action get;
        numaNodeAssignment            = Invoke-AppPoolSetting -propertyName numaNodeAssignment -action get;
        numaNodeAffinityMode          = Invoke-AppPoolSetting -propertyName numaNodeAffinityMode -action get;
    }

    $returnValue

}

function Set-TargetResource
{
    [CmdletBinding()]
    param
    (
        [parameter(Mandatory = $true)]
        [System.String]
        $Name,

        [System.String]
        $queueLength,

        [System.String]
        $autoStart,

        [ValidateSet('true','false')]
        [System.String]
        $enable32BitAppOnWin64,

        [ValidateSet('v4.0','v2.0','')]
        [System.String]
        $managedRuntimeVersion,

        [System.String]
        $managedRuntimeLoader,

        [ValidateSet('true','false')]
        [System.String]
        $enableConfigurationOverride,

        [ValidateSet('Integrated','Classic')]
        [System.String]
        $managedPipelineMode,

        [System.String]
        $CLRConfigFile,

        [ValidateSet('true','false')]
        [System.String]
        $passAnonymousToken,

        [ValidateSet('AlwaysRunning','OnDemand')]
        [System.String]
        $startMode,

        [ValidateSet('ApplicationPoolIdentity','LocalSystem','LocalService','NetworkService','SpecificUser')]
        [System.String]
        $identityType,

        [System.String]
        $userName,

        [System.Management.Automation.PSCredential]
        $Password,

        [ValidateSet('true','false')]
        [System.String]
        $loadUserProfile,

        [ValidateSet('true','false')]
        [System.String]
        $setProfileEnvironment,

        [ValidateSet('LogonBatch','LogonService')]
        [System.String]
        $logonType,

        [ValidateSet('true','false')]
        [System.String]
        $manualGroupMembership,

        [System.String]
        $idleTimeout,

        [ValidateSet('Terminate','Suspend')]
        [System.String]
        $idleTimeoutAction,

        [System.String]
        $maxProcesses,

        [System.String]
        $shutdownTimeLimit,

        [System.String]
        $startupTimeLimit,

        [ValidateSet('true','false')]
        [System.String]
        $pingingEnabled,

        [System.String]
        $pingInterval,

        [System.String]
        $pingResponseTime,

        [ValidateSet('true','false')]
        [System.String]
        $disallowOverlappingRotation,

        [ValidateSet('true','false')]
        [System.String]
        $disallowRotationOnConfigChange,

        [System.String]
        $logEventOnRecycle,

        [System.String]
        $memory,

        [System.String]
        $privateMemory,

        [System.String]
        $requests,

        [System.String]
        $time,

        [Microsoft.Management.Infrastructure.CimInstance[]]
        $schedule,

        [ValidateSet('HttpLevel','TcpLevel')]
        [System.String]
        $loadBalancerCapabilities,

        [ValidateSet('true','false')]
        [System.String]
        $orphanWorkerProcess,

        [System.String]
        $orphanActionExe,

        [System.String]
        $orphanActionParams,

        [ValidateSet('true','false')]
        [System.String]
        $rapidFailProtection,

        [System.String]
        $rapidFailProtectionInterval,

        [System.String]
        $rapidFailProtectionMaxCrashes,

        [System.String]
        $autoShutdownExe,

        [System.String]
        $autoShutdownParams,

        [System.String]
        $limit,

        [ValidateSet('NoAcion','KillW3wp','Throttle','ThrottleUnderLoad')]
        [System.String]
        $action,

        [System.String]
        $resetInterval,

        [ValidateSet('true','false')]
        [System.String]
        $smpAffinitized,

        [System.String]
        $smpProcessorAffinityMask,

        [System.String]
        $smpProcessorAffinityMask2,

        [System.String]
        $processorGroup,

        [ValidateSet('MostAvailableMemory','WindowsScheduling')]
        [System.String]
        $numaNodeAssignment,

        [ValidateSet('Soft','Hard')]
        [System.String]
        $numaNodeAffinityMode
    )

    #Remove debug from params
    $psboundparameters.Remove('Debug') | Out-Null
    $psboundparameters.Remove('Verbose') | Out-Null

    #TODO - schedule fix up 
    $psboundparameters.Remove('schedule') | Out-Null

    # Check if WebAdministration module is present for IIS cmdlets
    if(!(Get-Module -ListAvailable -Name WebAdministration))
        {
            Throw 'Please ensure that WebAdministration module is installed.'
        }

    #Enumrate all params and act if necessary 
    foreach($psbp in $PSBoundParameters.GetEnumerator())
    {
          Write-Debug "Checking value for $($psbp.Key)"
          
          # We get current status and compare it with desired state  
          if( (Invoke-AppPoolSetting -propertyName $psbp.Key -action get) -ne $psbp.Value )
          {
                Write-Verbose "Setting value for $( $psbp.Key ) to $( $psbp.Value )"
                Invoke-AppPoolSetting -propertyName $psbp.Key -value $psbp.Value -action set
          }

    }

    # Our dsc does not require reboot
    $global:DSCMachineStatus = 0


}

function Test-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param
    (
        [parameter(Mandatory = $true)]
        [System.String]
        $Name,

        [System.String]
        $queueLength,

        [System.String]
        $autoStart,

        [ValidateSet('true','false')]
        [System.String]
        $enable32BitAppOnWin64,

        [ValidateSet('v4.0','v2.0','')]
        [System.String]
        $managedRuntimeVersion,

        [System.String]
        $managedRuntimeLoader,

        [ValidateSet('true','false')]
        [System.String]
        $enableConfigurationOverride,

        [ValidateSet('Integrated','Classic')]
        [System.String]
        $managedPipelineMode,

        [System.String]
        $CLRConfigFile,

        [ValidateSet('true','false')]
        [System.String]
        $passAnonymousToken,

        [ValidateSet('AlwaysRunning','OnDemand')]
        [System.String]
        $startMode,

        [ValidateSet('ApplicationPoolIdentity','LocalSystem','LocalService','NetworkService','SpecificUser')]
        [System.String]
        $identityType,

        [System.String]
        $userName,

        [System.Management.Automation.PSCredential]
        $Password,

        [ValidateSet('true','false')]
        [System.String]
        $loadUserProfile,

        [ValidateSet('true','false')]
        [System.String]
        $setProfileEnvironment,

        [ValidateSet('LogonBatch','LogonService')]
        [System.String]
        $logonType,

        [ValidateSet('true','false')]
        [System.String]
        $manualGroupMembership,

        [System.String]
        $idleTimeout,

        [ValidateSet('Terminate','Suspend')]
        [System.String]
        $idleTimeoutAction,

        [System.String]
        $maxProcesses,

        [System.String]
        $shutdownTimeLimit,

        [System.String]
        $startupTimeLimit,

        [ValidateSet('true','false')]
        [System.String]
        $pingingEnabled,

        [System.String]
        $pingInterval,

        [System.String]
        $pingResponseTime,

        [ValidateSet('true','false')]
        [System.String]
        $disallowOverlappingRotation,

        [ValidateSet('true','false')]
        [System.String]
        $disallowRotationOnConfigChange,

        [System.String]
        $logEventOnRecycle,

        [System.String]
        $memory,

        [System.String]
        $privateMemory,

        [System.String]
        $requests,

        [System.String]
        $time,

        [Microsoft.Management.Infrastructure.CimInstance[]]
        $schedule,

        [ValidateSet('HttpLevel','TcpLevel')]
        [System.String]
        $loadBalancerCapabilities,

        [ValidateSet('true','false')]
        [System.String]
        $orphanWorkerProcess,

        [System.String]
        $orphanActionExe,

        [System.String]
        $orphanActionParams,

        [ValidateSet('true','false')]
        [System.String]
        $rapidFailProtection,

        [System.String]
        $rapidFailProtectionInterval,

        [System.String]
        $rapidFailProtectionMaxCrashes,

        [System.String]
        $autoShutdownExe,

        [System.String]
        $autoShutdownParams,

        [System.String]
        $limit,

        [ValidateSet('NoAcion','KillW3wp','Throttle','ThrottleUnderLoad')]
        [System.String]
        $action,

        [System.String]
        $resetInterval,

        [ValidateSet('true','false')]
        [System.String]
        $smpAffinitized,

        [System.String]
        $smpProcessorAffinityMask,

        [System.String]
        $smpProcessorAffinityMask2,

        [System.String]
        $processorGroup,

        [ValidateSet('MostAvailableMemory','WindowsScheduling')]
        [System.String]
        $numaNodeAssignment,

        [ValidateSet('Soft','Hard')]
        [System.String]
        $numaNodeAffinityMode
    )

    #Remove debug from params
    $psboundparameters.Remove('Debug') | Out-Null
    $psboundparameters.Remove('Verbose') | Out-Null

    #TODO - schedule fix up 
    $psboundparameters.Remove('schedule') | Out-Null

    $DesiredConfigurationMatch = $true

    # Check if WebAdministration module is present for IIS cmdlets
    if(!(Get-Module -ListAvailable -Name WebAdministration))
    {
        Throw 'Please ensure that WebAdministration module is installed.'
    }

    #Enumrate all params and info if necessary 
    foreach($psbp in $PSBoundParameters.GetEnumerator())
    {
          Write-Debug "xChecking value for $($psbp.Key)"

          $currValue = (Invoke-AppPoolSetting -propertyName $psbp.Key -action get)
          Write-Debug "Current value type :  $($currValue.GetType().Name)"
          Write-Debug "DSC type :  $($($psbp.Value).GetType().Name)"
          
          # We get current status and compare it with desired state  
          if( $currValue -ne $psbp.Value )
          {
                Write-Debug "Value for $( $psbp.Key ) [ $currValue ]  does not match the desired state [$( $psbp.Value )]"

                $DesiredConfigurationMatch = $false
          }
          else
          {
                 Write-Debug "Value for $( $psbp.Key ) [ $currValue ]  does match the desired state [$( $psbp.Value )]"
          }

    }

    return $DesiredConfigurationMatch
}

# Function which allows for quick set/get of app pool property - make sure you have the newest one :)
# available @  https://gist.github.com/RafPe/77d2ff28f7a0014bf0f1
function Invoke-AppPoolSetting
{

    param
    (    
        [string]$appPoolName,
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        $propertyName,
        [Parameter(Mandatory=$true)]
        [ValidateSet('get','set')]
        [string]$action,
        $value                
    )

    #Mapping of namespace (works on IIS 8.5)
    $NamespaceMapping = @{
        name                        = 'system.applicationHost/applicationPools/{0}'
        queueLength                 = 'system.applicationHost/applicationPools/{0}';
        autoStart                   = 'system.applicationHost/applicationPools/{0}';
        enable32BitAppOnWin64       = 'system.applicationHost/applicationPools/{0}';
        managedRuntimeVersion       = 'system.applicationHost/applicationPools/{0}';
        managedRuntimeLoader        = 'system.applicationHost/applicationPools/{0}';
        enableConfigurationOverride = 'system.applicationHost/applicationPools/{0}';
        managedPipelineMode         = 'system.applicationHost/applicationPools/{0}';
        CLRConfigFile               = 'system.applicationHost/applicationPools/{0}';
        passAnonymousToken          = 'system.applicationHost/applicationPools/{0}';
        startMode                   = 'system.applicationHost/applicationPools/{0}';
        identityType          = 'system.applicationHost/applicationPools/{0}/processModel';
        userName              = 'system.applicationHost/applicationPools/{0}/processModel';
        password              = 'system.applicationHost/applicationPools/{0}/processModel';
        loadUserProfile       = 'system.applicationHost/applicationPools/{0}/processModel';
        setProfileEnvironment = 'system.applicationHost/applicationPools/{0}/processModel';
        logonType             = 'system.applicationHost/applicationPools/{0}/processModel';
        manualGroupMembership = 'system.applicationHost/applicationPools/{0}/processModel';
        idleTimeout           = 'system.applicationHost/applicationPools/{0}/processModel';
        idleTimeoutAction     = 'system.applicationHost/applicationPools/{0}/processModel';
        maxProcesses          = 'system.applicationHost/applicationPools/{0}/processModel';
        shutdownTimeLimit     = 'system.applicationHost/applicationPools/{0}/processModel';
        startupTimeLimit      = 'system.applicationHost/applicationPools/{0}/processModel';
        pingingEnabled        = 'system.applicationHost/applicationPools/{0}/processModel';
        pingInterval          = 'system.applicationHost/applicationPools/{0}/processModel';
        pingResponseTime      = 'system.applicationHost/applicationPools/{0}/processModel';
        disallowOverlappingRotation    = 'system.applicationHost/applicationPools/{0}/recycling';
        disallowRotationOnConfigChange = 'system.applicationHost/applicationPools/{0}/recycling';
        logEventOnRecycle              = 'system.applicationHost/applicationPools/{0}/recycling';
        memory                         = 'system.applicationHost/applicationPools/{0}/recycling/periodicRestart';
        privateMemory                  = 'system.applicationHost/applicationPools/{0}/recycling/periodicRestart';
        requests                       = 'system.applicationHost/applicationPools/{0}/recycling/periodicRestart';
        time                           = 'system.applicationHost/applicationPools/{0}/recycling/periodicRestart';
        schedule                       = 'system.applicationHost/applicationPools/{0}/recycling/periodicRestart/schedule';
        loadBalancerCapabilities      = 'system.applicationHost/applicationPools/{0}/failure';
        orphanWorkerProcess           = 'system.applicationHost/applicationPools/{0}/failure';
        orphanActionExe               = 'system.applicationHost/applicationPools/{0}/failure';
        orphanActionParams            = 'system.applicationHost/applicationPools/{0}/failure';
        rapidFailProtection           = 'system.applicationHost/applicationPools/{0}/failure';
        rapidFailProtectionInterval   = 'system.applicationHost/applicationPools/{0}/failure';
        rapidFailProtectionMaxCrashes = 'system.applicationHost/applicationPools/{0}/failure';
        autoShutdownExe               = 'system.applicationHost/applicationPools/{0}/failure';
        autoShutdownParams            = 'system.applicationHost/applicationPools/{0}/failure';
        limit                     = 'system.applicationHost/applicationPools/{0}/cpu';
        action                    = 'system.applicationHost/applicationPools/{0}/cpu';
        resetInterval             = 'system.applicationHost/applicationPools/{0}/cpu';
        smpAffinitized            = 'system.applicationHost/applicationPools/{0}/cpu';
        smpProcessorAffinityMask  = 'system.applicationHost/applicationPools/{0}/cpu';
        smpProcessorAffinityMask2 = 'system.applicationHost/applicationPools/{0}/cpu';
        processorGroup            = 'system.applicationHost/applicationPools/{0}/cpu';
        numaNodeAssignment        = 'system.applicationHost/applicationPools/{0}/cpu';
        numaNodeAffinityMode      = 'system.applicationHost/applicationPools/{0}/cpu';
    }

    # Create target app pool name 
    if( [string]::IsNullOrEmpty($appPoolName) -or $appPoolName -eq 'applicationPoolDefaults' ) { $targetAppName = 'applicationPoolDefaults' } else { $targetAppName = [string]::Format("add[@name='{0}']",$appPoolName ) }
    
    switch ($action)
    {
        'get'        { 

                        Write-Debug "using $targetAppName as target name"
                        # gets value
                        
                        try
                        {
                          Write-Debug "Requesting property $propertyName value for appPool $appPoolName"
                          $res =  (Get-WebConfigurationProperty -pspath 'MACHINE/WEBROOT/APPHOST'  -filter $( $NamespaceMapping[ $propertyName ] -f $targetAppName ) -name $propertyName)
                            
                          Write-Debug "property is type of $($res.GetType().Name)"

                          #We need to distinguish from simple value type to complex value types
                          if ( $res.GetType().Name -eq 'ConfigurationAttribute')
                          {

                            return $res.Value.ToString()
                          }
                          else
                          {

                           
                            return $res.ToString()
                          }

                        }
                        catch
                        {
                            Throw "Could not retrieve property $propertyName for appPool $Name"
                        }
                        
                        
                   }
      
        'set'        { 
                       
                       if($null -eq $value)
                       {
                            Throw 'Please ensure that value is specified for set and is not NULL'
                       }

                        try
                        {
                          Write-Debug "Setting  property $propertyName with value $value for appPool $Name"
                          Set-WebConfigurationProperty -pspath 'MACHINE/WEBROOT/APPHOST'  -filter $( $NamespaceMapping[ $propertyName ] -f $targetAppName ) -name $propertyName -Value $value
                        
                        }
                        catch
                        {
                            Throw "Could not set property $propertyName with value $value for appPool $Name"
                        }

                       

                   }
    }
}

Export-ModuleMember -Function *-TargetResource

