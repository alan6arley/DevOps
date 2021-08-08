# Create a password object
$PasswordProfile = New-Object -TypeName Microsoft.Open.AzureAD.Model.PasswordProfile

# Set the password
$PasswordProfile.Password = "<Password>"

# Create the new user 
New-AzureADUser -AccountEnabled $True -DisplayName "Chris Blue" -PasswordProfile $PasswordProfile -MailNickName "ChrisBlue" -UserPrincipalName "ChrisBlue01@myneworgdomainname.onmicrosoft.com"