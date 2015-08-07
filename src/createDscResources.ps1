   $Ensure                         = New-xDscResourceProperty -Name Ensure -Type String -Attribute Write -ValidateSet "Present", "Absent"   
   $name                           = New-xDscResourceProperty –Name Name –Type string –Attribute Key
   $queueLength                    = New-xDscResourceProperty –Name queueLength –Type String –Attribute Write
   $autoStart                      = New-xDscResourceProperty –Name autoStart –Type string –Attribute Write
   $enable32BitAppOnWin64          = New-xDscResourceProperty –Name enable32BitAppOnWin64 –Type string –Attribute Write -ValidateSet "true","false"
   $managedRuntimeVersion          = New-xDscResourceProperty –Name managedRuntimeVersion –Type string –Attribute Write -ValidateSet "v4.0","v2.0",""
   $managedRuntimeLoader           = New-xDscResourceProperty –Name managedRuntimeLoader –Type string –Attribute Write
   $enableConfigurationOverride    = New-xDscResourceProperty –Name enableConfigurationOverride –Type string –Attribute Write  -ValidateSet "true","false"
   $managedPipelineMode            = New-xDscResourceProperty –Name managedPipelineMode –Type string –Attribute Write -ValidateSet "Integrated","Classic"
   $CLRConfigFile                  = New-xDscResourceProperty –Name CLRConfigFile –Type string –Attribute Write
   $passAnonymousToken             = New-xDscResourceProperty –Name passAnonymousToken –Type string –Attribute Write -ValidateSet "true","false"
   $startMode                      = New-xDscResourceProperty –Name startMode –Type string –Attribute Write -ValidateSet "AlwaysRunning","OnDemand"
   $identityType                   = New-xDscResourceProperty –Name identityType –Type string –Attribute Write -ValidateSet "ApplicationPoolIdentity","LocalSystem","LocalService","NetworkService","SpecificUser"
   $userName                       = New-xDscResourceProperty –Name userName –Type string –Attribute Write
   $password                       = New-xDscResourceProperty –Name Password –Type PSCredential –Attribute Write
   $loadUserProfile                = New-xDscResourceProperty –Name loadUserProfile –Type string –Attribute Write -ValidateSet "true","false"
   $setProfileEnvironment          = New-xDscResourceProperty –Name setProfileEnvironment –Type string –Attribute Write -ValidateSet "true","false"
   $logonType                      = New-xDscResourceProperty –Name logonType –Type string –Attribute Write -ValidateSet "LogonBatch","LogonService"
   $manualGroupMembership          = New-xDscResourceProperty –Name manualGroupMembership –Type string –Attribute Write  -ValidateSet "true","false"
   $idleTimeout                    = New-xDscResourceProperty –Name idleTimeout –Type string –Attribute Write
   $idleTimeoutAction              = New-xDscResourceProperty –Name idleTimeoutAction –Type string –Attribute Write -ValidateSet "Terminate","Suspend"
   $maxProcesses                   = New-xDscResourceProperty –Name maxProcesses –Type string –Attribute Write
   $shutdownTimeLimit              = New-xDscResourceProperty –Name shutdownTimeLimit –Type string –Attribute Write
   $startupTimeLimit               = New-xDscResourceProperty –Name startupTimeLimit –Type string –Attribute Write
   $pingingEnabled                 = New-xDscResourceProperty –Name pingingEnabled –Type string –Attribute Write -ValidateSet "true","false"
   $pingInterval                   = New-xDscResourceProperty –Name pingInterval –Type string –Attribute Write
   $pingResponseTime               = New-xDscResourceProperty –Name pingResponseTime –Type string –Attribute Write
   $disallowOverlappingRotation    = New-xDscResourceProperty –Name disallowOverlappingRotation –Type string –Attribute Write -ValidateSet "true","false"
   $disallowRotationOnConfigChange = New-xDscResourceProperty –Name disallowRotationOnConfigChange –Type string –Attribute Write -ValidateSet "true","false"
   $logEventOnRecycle              = New-xDscResourceProperty –Name logEventOnRecycle –Type string –Attribute Write
   $memory                         = New-xDscResourceProperty –Name memory –Type string –Attribute Write
   $privateMemory                  = New-xDscResourceProperty –Name privateMemory –Type string –Attribute Write
   $requests                       = New-xDscResourceProperty –Name requests –Type string –Attribute Write
   $time                           = New-xDscResourceProperty –Name time –Type String –Attribute Write
   $schedule                       = New-xDscResourceProperty –Name schedule –Type Hashtable[] –Attribute Write
   $loadBalancerCapabilities       = New-xDscResourceProperty –Name loadBalancerCapabilities –Type string –Attribute Write -ValidateSet "HttpLevel","TcpLevel"
   $orphanWorkerProcess            = New-xDscResourceProperty –Name orphanWorkerProcess –Type string –Attribute Write -ValidateSet "true","false"
   $orphanActionExe                = New-xDscResourceProperty –Name orphanActionExe –Type string –Attribute Write
   $orphanActionParams             = New-xDscResourceProperty –Name orphanActionParams –Type string –Attribute Write
   $rapidFailProtection            = New-xDscResourceProperty –Name rapidFailProtection –Type string –Attribute Write -ValidateSet "true","false"
   $rapidFailProtectionInterval    = New-xDscResourceProperty –Name rapidFailProtectionInterval –Type string –Attribute Write
   $rapidFailProtectionMaxCrashes  = New-xDscResourceProperty –Name rapidFailProtectionMaxCrashes –Type string –Attribute Write
   $autoShutdownExe                = New-xDscResourceProperty –Name autoShutdownExe –Type string –Attribute Write
   $autoShutdownParams             = New-xDscResourceProperty –Name autoShutdownParams –Type string –Attribute Write
   $limit                          = New-xDscResourceProperty –Name limit –Type string –Attribute Write
   $action                         = New-xDscResourceProperty –Name action –Type string –Attribute Write -ValidateSet "NoAcion","KillW3wp","Throttle",'ThrottleUnderLoad'
   $resetInterval                  = New-xDscResourceProperty –Name resetInterval –Type string –Attribute Write
   $smpAffinitized                 = New-xDscResourceProperty –Name smpAffinitized –Type string –Attribute Write -ValidateSet "true","false"
   $smpProcessorAffinityMask       = New-xDscResourceProperty –Name smpProcessorAffinityMask –Type string –Attribute Write
   $smpProcessorAffinityMask2      = New-xDscResourceProperty –Name smpProcessorAffinityMask2 –Type string –Attribute Write
   $processorGroup                 = New-xDscResourceProperty –Name processorGroup –Type string –Attribute Write
   $numaNodeAssignment             = New-xDscResourceProperty –Name numaNodeAssignment –Type string –Attribute Write -ValidateSet "MostAvailableMemory","WindowsScheduling"
   $numaNodeAffinityMode           = New-xDscResourceProperty –Name numaNodeAffinityMode –Type string –Attribute Write -ValidateSet "Soft","Hard"


