# Get quotes from url  and export to csv file
# region Global variables
$today = Get-Date -Format yyyyMMdd
$quote_url = "https://www.azquotes.com/quotes/topics/positive.html"
$raw_file = "quotes-raw.txt"
$quote_file = "quotes" + $today + ".txt"
# endregion Global variables

# Enter specific url
#Write-Host "Get quotes from:"
#$quote_url = Read-Host "Enter url:"

# Get site's raw html content
$html = Invoke-WebRequest -Uri $quote_url

# Keep innerText, title
$html.Links | ? {$_.class -eq "title"} | Select-Object innerText, data-author | Export-Csv -Path $raw_file -NoTypeInformation

# Remove the first line and the last line - headers and blank lines
Get-Content $raw_file | Select-Object -Skip 1 | Out-File $quote_file
# End of script