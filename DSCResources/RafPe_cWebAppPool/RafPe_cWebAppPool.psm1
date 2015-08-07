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

    #Write-Verbose "Use this cmdlet to deliver information about command processing."

    #Write-Debug "Use this cmdlet to write debug information while troubleshooting."


    <#
    $returnValue = @{
    Ensure = [System.String]
    Name = [System.String]
    queueLength = [System.String]
    autoStart = [System.String]
    enable32BitAppOnWin64 = [System.String]
    managedRuntimeVersion = [System.String]
    managedRuntimeLoader = [System.String]
    enableConfigurationOverride = [System.String]
    managedPipelineMode = [System.String]
    CLRConfigFile = [System.String]
    passAnonymousToken = [System.String]
    startMode = [System.String]
    identityType = [System.String]
    userName = [System.String]
    Password = [System.Management.Automation.PSCredential]
    loadUserProfile = [System.String]
    setProfileEnvironment = [System.String]
    logonType = [System.String]
    manualGroupMembership = [System.String]
    idleTimeout = [System.String]
    idleTimeoutAction = [System.String]
    maxProcesses = [System.String]
    shutdownTimeLimit = [System.String]
    startupTimeLimit = [System.String]
    pingingEnabled = [System.String]
    pingInterval = [System.String]
    pingResponseTime = [System.String]
    disallowOverlappingRotation = [System.String]
    disallowRotationOnConfigChange = [System.String]
    logEventOnRecycle = [System.String]
    memory = [System.String]
    privateMemory = [System.String]
    requests = [System.String]
    time = [System.String]
    schedule = [Microsoft.Management.Infrastructure.CimInstance[]]
    loadBalancerCapabilities = [System.String]
    orphanWorkerProcess = [System.String]
    orphanActionExe = [System.String]
    orphanActionParams = [System.String]
    rapidFailProtection = [System.String]
    rapidFailProtectionInterval = [System.String]
    rapidFailProtectionMaxCrashes = [System.String]
    autoShutdownExe = [System.String]
    autoShutdownParams = [System.String]
    limit = [System.String]
    action = [System.String]
    resetInterval = [System.String]
    smpAffinitized = [System.String]
    smpProcessorAffinityMask = [System.String]
    smpProcessorAffinityMask2 = [System.String]
    processorGroup = [System.String]
    numaNodeAssignment = [System.String]
    numaNodeAffinityMode = [System.String]
    }

    $returnValue
    #>
}


