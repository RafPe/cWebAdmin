data LocalizedData
{
    # culture="en-US"
    ConvertFrom-StringData @'
    SetTargetResourceInstallwhatIfMessage   = Trying to create AppPool "{0}"
    SetTargetResourceUnInstallwhatIfMessage = Trying to remove AppPool "{0}"
    AppPoolNotFoundError                    = The requested AppPool "{0}" is not found on the target machine
    AppPoolDiscoveryFailureError            = Failure to get the requested AppPool "{0}" information from the target machine
    AppPoolCreationFailureError             = Failure to successfully create the AppPool "{0}"
    AppPoolRemovalFailureError              = Failure to successfully remove the AppPool "{0}"
    AppPoolUpdateFailureError               = Failure to successfully update the properties for AppPool "{0}"
    AppPoolCompareFailureError              = Failure to successfully compare properties for AppPool "{0}"
    AppPoolStateFailureError                = Failure to successfully set the state of the AppPool {0}
'@

}

# Get-TargetResource cmdlet is used to fetch status of app pool (app pool defaults)
fuction Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [parameter(Mandatory = $true)]
        [System.String]
        $Name
    )

    $getTargetResourceResult = $null;

    # Check if WebAdministration module is present for IIS cmdlets
    if(!(Get-Module -ListAvailable -Name WebAdministration))
    {
        Throw "Please ensure that WebAdministration module is installed."
    }

    


    #Write-Verbose "Use this cmdlet to deliver information about command processing."

    #Write-Debug "Use this cmdlet to write debug information while troubleshooting."


    <#
    $returnValue = @{
    Name = [System.String]
    autoStart = [System.String]
    managedRuntimeVersion = [System.String]
    managedPipelineMode = [System.String]
    identityType = [System.String]
    userName = [System.String]
    Password = [System.Management.Automation.PSCredential]
    loadUserProfile = [System.String]
    queueLength = [System.String]
    enable32BitAppOnWin64 = [System.String]
    managedRuntimeLoader = [System.String]
    enableConfigurationOverride = [System.String]
    CLRConfigFile = [System.String]
    passAnonymousToken = [System.String]
    logonType = [System.String]
    manualGroupMembership = [System.String]
    idleTimeout = [System.String]
    maxProcesses = [System.String]
    shutdownTimeLimit = [System.String]
    startupTimeLimit = [System.String]
    pingingEnabled = [System.String]
    pingInterval = [System.String]
    pingResponseTime = [System.String]
    disallowOverlappingRotation = [System.String]
    disallowRotationOnConfigChange = [System.String]
    logEventOnRecycle = [System.String]
    restartMemoryLimit = [System.String]
    restartPrivateMemoryLimit = [System.String]
    restartRequestsLimit = [System.String]
    restartTimeLimit = [System.String]
    restartSchedule = [System.String[]]
    loadBalancerCapabilities = [System.String]
    orphanWorkerProcess = [System.String]
    orphanActionExe = [System.String]
    rapidFailProtection = [System.String]
    rapidFailProtectionInterval = [System.String]
    rapidFailProtectionMaxCrashes = [System.String]
    autoShutdownExe = [System.String]
    autoShutdownParams = [System.String]
    cpuAction = [System.String]
    cpuLimit = [System.String]
    cpuResetInterval = [System.String]
    cpuSmpAffinitized = [System.String]
    cpuSmpProcessorAffinityMask = [System.String]
    cpuSmpProcessorAffinityMask2 = [System.String]
    }

    $returnValue
    #>
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
        $autoStart,

        [ValidateSet("v4.0","v2.0","")]
        [System.String]
        $managedRuntimeVersion,

        [ValidateSet("Integrated","Classic")]
        [System.String]
        $managedPipelineMode,

        [ValidateSet("ApplicationPoolIdentity","LocalSystem","LocalService","NetworkService","SpecificUser")]
        [System.String]
        $identityType,

        [System.String]
        $userName,

        [System.Management.Automation.PSCredential]
        $Password,

        [ValidateSet("true","false")]
        [System.String]
        $loadUserProfile,

        [System.String]
        $queueLength,

        [ValidateSet("true","false")]
        [System.String]
        $enable32BitAppOnWin64,

        [System.String]
        $managedRuntimeLoader,

        [ValidateSet("true","false")]
        [System.String]
        $enableConfigurationOverride,

        [System.String]
        $CLRConfigFile,

        [ValidateSet("true","false")]
        [System.String]
        $passAnonymousToken,

        [ValidateSet("LogonBatch","LogonService")]
        [System.String]
        $logonType,

        [ValidateSet("true","false")]
        [System.String]
        $manualGroupMembership,

        [System.String]
        $idleTimeout,

        [System.String]
        $maxProcesses,

        [System.String]
        $shutdownTimeLimit,

        [System.String]
        $startupTimeLimit,

        [ValidateSet("true","false")]
        [System.String]
        $pingingEnabled,

        [System.String]
        $pingInterval,

        [System.String]
        $pingResponseTime,

        [ValidateSet("true","false")]
        [System.String]
        $disallowOverlappingRotation,

        [ValidateSet("true","false")]
        [System.String]
        $disallowRotationOnConfigChange,

        [System.String]
        $logEventOnRecycle,

        [System.String]
        $restartMemoryLimit,

        [System.String]
        $restartPrivateMemoryLimit,

        [System.String]
        $restartRequestsLimit,

        [System.String]
        $restartTimeLimit,

        [System.String[]]
        $restartSchedule,

        [ValidateSet("HttpLevel","TcpLevel")]
        [System.String]
        $loadBalancerCapabilities,

        [ValidateSet("true","false")]
        [System.String]
        $orphanWorkerProcess,

        [System.String]
        $orphanActionExe,

        [ValidateSet("true","false")]
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

        [ValidateSet("NoAction","KillW3wp","Throttle","ThrottleUnderLoad")]
        [System.String]
        $cpuAction,

        [System.String]
        $cpuLimit,

        [System.String]
        $cpuResetInterval,

        [ValidateSet("true","false")]
        [System.String]
        $cpuSmpAffinitized,

        [System.String]
        $cpuSmpProcessorAffinityMask,

        [System.String]
        $cpuSmpProcessorAffinityMask2
    )

    #Write-Verbose "Use this cmdlet to deliver information about command processing."

    #Write-Debug "Use this cmdlet to write debug information while troubleshooting."

    #Include this line if the resource requires a system reboot.
    #$global:DSCMachineStatus = 1


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
        $autoStart,

        [ValidateSet("v4.0","v2.0","")]
        [System.String]
        $managedRuntimeVersion,

        [ValidateSet("Integrated","Classic")]
        [System.String]
        $managedPipelineMode,

        [ValidateSet("ApplicationPoolIdentity","LocalSystem","LocalService","NetworkService","SpecificUser")]
        [System.String]
        $identityType,

        [System.String]
        $userName,

        [System.Management.Automation.PSCredential]
        $Password,

        [ValidateSet("true","false")]
        [System.String]
        $loadUserProfile,

        [System.String]
        $queueLength,

        [ValidateSet("true","false")]
        [System.String]
        $enable32BitAppOnWin64,

        [System.String]
        $managedRuntimeLoader,

        [ValidateSet("true","false")]
        [System.String]
        $enableConfigurationOverride,

        [System.String]
        $CLRConfigFile,

        [ValidateSet("true","false")]
        [System.String]
        $passAnonymousToken,

        [ValidateSet("LogonBatch","LogonService")]
        [System.String]
        $logonType,

        [ValidateSet("true","false")]
        [System.String]
        $manualGroupMembership,

        [System.String]
        $idleTimeout,

        [System.String]
        $maxProcesses,

        [System.String]
        $shutdownTimeLimit,

        [System.String]
        $startupTimeLimit,

        [ValidateSet("true","false")]
        [System.String]
        $pingingEnabled,

        [System.String]
        $pingInterval,

        [System.String]
        $pingResponseTime,

        [ValidateSet("true","false")]
        [System.String]
        $disallowOverlappingRotation,

        [ValidateSet("true","false")]
        [System.String]
        $disallowRotationOnConfigChange,

        [System.String]
        $logEventOnRecycle,

        [System.String]
        $restartMemoryLimit,

        [System.String]
        $restartPrivateMemoryLimit,

        [System.String]
        $restartRequestsLimit,

        [System.String]
        $restartTimeLimit,

        [System.String[]]
        $restartSchedule,

        [ValidateSet("HttpLevel","TcpLevel")]
        [System.String]
        $loadBalancerCapabilities,

        [ValidateSet("true","false")]
        [System.String]
        $orphanWorkerProcess,

        [System.String]
        $orphanActionExe,

        [ValidateSet("true","false")]
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

        [ValidateSet("NoAction","KillW3wp","Throttle","ThrottleUnderLoad")]
        [System.String]
        $cpuAction,

        [System.String]
        $cpuLimit,

        [System.String]
        $cpuResetInterval,

        [ValidateSet("true","false")]
        [System.String]
        $cpuSmpAffinitized,

        [System.String]
        $cpuSmpProcessorAffinityMask,

        [System.String]
        $cpuSmpProcessorAffinityMask2
    )

    #Write-Verbose "Use this cmdlet to deliver information about command processing."

    #Write-Debug "Use this cmdlet to write debug information while troubleshooting."


    <#
    $result = [System.Boolean]
    
    $result
    #>
}




