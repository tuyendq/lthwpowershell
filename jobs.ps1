$job = Start-Job -Name BackgroundJob -ScriptBlock {
    foreach ($i in (0..100)) {
        Write-Host "Hello Powershell Job $i"
        Start-Sleep -Seconds 2
    }
}

$job | Select-Object Name, State

$job | Receive-Job

# Keep content
$job | Receive-Job -Keep

# Wait for it
$job | Receive-Job -Wait
$job | Select-Object State, HasMoreData

Get-Job | Remove-Job

