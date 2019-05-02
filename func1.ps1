# Practice Powershell: Function and arguments

Write-Host "Is $args a built-in variable?"
$answer = Read-Host("Your answer")
$arg1 = Read-Host("Give me a number")

function func1
{
	Write-Host $args[0] $args[1]
}

func1 "This is a function" $arg1