function Invoke-AppPoolSetting
{

    param
    (    
        [string]$Name,
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        $propertyName,
        [Parameter(Mandatory=$true)]
        [ValidateSet('get','set')]
        [string]$action,
        $value                
    )

    #Mapping of namespace
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
       logEventOnRecycle              = 'system.applicationHost/applicationPools/{0}/recycling/periodicRestart';
       memory                         = 'system.applicationHost/applicationPools/{0}/recycling/periodicRestart';
       privateMemory                  = 'system.applicationHost/applicationPools/{0}/recycling/periodicRestart';
       requests                       = 'system.applicationHost/applicationPools/{0}/recycling/periodicRestart';
       time                           = 'system.applicationHost/applicationPools/{0}/recycling/periodicRestart';
       schedule                       = 'system.applicationHost/applicationPools/{0}/recycling/periodicRestart/schedule';
       loadBalancerCapabilities      = 'system.applicationHost/applicationPools/{0}/recycling/failure';
       orphanWorkerProcess           = 'system.applicationHost/applicationPools/{0}/recycling/failure';
       orphanActionExe               = 'system.applicationHost/applicationPools/{0}/recycling/failure';
       orphanActionParams            = 'system.applicationHost/applicationPools/{0}/recycling/failure';
       rapidFailProtection           = 'system.applicationHost/applicationPools/{0}/recycling/failure';
       rapidFailProtectionInterval   = 'system.applicationHost/applicationPools/{0}/recycling/failure';
       rapidFailProtectionMaxCrashes = 'system.applicationHost/applicationPools/{0}/recycling/failure';
       autoShutdownExe               = 'system.applicationHost/applicationPools/{0}/recycling/failure';
       autoShutdownParams            = 'system.applicationHost/applicationPools/{0}/recycling/failure';
       limit                     = 'system.applicationHost/applicationPools/{0}/recycling/cpu';
       action                    = 'system.applicationHost/applicationPools/{0}/recycling/cpu';
       resetInterval             = 'system.applicationHost/applicationPools/{0}/recycling/cpu';
       smpAffinitized            = 'system.applicationHost/applicationPools/{0}/recycling/cpu';
       smpProcessorAffinityMask  = 'system.applicationHost/applicationPools/{0}/recycling/cpu';
       smpProcessorAffinityMask2 = 'system.applicationHost/applicationPools/{0}/recycling/cpu';
       processorGroup            = 'system.applicationHost/applicationPools/{0}/recycling/cpu';
       numaNodeAssignment        = 'system.applicationHost/applicationPools/{0}/recycling/cpu';
       numaNodeAffinityMode      = 'system.applicationHost/applicationPools/{0}/recycling/cpu';
    }

    # Create target app pool name 
    if( [string]::IsNullOrEmpty($Name) ) { $targetAppName = 'applicationPoolDefaults' } else { $targetAppName = [string]::Format("add[@name='{0}']",$Name ) }
    
    switch ($action)
    {
      'get'        { 
                        # gets value
                        return (Get-WebConfigurationProperty -pspath 'MACHINE/WEBROOT/APPHOST'  -filter $( $NamespaceMapping[ $propertyName ] -f $targetAppName ) -name $propertyName).Value
                   }
      
      'set'        { 
                       
                       if($null -eq $value)
                       {
                            Throw "Please ensure that value is specified for set and is not NULL"
                       }

                       Set-WebConfigurationProperty -pspath 'MACHINE/WEBROOT/APPHOST'  -filter $( $NamespaceMapping[ $propertyName ] -f $targetAppName ) -name $propertyName -Value

                   }
    }
}

Export-ModuleMember -Function *-TargetResource

