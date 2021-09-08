/* 1. Install Active Directory Domain Services */
Install-WindowsFeature -name AD-Domain-Services -IncludeManagementTools

/* 2. Join server to existing Domain Controller */
$Password = Read-Host -Prompt   'Enter SafeMode Admin Password' -AsSecureString
$Credential = Get-Credential "myadforest.local\AdminPDC"
$Params = @{
    CreateDnsDelegation = $false
    DatabasePath = 'C:\Windows\NTDS'
    DomainName = 'myadforest.local'
    Credential = $Credential
    InstallDns = $true
    LogPath = 'C:\Windows\NTDS'
    NoRebootOnCompletion = $true
    SafeModeAdministratorPassword = $Password
    SysvolPath = 'C:\Windows\SYSVOL'
    Force = $true
}
Install-ADDSDomainController @Params