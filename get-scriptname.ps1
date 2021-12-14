
# Write-Host $MyInvocation
Write-Host "Full path name:" $MyInvocation.MyCommand.Path
Write-Host "Script name:" $MyInvocation.MyCommand.Name

Write-Host "Usage:" $MyInvocation.MyCommand.Name "arg1..."
