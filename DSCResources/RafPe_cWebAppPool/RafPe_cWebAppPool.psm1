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
        [ValidateSet("Present","Absent")]
        [System.String]
        $Ensure,

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
        [ValidateSet("Present","Absent")]
        [System.String]
        $Ensure,

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


Export-ModuleMember -Function *-TargetResource

