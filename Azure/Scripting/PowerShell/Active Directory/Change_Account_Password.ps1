﻿Set-ADAccountPassword -Identity 'CN=Mirage Smith,CN=Users,DC=myadforest,DC=local' -Reset -NewPassword (ConvertTo-SecureString -AsPlainText "UserNewPwd_169$" -Force)