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


    # Get webModule
    Use-WebModule


    #Remove debug from params
    $psboundparameters.Remove('Debug') | Out-Null
    $psboundparameters.Remove('Verbose') | Out-Null

    #TODO - schedule fix up 
    $psboundparameters.Remove('schedule') | Out-Null

    $Ensure = 'Absent'
    $State  = 'Stopped'

    # This is to be used when we do not operate with default app pool settings.
    if($Name -ne 'applicationPoolDefaults')
    {
        
        $AppPool = Get-Item -Path IIS:\AppPools\* | Where-Object {$_.name -eq $Name}

        if($AppPool -ne $null)
        {
            Write-Verbose "[$Name] Exists"

            $Ensure = 'Present'
            $State  = $AppPool.state
        }
        else # We dont have app pool so we dont have those props!
        {
                        $returnValue = @{
                State                         = $State
                Ensure                        = $Ensure
                Name                          = $Name;
                queueLength                   = '';
                autoStart                     = '';
                enable32BitAppOnWin64         = '';
                managedRuntimeVersion         = '';
                managedRuntimeLoader          = '';
                enableConfigurationOverride   = '';
                managedPipelineMode           = '';
                CLRConfigFile                 = '';
                passAnonymousToken            = '';
                startMode                     = '';
                identityType                  = '';
                userName                      = '';
                Password                      = '';
                loadUserProfile               = '';
                setProfileEnvironment         = '';
                logonType                     = '';
                manualGroupMembership         = '';
                idleTimeout                   = '';
                idleTimeoutAction             = '';
                maxProcesses                  = '';
                shutdownTimeLimit             = '';
                startupTimeLimit              = '';
                pingingEnabled                = '';
                pingInterval                  = '';
                pingResponseTime              = '';
                disallowOverlappingRotation   = '';
                disallowRotationOnConfigChange = '';
                logEventOnRecycle             = '';
                memory                        = '';
                privateMemory                 = '';
                requests                      = '';
                time                          = '';
                schedule                      = '';# TODO - investigate schedule setup Invoke-AppPoolSetting -propertyName schedule -action get;
                loadBalancerCapabilities      = '';
                orphanWorkerProcess           = '';
                orphanActionExe               = '';
                orphanActionParams            = '';
                rapidFailProtection           = '';
                rapidFailProtectionInterval   = '';
                rapidFailProtectionMaxCrashes = '';
                autoShutdownExe               = '';
                autoShutdownParams            = '';
                limit                         = '';
                action                        = '';
                resetInterval                 = '';
                smpAffinitized                = '';
                smpProcessorAffinityMask      = '';
                smpProcessorAffinityMask2     = '';
                processorGroup                = '';
                numaNodeAssignment            = '';
                numaNodeAffinityMode          = '';
            }

            return $returnValue
        }

    
    }


    Write-Verbose "[$Name] Exists (or using default) - Retrieving info"

    Write-Verbose "Checking for app pool specified credentials : $Name"
    $appPoolUserName = Invoke-AppPoolSetting -propertyName userName -action get -appPoolName $Name

    if($appPoolUserName)
    {
                Write-Verbose "[$Name] has specific identity - creating PSCredential object"

                $AppPoolPassword = Invoke-AppPoolSetting -propertyName password -action get -appPoolName $Name | ConvertTo-SecureString -AsPlainText -Force
                $AppPoolCred     = new-object -typename System.Management.Automation.PSCredential -argumentlist $appPoolUserName,$AppPoolPassword
    }
    else
    {
                Write-Verbose "[$Name]  does not have specific identity - nothing to do here"
                $AppPoolCred =$null
    }

    
    $returnValue = @{
        State                         = $State
        Ensure                        = $Ensure
        Name                          = Invoke-AppPoolSetting -propertyName Name -action get -appPoolName $Name;
        queueLength                   = Invoke-AppPoolSetting -propertyName queueLength -action get -appPoolName $Name;
        autoStart                     = Invoke-AppPoolSetting -propertyName autoStart -action get -appPoolName $Name;
        enable32BitAppOnWin64         = Invoke-AppPoolSetting -propertyName enable32BitAppOnWin64 -action get -appPoolName $Name;
        managedRuntimeVersion         = Invoke-AppPoolSetting -propertyName managedRuntimeVersion -action get -appPoolName $Name;
        managedRuntimeLoader          = Invoke-AppPoolSetting -propertyName managedRuntimeLoader -action get -appPoolName $Name;
        enableConfigurationOverride   = Invoke-AppPoolSetting -propertyName enableConfigurationOverride -action get -appPoolName $Name;
        managedPipelineMode           = Invoke-AppPoolSetting -propertyName managedPipelineMode -action get -appPoolName $Name;
        CLRConfigFile                 = Invoke-AppPoolSetting -propertyName CLRConfigFile -action get -appPoolName $Name;
        passAnonymousToken            = Invoke-AppPoolSetting -propertyName passAnonymousToken -action get -appPoolName $Name;
        startMode                     = Invoke-AppPoolSetting -propertyName startMode -action get -appPoolName $Name;
        identityType                  = Invoke-AppPoolSetting -propertyName identityType -action get -appPoolName $Name;
        userName                      = $appPoolUserName;
        Password                      = $AppPoolPassword;
        loadUserProfile               = Invoke-AppPoolSetting -propertyName loadUserProfile -action get -appPoolName $Name;
        setProfileEnvironment         = Invoke-AppPoolSetting -propertyName setProfileEnvironment -action get -appPoolName $Name;
        logonType                     = Invoke-AppPoolSetting -propertyName logonType -action get -appPoolName $Name;
        manualGroupMembership         = Invoke-AppPoolSetting -propertyName manualGroupMembership -action get -appPoolName $Name;
        idleTimeout                   = Invoke-AppPoolSetting -propertyName idleTimeout -action get -appPoolName $Name;
        idleTimeoutAction             = Invoke-AppPoolSetting -propertyName idleTimeoutAction -action get -appPoolName $Name;
        maxProcesses                  = Invoke-AppPoolSetting -propertyName maxProcesses -action get -appPoolName $Name;
        shutdownTimeLimit             = Invoke-AppPoolSetting -propertyName shutdownTimeLimit -action get -appPoolName $Name;
        startupTimeLimit              = Invoke-AppPoolSetting -propertyName startupTimeLimit -action get -appPoolName $Name;
        pingingEnabled                = Invoke-AppPoolSetting -propertyName pingingEnabled -action get -appPoolName $Name;
        pingInterval                  = Invoke-AppPoolSetting -propertyName pingInterval -action get -appPoolName $Name;
        pingResponseTime              = Invoke-AppPoolSetting -propertyName pingResponseTime -action get -appPoolName $Name;
        disallowOverlappingRotation   = Invoke-AppPoolSetting -propertyName disallowOverlappingRotation -action get -appPoolName $Name;
        disallowRotationOnConfigChange = Invoke-AppPoolSetting -propertyName disallowRotationOnConfigChange -action get -appPoolName $Name;
        logEventOnRecycle             = Invoke-AppPoolSetting -propertyName logEventOnRecycle -action get -appPoolName $Name;
        memory                        = Invoke-AppPoolSetting -propertyName memory -action get -appPoolName $Name;
        privateMemory                 = Invoke-AppPoolSetting -propertyName privateMemory -action get -appPoolName $Name;
        requests                      = Invoke-AppPoolSetting -propertyName requests -action get -appPoolName $Name;
        time                          = Invoke-AppPoolSetting -propertyName time -action get -appPoolName $Name;
        schedule                      = '';# TODO - investigate schedule setup Invoke-AppPoolSetting -propertyName schedule -action get;
        loadBalancerCapabilities      = Invoke-AppPoolSetting -propertyName loadBalancerCapabilities -action get -appPoolName $Name;
        orphanWorkerProcess           = Invoke-AppPoolSetting -propertyName orphanWorkerProcess -action get -appPoolName $Name;
        orphanActionExe               = Invoke-AppPoolSetting -propertyName orphanActionExe -action get -appPoolName $Name;
        orphanActionParams            = Invoke-AppPoolSetting -propertyName orphanActionParams -action get -appPoolName $Name;
        rapidFailProtection           = Invoke-AppPoolSetting -propertyName rapidFailProtection -action get -appPoolName $Name;
        rapidFailProtectionInterval   = Invoke-AppPoolSetting -propertyName rapidFailProtectionInterval -action get -appPoolName $Name;
        rapidFailProtectionMaxCrashes = Invoke-AppPoolSetting -propertyName rapidFailProtectionMaxCrashes -action get -appPoolName $Name;
        autoShutdownExe               = Invoke-AppPoolSetting -propertyName autoShutdownExe -action get -appPoolName $Name;
        autoShutdownParams            = Invoke-AppPoolSetting -propertyName autoShutdownParams -action get -appPoolName $Name;
        limit                         = Invoke-AppPoolSetting -propertyName limit -action get -appPoolName $Name;
        action                        = Invoke-AppPoolSetting -propertyName action -action get -appPoolName $Name;
        resetInterval                 = Invoke-AppPoolSetting -propertyName resetInterval -action get -appPoolName $Name;
        smpAffinitized                = Invoke-AppPoolSetting -propertyName smpAffinitized -action get -appPoolName $Name;
        smpProcessorAffinityMask      = Invoke-AppPoolSetting -propertyName smpProcessorAffinityMask -action get -appPoolName $Name;
        smpProcessorAffinityMask2     = Invoke-AppPoolSetting -propertyName smpProcessorAffinityMask2 -action get -appPoolName $Name;
        processorGroup                = Invoke-AppPoolSetting -propertyName processorGroup -action get -appPoolName $Name;
        numaNodeAssignment            = Invoke-AppPoolSetting -propertyName numaNodeAssignment -action get -appPoolName $Name;
        numaNodeAffinityMode          = Invoke-AppPoolSetting -propertyName numaNodeAffinityMode -action get -appPoolName $Name;
    }

    Write-Verbose "[$Name] Returning info"

    $returnValue

}

