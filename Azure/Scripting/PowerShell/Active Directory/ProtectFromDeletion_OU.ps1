get-ADOrganizationalUnit -Identity "OU=ITAdmins,DC=myadforest,DC=local" | 
set-ADOrganizationalUnit â€“ProtectedFromAccidentalDeletion $false