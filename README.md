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

```powershell
if ($?) {
  Write-Host "Successfully"
}
else {
  Write-Host "Something wrong"
}
```

For loop
```powershell
for ($i = 0; $i -lt 10; $i++) { echo $i }
```

## Modules
```powershell
Get-InstalledModule
```

Create multiple files  
```powershell
'CarCosmosService.cs','ICarCosmosService.cs' | % {New-Item -Force -Name ".\Services\$_" -Type File}
```

## Chained commands:

All command are run one by one
```powershell
command 1; command 2; command 3;
```

Command 2 is run only when command is failed
```powershell
command 1 || command 2
```

Command 2 is run only if command 1 run successfully
```powershell
command 1 && command 2
```

