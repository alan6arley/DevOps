get-ADOrganizationalUnit -Identity "OU=ITAdmins,DC=myadforest,DC=local" | 
set-ADOrganizationalUnit –ProtectedFromAccidentalDeletion $false