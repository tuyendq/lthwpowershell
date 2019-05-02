# Get quotes from azquotes.com's url  and export to csv file

# region Global variables
$today = Get-Date -Format yyyyMMdd
$quote_url = "https://www.azquotes.com/quotes/topics/positive.html"
$log_file = "logs.log"
$raw_file = "quotes-raw.txt"
$quote_file = "quotes" + $today + ".csv"
# endregion Global variables

# Enter specific url
Write-Host "Get quotes from:" $quote_url
$quote_url = Read-Host "Enter another url here:"

$timebegin = Get-Date
Write-Host "Start`t:" $timebegin
# Get site's raw html content
$html = Invoke-WebRequest -Uri $quote_url

# Keep innerText, title
$html.Links | ? {$_.class -eq "title"} | Select-Object innerText, data-author | Export-Csv -Path $raw_file -NoTypeInformation

# Remove the first line
Get-Content $raw_file | Select-Object -Skip 1 | Out-File -Encoding ascii $quote_file

# Count the number of lines/quotes
$lines = (Get-Content $quote_file | Measure-Object -Line).Lines

$timeend = Get-Date
Write-Host "Finish`t:" $timeend
Write-Host "It takes" ($timeend - $timebegin) "seconds to get" $lines "quotes from" $quote_url"."
# End of script
