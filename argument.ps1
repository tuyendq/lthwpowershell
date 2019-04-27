# Learn abut built-in $args array
# Count number of given arguments
# Print out list of given arguments

if ($args.Count -eq 0) {
	Write-Host "You DO NOT give any argument at all."
} else {
	Write-Host "Your give " $args.Count "arguments."
	Write-Host "Let's print the list of given arguments below:"
	foreach ($arg in $args) {
		Write-Host ">"$arg
	}
}

Write-Host `n">>>Practice until you can't make it wrong.<<<"`n