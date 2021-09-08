# Find deleted object
Get-ADObject -Filter 'Name -like "*Developers*"' –IncludeDeletedObjects

# Restore object by ObjectGUID
Restore-ADObject -Identity ‘aa704b7f-b003-4a21-8f62-53c75caa67b2'

# Restore User
Get-ADObject -Filter 'SAMAccountName -eq "MirageSmith"' –IncludeDeletedObjects | Restore-ADObject

# Restore Group
Get-ADObject -Filter { Deleted -eq $True -and ObjectClass -eq 'group' -and Name -like '*Developers*' } –IncludeDeletedObjects| Restore-ADObject –verbose

# Restore Computer
Get-ADObject -Filter { Deleted -eq $True -and ObjectClass -eq 'computer' -and Name -like '*FrontIIS_2*' } –IncludeDeletedObjects | Restore-ADObject –verbose

# Restore OU
Get-ADObject -Filter {Deleted -eq $True -and ObjectClass -eq 'organizationalunit' -and Name -like '*ITAdmins*'} –IncludeDeletedObjects| Restore-ADObject

# Restore nested OU's
Get-ADObject -Filter {Deleted -eq $True -and ObjectClass -eq 'organizationalunit' -and LastKnownParent -eq 'OU=ITAdmins,DC=myadforest,DC=local'} –IncludeDeletedObjects| Restore-ADObject

# Restore OU's nested objects
Get-ADObject -Filter {Deleted -eq $True} –IncludeDeletedObjects -Properties *| Where-Object LastKnownParent -like '*OU=ITAdmins,DC=myadforest,DC=local'| Restore-ADObject