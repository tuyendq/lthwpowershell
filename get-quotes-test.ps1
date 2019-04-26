# Get quotes content from a website
# Remove everything except quotes content and author
# Format every quote in "quote_content","quote_author" format

# region Variables
$now = Get-Date -Format yyyyMMddHHmm
#$html_file = "html.txt"
$quote_file = "quotes.txt"
$quote_url = "https://www.brainyquote.com/topics/inspirational"
$pattern1 = "view quote"
$pattern2 = "view author"
# endregion Variables

# region Get quotes content from a website

# Invoke-WebRequest -Uri $quote_url -OutFile $html_file

$html = Invoke-WebRequest -Uri $quote_url

# $html.Links | ? {$_.title -eq "view quote" -or $_.title -eq "view author"} | fl innerText | Out-File $quote_file -Width 400
$html.Links | ? {$_.title -eq "view quote" -or $_.title -eq "view author"} | select innerText |  Export-Csv -Path $quote_file -NoTypeInformation

# endregion Get quotes content from a website

# Select-String -Path $html_file -Pattern $pattern1, $pattern2 | Set-Content $quote_file

# Test regex
# $re = [regex]'(.view quote">)'
# 'this is anythin view quote My best practice title="view quote">Anything here' -match $re
#$re1 = [regex]"innerText : "
#(Get-Content $quote_file).Replace($re1, '"') | Out-File $quote_file
#$re2 = [regex]"`r`n"
#(Get-Content $quote_file).Replace($re2, '"')
#(Get-Content $quote_file) -replace "'r'n",'"'