#array to hold our properties

$xDscProperties =@(
       $name,
       $queueLength,
       $autoStart,
       $enable32BitAppOnWin64,
       $managedRuntimeVersion,
       $managedRuntimeLoader,
       $enableConfigurationOverride,
       $managedPipelineMode,
       $CLRConfigFile,
       $passAnonymousToken,
       $startMode,
       $identityType,
       $userName,
       $password,
       $loadUserProfile,
       $setProfileEnvironment,
       $logonType,
       $manualGroupMembership,
       $idleTimeout,
       $idleTimeoutAction,
       $maxProcesses,
       $shutdownTimeLimit,
       $startupTimeLimit,
       $pingingEnabled,
       $pingInterval,
       $pingResponseTime,
       $disallowOverlappingRotation,
       $disallowRotationOnConfigChange,
       $logEventOnRecycle,
       $memory,
       $privateMemory,
       $requests,
       $time,
       $schedule,
       $loadBalancerCapabilities,
       $orphanWorkerProcess,
       $orphanActionExe,
       $orphanActionParams,
       $rapidFailProtection,
       $rapidFailProtectionInterval,
       $rapidFailProtectionMaxCrashes,
       $autoShutdownExe,
       $autoShutdownParams,
       $limit,
       $action,
       $resetInterval,
       $smpAffinitized,
       $smpProcessorAffinityMask,
       $smpProcessorAffinityMask2,
       $processorGroup,
       $numaNodeAssignment,
       $numaNodeAffinityMode             
    )

$xDscProperties2 =@(
       $Ensure
       $name,
       $queueLength,
       $autoStart,
       $enable32BitAppOnWin64,
       $managedRuntimeVersion,
       $managedRuntimeLoader,
       $enableConfigurationOverride,
       $managedPipelineMode,
       $CLRConfigFile,
       $passAnonymousToken,
       $startMode,
       $identityType,
       $userName,
       $password,
       $loadUserProfile,
       $setProfileEnvironment,
       $logonType,
       $manualGroupMembership,
       $idleTimeout,
       $idleTimeoutAction,
       $maxProcesses,
       $shutdownTimeLimit,
       $startupTimeLimit,
       $pingingEnabled,
       $pingInterval,
       $pingResponseTime,
       $disallowOverlappingRotation,
       $disallowRotationOnConfigChange,
       $logEventOnRecycle,
       $memory,
       $privateMemory,
       $requests,
       $time,
       $schedule,
       $loadBalancerCapabilities,
       $orphanWorkerProcess,
       $orphanActionExe,
       $orphanActionParams,
       $rapidFailProtection,
       $rapidFailProtectionInterval,
       $rapidFailProtectionMaxCrashes,
       $autoShutdownExe,
       $autoShutdownParams,
       $limit,
       $action,
       $resetInterval,
       $smpAffinitized,
       $smpProcessorAffinityMask,
       $smpProcessorAffinityMask2,
       $processorGroup,
       $numaNodeAssignment,
       $numaNodeAffinityMode             
    )

# Create resource that will be defining defaults for application pool 
New-xDscResource -Name RafPe_cWebAppPoolDefaults -FriendlyName cWebAppPoolDefaults -ModuleName cWebAdmin -Path 'C:\Program Files\WindowsPowerShell\Modules' `
                 -Property $xDscProperties  -Verbose

# Create resource that will be creating our application pool 
New-xDscResource -Name RafPe_cWebAppPool -FriendlyName cWebAppPool -ModuleName cWebAdmin -Path 'C:\Program Files\WindowsPowerShell\Modules' `
                 -Property $xDscProperties2 -Verbose