function Set-TargetResource
{
    [CmdletBinding()]
    param
    (
        [ValidateSet("Present","Absent")]
        [System.String]
        $Ensure,

        [parameter(Mandatory = $true)]
        [System.String]
        $Name,

        [System.String]
        $queueLength,

        [System.String]
        $autoStart,

        [ValidateSet("true","false")]
        [System.String]
        $enable32BitAppOnWin64,

        [ValidateSet("v4.0","v2.0","")]
        [System.String]
        $managedRuntimeVersion,

        [System.String]
        $managedRuntimeLoader,

        [ValidateSet("true","false")]
        [System.String]
        $enableConfigurationOverride,

        [ValidateSet("Integrated","Classic")]
        [System.String]
        $managedPipelineMode,

        [System.String]
        $CLRConfigFile,

        [ValidateSet("true","false")]
        [System.String]
        $passAnonymousToken,

        [ValidateSet("AlwaysRunning","OnDemand")]
        [System.String]
        $startMode,

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

        [ValidateSet("true","false")]
        [System.String]
        $setProfileEnvironment,

        [ValidateSet("LogonBatch","LogonService")]
        [System.String]
        $logonType,

        [ValidateSet("true","false")]
        [System.String]
        $manualGroupMembership,

        [System.String]
        $idleTimeout,

        [ValidateSet("Terminate","Suspend")]
        [System.String]
        $idleTimeoutAction,

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
        $memory,

        [System.String]
        $privateMemory,

        [System.String]
        $requests,

        [System.String]
        $time,

        [Microsoft.Management.Infrastructure.CimInstance[]]
        $schedule,

        [ValidateSet("HttpLevel","TcpLevel")]
        [System.String]
        $loadBalancerCapabilities,

        [ValidateSet("true","false")]
        [System.String]
        $orphanWorkerProcess,

        [System.String]
        $orphanActionExe,

        [System.String]
        $orphanActionParams,

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

        [System.String]
        $limit,

        [ValidateSet("NoAcion","KillW3wp","Throttle","ThrottleUnderLoad")]
        [System.String]
        $action,

        [System.String]
        $resetInterval,

        [ValidateSet("true","false")]
        [System.String]
        $smpAffinitized,

        [System.String]
        $smpProcessorAffinityMask,

        [System.String]
        $smpProcessorAffinityMask2,

        [System.String]
        $processorGroup,

        [ValidateSet("MostAvailableMemory","WindowsScheduling")]
        [System.String]
        $numaNodeAssignment,

        [ValidateSet("Soft","Hard")]
        [System.String]
        $numaNodeAffinityMode
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
        [ValidateSet("Present","Absent")]
        [System.String]
        $Ensure,

        [parameter(Mandatory = $true)]
        [System.String]
        $Name,

        [System.String]
        $queueLength,

        [System.String]
        $autoStart,

        [ValidateSet("true","false")]
        [System.String]
        $enable32BitAppOnWin64,

        [ValidateSet("v4.0","v2.0","")]
        [System.String]
        $managedRuntimeVersion,

        [System.String]
        $managedRuntimeLoader,

        [ValidateSet("true","false")]
        [System.String]
        $enableConfigurationOverride,

        [ValidateSet("Integrated","Classic")]
        [System.String]
        $managedPipelineMode,

        [System.String]
        $CLRConfigFile,

        [ValidateSet("true","false")]
        [System.String]
        $passAnonymousToken,

        [ValidateSet("AlwaysRunning","OnDemand")]
        [System.String]
        $startMode,

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

        [ValidateSet("true","false")]
        [System.String]
        $setProfileEnvironment,

        [ValidateSet("LogonBatch","LogonService")]
        [System.String]
        $logonType,

        [ValidateSet("true","false")]
        [System.String]
        $manualGroupMembership,

        [System.String]
        $idleTimeout,

        [ValidateSet("Terminate","Suspend")]
        [System.String]
        $idleTimeoutAction,

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
        $memory,

        [System.String]
        $privateMemory,

        [System.String]
        $requests,

        [System.String]
        $time,

        [Microsoft.Management.Infrastructure.CimInstance[]]
        $schedule,

        [ValidateSet("HttpLevel","TcpLevel")]
        [System.String]
        $loadBalancerCapabilities,

        [ValidateSet("true","false")]
        [System.String]
        $orphanWorkerProcess,

        [System.String]
        $orphanActionExe,

        [System.String]
        $orphanActionParams,

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

        [System.String]
        $limit,

        [ValidateSet("NoAcion","KillW3wp","Throttle","ThrottleUnderLoad")]
        [System.String]
        $action,

        [System.String]
        $resetInterval,

        [ValidateSet("true","false")]
        [System.String]
        $smpAffinitized,

        [System.String]
        $smpProcessorAffinityMask,

        [System.String]
        $smpProcessorAffinityMask2,

        [System.String]
        $processorGroup,

        [ValidateSet("MostAvailableMemory","WindowsScheduling")]
        [System.String]
        $numaNodeAssignment,

        [ValidateSet("Soft","Hard")]
        [System.String]
        $numaNodeAffinityMode
    )

    #Write-Verbose "Use this cmdlet to deliver information about command processing."

    #Write-Debug "Use this cmdlet to write debug information while troubleshooting."


    <#
    $result = [System.Boolean]
    
    $result
    #>
}


Export-ModuleMember -Function *-TargetResource

