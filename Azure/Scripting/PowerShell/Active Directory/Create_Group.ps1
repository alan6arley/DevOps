﻿New-ADGroup -Name "DevTeam" -SamAccountName Developers -GroupCategory Security -GroupScope Global -DisplayName "Dev Team" -Path "CN=Builtin,DC=myadforest,DC=local" -Description "Group for all developers"