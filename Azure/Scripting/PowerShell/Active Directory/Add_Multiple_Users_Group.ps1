# Loads the data from the csv file in a variable
$Users = Import-Csv "C:\MyWindowsUser\Add_Multiple_Users_Group.csv"

# Specify group name, you can add the distinguishedName too. Example: CN=Builtin,DC=myadforest,DC=local
$Group = "Developers" 

foreach ($User in $Users) {
    $UPN = $User.UserPrincipalName

    $ADUser = Get-ADUser -Filter "UserPrincipalName -eq '$UPN'" | Select-Object SamAccountName

    # Check if user exists
    if ($ADUser -eq $null) {
        Write-Host "$UPN does not exist in AD" -ForegroundColor Red
    }
    else {
        $ExistingGroups = Get-ADPrincipalGroupMembership $ADUser.SamAccountName | Select-Object Name

        # Check if user is already member of the group, else adds it to the group
        if ($ExistingGroups.Name -eq $Group) {
            Write-Host "$UPN already exists in $Group" -ForeGroundColor Yellow
        }
        else {
            Add-ADGroupMember -Identity $Group -Members $ADUser.SamAccountName 
            Write-Host "Added $UPN to $Group" -ForeGroundColor Green
        }
    }
}
Read-Host -Prompt "Press any key to exit"