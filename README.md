# Learn the Hard Way - Powershell

>
> POWERshell - Use IT or lose IT
>


```powershell
# Add PERMENANT entry to %PATH% environment variable - Add to Registry
$addToPath = "D:\software\IBM_Cloud_CLI"
$currentPath = (Get-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name PATH).path
$newPath = "$currentPath;$addToPath"
Set-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name PATH -Value $newPath
```

Create folder if not exist

```powershell
# Create folder if not exist
$dirPath = "D:\wsl"
if (!(Test-Path -path $dirPath)){
  New-Item -ItemType Directory -Path $dirPath
  Write-Host $dirPath "is created."	
}
else {
  Write-Host $dirPath "already exists."
}
```

Check if the previous command run successfully

```power
if ($?) {
  Write-Host "Successfully"
}
else {
  Write-Host "Something wrong"
}
```

## Modules
```powershell
Get-InstalledModule
```

