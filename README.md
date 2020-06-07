# Learn the Hard Way - Powershell

>
> POWERshell - Use IT or lose IT
>



```
# Add PERMENANT entry to %PATH% environment variable - Add to Registry
$addToPath = "D:\software\IBM_Cloud_CLI"
$currentPath = (Get-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name PATH).path
$newPath = "$currentPath;$addToPath"
Set-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name PATH -Value $newPath
```
