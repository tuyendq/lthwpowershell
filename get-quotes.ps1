﻿# Get quotes from url and export to csv file
# region Variables
$today = Get-Date -Format yyyyMMddHHmm
$quote_url = "https://www.brainyquote.com/topics/motivational"
$raw_file = "quotes-raw.txt"
$quote_file = "quotes" + $today + ".csv"
# endregion Variables

# Get site's raw html content
$html = Invoke-WebRequest -Uri $quote_url

# Keep innerText, title
$html.Links | ? {$_.title -eq "view quote" -or $_.title -eq "view author"} | Select-Object innerText, title | Export-Csv -Path $raw_file -NoTypeInformation

# Combine "quote","author" into csv format
(Get-Content -Raw $raw_file) -replace '"innerText","title"','' -replace '^\r\n','' -replace '"view quote"\r\n','' -replace ',"view author"','' | Out-File $quote_file
# End of script
