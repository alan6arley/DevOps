# Loads the data from the csv file in a variable
$UsersList = Import-Csv C:\MyWindowsUser\Create_Multiple_Users.csv -Delimiter ";"

# Define UPN
$UPN = "myadforest.local"

# Loop through each csv row
foreach ($User in $UsersList) {

    $username = $User.username
    $password = $User.password
    $firstname = $User.firstname
    $lastname = $User.lastname
    $initials = $User.initials
    $OU = $User.ou
    $email = $User.email
    $streetaddress = $User.streetaddress
    $city = $User.city
    $zipcode = $User.zipcode
    $state = $User.state
    $telephone = $User.telephone
    $jobtitle = $User.jobtitle
    $company = $User.company
    $department = $User.department

    # If user exists, else create the user, in both cases print a message
    if (Get-ADUser -F { SamAccountName -eq $username }) {
        Write-Warning "The user with name $username already exists in AD."
    }
    else {
        New-ADUser `
            -SamAccountName $username `
            -UserPrincipalName "$username@$UPN" `
            -Name "$firstname $lastname" `
            -GivenName $firstname `
            -Surname $lastname `
            -Initials $initials `
            -Enabled $True `
            -DisplayName "$lastname, $firstname" `
            -Path $OU `
            -City $city `
            -PostalCode $zipcode `
            -Company $company `
            -State $state `
            -StreetAddress $streetaddress `
            -OfficePhone $telephone `
            -EmailAddress $email `
            -Title $jobtitle `
            -Department $department `
            -AccountPassword (ConvertTo-secureString $password -AsPlainText -Force) -ChangePasswordAtLogon $True

        Write-Host "The user $username was created successfully." -ForegroundColor Green
    }
}

Read-Host -Prompt "Press any key to exit"