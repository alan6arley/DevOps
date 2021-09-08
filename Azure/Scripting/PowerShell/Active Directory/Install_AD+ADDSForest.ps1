/* 1. Install Active Directory Domain Services */
Install-WindowsFeature -name AD-Domain-Services -IncludeManagementTools

/* 2. Create an Active Directory Forest */
$Password = Read-Host -Prompt   'Enter SafeMode Admin Password' -AsSecureString
$Params = @{
    CreateDnsDelegation = $false
    DatabasePath = 'C:\Windows\NTDS'
    DomainMode = 'WinThreshold'
    DomainName = 'myadforest.local'
    DomainNetbiosName = 'myadforest'
    ForestMode = 'WinThreshold'
    InstallDns = $true
    LogPath = 'C:\Windows\NTDS'
    NoRebootOnCompletion = $true
    SafeModeAdministratorPassword = $Password
    SysvolPath = 'C:\Windows\SYSVOL'
    Force = $true
}
Install-ADDSForest @Params