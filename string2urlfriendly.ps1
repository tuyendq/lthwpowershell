# Convert a string to URL friendly

if ($args.Count -ne 1) {
    Write-Host `nUsage: $MyInvocation.MyCommand `"String to be converted`"`n
} else {
    $Result = $args[0].replace(" ","-").tolower()
    Write-Host $Result
}