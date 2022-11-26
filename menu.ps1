function Show-Menu {
    param (
      [Int] $optionNumber
    )
    Write-Host "========== What do you want ============"
    Write-Host "'1' - Go to LinkedIn Learning"
    Write-Host "'2' - Go to Projects"
    Write-Host "'3' - Go to LinkedIn Learning"
	Write-Host "'9' - Go to lthwflutter"
    Write-Host "'q' - Quit"

    if ($optionNumber) {
        $selection = $optionNumber    
    } else {
        $selection = Read-Host "Select an option"
    }

    switch ($selection) {
        1 { 
            Set-Location "D:\projects\linkedin-learning\" 
        }
        2 { 
            Set-Location "D:\projects\" 
        }
        3 { 
            Set-Location "D:\projects\" 
        }
        9 { 
            Set-Location "D:\projects\lthwflutter\" 
        }
        Default {}
    }
}

if ($args.Count -eq 1){
    Write-Host "You give one argument" $args[0]
    Show-Menu($args[0])
    Exit(0)
}

Show-Menu