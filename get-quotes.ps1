# Get quotes from url and export to csv file
# region Variables
$today = Get-Date -Format yyyyMMddHHmm
$quote_url = "https://www.brainyquote.com/topics/motivational"
$quote_file = "quotes.txt"
# endregion Variables

$html = Invoke-WebRequest -Uri $quote_url

$html.RawContentLength # Test

$html.Links | ? {$_.title -eq "view quote" -or $_.title -eq "view author"} 

# Keep innerText
# Keep title