function Set-TargetResource
{
    [CmdletBinding()]
    param
    (
        [ValidateSet('Present','Absent')]
        [System.String]
        $Ensure = 'Present',

        [ValidateSet('Started','Stopped')]
        [System.String]
        $State = 'Started',

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

    # Get webModule
    Use-WebModule
    

    # Gets resource details
    $AppPool = Get-TargetResource -Name $Name     

    if( $Name -ne 'applicationPoolDefaults' -and $Ensure -eq 'Absent' -and $AppPool.Ensure -eq 'Present')
    {
            Write-Verbose('Removing the Web App Pool')
            Remove-WebAppPool $Name

            return; # As we have nothing else to make sure for this app ?
    }
    else
    {                        

        if( $Name -ne 'applicationPoolDefaults' -and $Ensure -eq 'Present')
        {
            if($AppPool.Ensure -ne 'Present')
            {
                Write-Verbose('Creating the Web App Pool')
                New-WebAppPool $Name
                $AppPool = Get-TargetResource -Name $Name
            }

            if($AppPool.State -ne $State)
            {
                Set-AppPlState -Name $Name -State $State  # Sets desired app pool state
            }
        }

    
    }


    if($AppPool.Ensure -ne 'Absent')
    {
            # Since we potentially looking at a lot of props we can delay commit!
            Start-WebCommitDelay

            # After all of creation/removal we go with parameters        
            foreach($psbp in $PSBoundParameters.GetEnumerator())
            {
        
                  # We get current value
                  $currValue = $AppPool.($psbp.Key)
                             
                  # We get current status and compare it with desired state  
                  if( $currValue -ne $psbp.Value )
                  {
                        Write-Verbose "Setting value for $( $psbp.Key ) to $( $psbp.Value ) for $Name"
                        Invoke-AppPoolSetting -propertyName $psbp.Key -value $psbp.Value -action set -appPoolName $Name
                  }


            }

            Stop-WebCommitDelay -Commit $true
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
        $numaNodeAffinityMode,

        [ValidateSet('Present','Absent')]
        [System.String]
        $Ensure = 'Present',

        [ValidateSet('Started','Stopped')]
        [System.String]
        $State = 'Started'
    )

    #Remove debug from params
    $psboundparameters.Remove('Debug') | Out-Null
    $psboundparameters.Remove('Verbose') | Out-Null

    #TODO - schedule fix up 
    $psboundparameters.Remove('schedule') | Out-Null

    # Set default result of test
    $DesiredConfigurationMatch = $true

    # Get webModule
    Use-WebModule


    Write-Verbose "Primary key:  $Name"

    # Our current App Pool state
    $AppPoolSnapShot =  Get-TargetResource -Name $Name


    if( $Name -ne 'applicationPoolDefaults' -and $Ensure -ne $AppPoolSnapShot.Ensure  -or $Ensure -eq 'Absent')
    {
            return $false
    }

    Write-Verbose 'fak'

        #Enumerate all params and info if necessary 
        foreach($psbp in $PSBoundParameters.GetEnumerator())
        {
        
              # We get current value
              $currValue = $AppPoolSnapShot.($psbp.Key)
                             
              # We get current status and compare it with desired state  
              if( $currValue -ne $psbp.Value )
              {
                    Write-Verbose "Value for $( $psbp.Key ) [ $currValue ]  does not match the desired state [$( $psbp.Value )]"

                    $DesiredConfigurationMatch = $false
              }
              else
              {
                     Write-Verbose "Value for $( $psbp.Key ) [ $currValue ]  does match the desired state [$( $psbp.Value )]"
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
        
        name                        = @{ ns = 'system.applicationHost/applicationPools/{0}'; type = ''         }
        queueLength                 = @{ ns = 'system.applicationHost/applicationPools/{0}'; type = 'System.Int32'}
        autoStart                   = @{ ns = 'system.applicationHost/applicationPools/{0}'; type = ''         }
        enable32BitAppOnWin64       = @{ ns = 'system.applicationHost/applicationPools/{0}'; type = ''         }
        managedRuntimeVersion       = @{ ns = 'system.applicationHost/applicationPools/{0}'; type = ''         }
        managedRuntimeLoader        = @{ ns = 'system.applicationHost/applicationPools/{0}'; type = ''         }
        enableConfigurationOverride = @{ ns = 'system.applicationHost/applicationPools/{0}'; type = ''         }
        managedPipelineMode         = @{ ns = 'system.applicationHost/applicationPools/{0}'; type = ''         }
        CLRConfigFile               = @{ ns = 'system.applicationHost/applicationPools/{0}'; type = ''         }
        passAnonymousToken          = @{ ns = 'system.applicationHost/applicationPools/{0}'; type = ''         }
        startMode                   = @{ ns = 'system.applicationHost/applicationPools/{0}'; type = ''         }
        identityType                = @{ ns ='system.applicationHost/applicationPools/{0}/processModel'; type = ''  };
        userName                    = @{ ns ='system.applicationHost/applicationPools/{0}/processModel'; type = ''  };
        password                    = @{ ns ='system.applicationHost/applicationPools/{0}/processModel'; type = ''  };
        loadUserProfile             = @{ ns ='system.applicationHost/applicationPools/{0}/processModel'; type = ''  };
        setProfileEnvironment       = @{ ns ='system.applicationHost/applicationPools/{0}/processModel'; type = ''  };
        logonType                   = @{ ns ='system.applicationHost/applicationPools/{0}/processModel'; type = ''  };
        manualGroupMembership       = @{ ns ='system.applicationHost/applicationPools/{0}/processModel'; type = ''  };
        idleTimeout                 = @{ ns ='system.applicationHost/applicationPools/{0}/processModel'; type = 'System.TimeSpan'  };
        idleTimeoutAction           = @{ ns ='system.applicationHost/applicationPools/{0}/processModel'; type = ''  };
        maxProcesses                = @{ ns ='system.applicationHost/applicationPools/{0}/processModel'; type = 'System.Int64'  };
        shutdownTimeLimit           = @{ ns ='system.applicationHost/applicationPools/{0}/processModel'; type = 'System.TimeSpan'  };
        startupTimeLimit            = @{ ns ='system.applicationHost/applicationPools/{0}/processModel'; type = 'System.TimeSpan'  };
        pingingEnabled              = @{ ns ='system.applicationHost/applicationPools/{0}/processModel'; type = ''  };
        pingInterval                = @{ ns ='system.applicationHost/applicationPools/{0}/processModel'; type = 'System.TimeSpan'  };
        pingResponseTime            = @{ ns ='system.applicationHost/applicationPools/{0}/processModel'; type = 'System.TimeSpan'  };
        disallowOverlappingRotation    = @{ ns ='system.applicationHost/applicationPools/{0}/recycling'; type = ''  };
        disallowRotationOnConfigChange = @{ ns ='system.applicationHost/applicationPools/{0}/recycling'; type = ''  };
        logEventOnRecycle              = @{ ns ='system.applicationHost/applicationPools/{0}/recycling'; type = ''  };
        memory                         = @{ ns ='system.applicationHost/applicationPools/{0}/recycling/periodicRestart'; type = ''  };
        privateMemory                  = @{ ns ='system.applicationHost/applicationPools/{0}/recycling/periodicRestart'; type = ''  };
        requests                       = @{ ns ='system.applicationHost/applicationPools/{0}/recycling/periodicRestart'; type = ''  };
        time                           = @{ ns ='system.applicationHost/applicationPools/{0}/recycling/periodicRestart'; type = ''  };
        schedule                       = @{ ns ='system.applicationHost/applicationPools/{0}/recycling/periodicRestart/schedule'; type = ''  };
        loadBalancerCapabilities      = @{ ns ='system.applicationHost/applicationPools/{0}/failure'; type = ''  };
        orphanWorkerProcess           = @{ ns ='system.applicationHost/applicationPools/{0}/failure'; type = ''  };
        orphanActionExe               = @{ ns ='system.applicationHost/applicationPools/{0}/failure'; type = ''  };
        orphanActionParams            = @{ ns ='system.applicationHost/applicationPools/{0}/failure'; type = ''  };
        rapidFailProtection           = @{ ns ='system.applicationHost/applicationPools/{0}/failure'; type = ''  };
        rapidFailProtectionInterval   = @{ ns ='system.applicationHost/applicationPools/{0}/failure'; type = ''  };
        rapidFailProtectionMaxCrashes = @{ ns ='system.applicationHost/applicationPools/{0}/failure'; type = 'System.Int64'  };
        autoShutdownExe               = @{ ns ='system.applicationHost/applicationPools/{0}/failure'; type = ''  };
        autoShutdownParams            = @{ ns ='system.applicationHost/applicationPools/{0}/failure'; type = ''  };
        limit                     = @{ ns ='system.applicationHost/applicationPools/{0}/cpu'; type = 'ystem.Int64'  };
        action                    = @{ ns ='system.applicationHost/applicationPools/{0}/cpu'; type = ''  };
        resetInterval             = @{ ns ='system.applicationHost/applicationPools/{0}/cpu'; type = 'System.TimeSpan'  };
        smpAffinitized            = @{ ns ='system.applicationHost/applicationPools/{0}/cpu'; type = ''  };
        smpProcessorAffinityMask  = @{ ns ='system.applicationHost/applicationPools/{0}/cpu'; type = 'System.Int64'  };
        smpProcessorAffinityMask2 = @{ ns ='system.applicationHost/applicationPools/{0}/cpu'; type = 'System.Int64'  };
        processorGroup            = @{ ns ='system.applicationHost/applicationPools/{0}/cpu'; type = 'System.Int32'  };
        numaNodeAssignment        = @{ ns ='system.applicationHost/applicationPools/{0}/cpu'; type = ''  };
        numaNodeAffinityMode      = @{ ns ='system.applicationHost/applicationPools/{0}/cpu'; type = ''  };
        
    } 


    # Create target app pool name 
    if( [string]::IsNullOrEmpty($appPoolName) -or $appPoolName -eq 'applicationPoolDefaults' ) { $targetAppName = 'applicationPoolDefaults' } else { $targetAppName = [string]::Format("add[@name='{0}']",$appPoolName ) }
    
    switch ($action)
    {
        'get'        {                        
                        # gets value
                        
                        try
                        {
                          $res =  (Get-WebConfigurationProperty -pspath 'MACHINE/WEBROOT/APPHOST'  -filter $( $NamespaceMapping[ $propertyName ].ns -f $targetAppName ) -name $propertyName)
                          
                          

                          #We need to distinguish from simple value type to complex value types
                          if ( $res.GetType().Name -eq 'ConfigurationAttribute')
                          {
                            
                            Write-Debug "Retrieved property $propertyName appPool $Name with value $( $res.Value.ToString() )"

                            return $res.Value.ToString()
                          }
                          else
                          {

                            
                            Write-Debug "Retrieved property $propertyName appPool $Name with value $( $res.ToString() )"
                           
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

                          # get type... 
                          if(-not [string]::IsNullOrEmpty($NamespaceMapping[ $propertyName ].type) )
                          {                             
                            $value = $value -as ( $NamespaceMapping[ $propertyName ].type )
                          }


                          Set-WebConfigurationProperty -pspath 'MACHINE/WEBROOT/APPHOST'  -filter $( $NamespaceMapping[ $propertyName ].ns -f $targetAppName ) -name $propertyName -Value $value
                        
                        }
                        catch
                        {
                            Throw "Could not set property $propertyName with value $value for appPool $Name"
                        }

                       

                   }
    }
}

# Sets application pool state
function Set-AppPlState
{
     param
     (
         [string]
         $Name,

         [string]
         $State
     )

    if($State -eq 'Started')
    {
        Write-Verbose('Starting the Web App Pool')
        start-WebAppPool -Name $Name
    }
    else
    {
        Write-Verbose('Stopping the Web App Pool')
        Stop-WebAppPool -Name $Name
    }
}

# function to check module
function Use-WebModule
{

        if (-not (Get-Module WebAdministration -ListAvailable))
        { 
            

           try
           {
               (Import-Module WebAdministration -Force ) | Out-Null
           } 
           catch
           {
                Throw 'Please ensure that WebAdministration module is installed and can be loaded!'
           }

           Throw 'Please ensure that WebAdministration module is installed and can be loaded!'

           <#
           try
           {
               (Import-Module WebAdministration -Force ) | Out-Null
           } 
           catch
           {
                Throw 'Please ensure that WebAdministration module is installed and can be loaded!'
           }
        }
        #>
        }
    
}

Export-ModuleMember -Function *-TargetResource

