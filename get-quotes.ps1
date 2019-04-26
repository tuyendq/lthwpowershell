# Get quotes from url and export to csv file
# region Variables
$today = Get-Date -Format yyyyMMddHHmm
$quote_url = "https://www.brainyquote.com/topics/motivational"
$quote_file = "quotes.txt"
$quote_file2 = "quotes2.txt"
# endregion Variables

$html = Invoke-WebRequest -Uri $quote_url

$html.RawContentLength # Test

# Keep innerText
# Keep title
$html.Links | ? {$_.title -eq "view quote" -or $_.title -eq "view author"} | Select-Object innerText, title | Export-Csv -Path $quote_file -NoTypeInformation

# Combine "quote","author"

(Get-Content -Raw $quote_file) -replace '"view quote"\r\n','' -replace ',"view author"','' | Out-File $quote_file2
# (Get-Content -Raw $quote_file) -replace ',"view author"',''

