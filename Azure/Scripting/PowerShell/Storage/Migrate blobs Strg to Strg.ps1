# Connection Details
[String]$AzCopyPath = "C:\Program Files (x86)\Microsoft SDKs\Azure\AzCopy\AzCopy.exe"

# Params
$StorageName1 = "stname1"
$StorageKey1 = "key1=="
$StorageName2 = "stname2"
$StorageKey2 = "key2=="

[String[]] $files = "file1.txt", "file2.txt"

[String[]] $blobName = "blobname1", "blobname2"

FOR( $i = 0; $i -lt $blobName.Length; $i++)
{
    Write-Host "Copying: " $files[$i] -ForegroundColor Green
    
    $azCopyCmd = [string]::Format("""{0}"" /source:""https://{1}.blob.core.windows.net/{2}/"" /dest:""https://{3}.blob.core.windows.net/{4}/"" /Pattern:{5}  /sourcekey:""{6}"" /destkey:""{7}"" /S /Y ",$AzCopyPath,$StorageName1, $blobName[$i], $StorageName2, $blobName[$i],$files[$i], $StorageKey1,$StorageKey2)
    $result = cmd /c $azCopyCmd

    Write-Host $result
}