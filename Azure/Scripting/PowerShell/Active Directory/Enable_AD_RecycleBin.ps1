# Change -Server param value to your server name
Enable-ADOptionalFeature -Identity 'Recycle Bin Feature' -Scope ForestOrConfigurationSet -Target ‘myadforest.local’ -Server PdcVm