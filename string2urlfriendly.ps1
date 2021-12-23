# Convert a string to URL friendly

if ($args.Count -ne 1) {
    Write-Host `nUsage: $MyInvocation.MyCommand `"String to be converted`"`n
} else {
    # replace spaces or ':' with '-', then replace (one or more '-') with '-'
    $Result = $args[0].tolower() -replace '\s+|:','-' -replace '-+','-'
    Write-Host $Result
}