# menu.ps1

function Show-Menu {
    # param (
    #     OptionalParameters
    # )
    
    Write-Host "=========== What do you want ==========="
    Write-Host "Press '1': Go to LinkedIn Learning"
    Write-Host "Press '2': Go to .\projects\github'"

    $selection = Read-Host "Press a number"

    switch ($selection) {
        1 { 
            Write-Host "You press 1 => linkedin-learning"
            Set-Location "D:\projects\linkedin-learning\"
         }
        Default {}
    }

    Pause
}

Show-Menu
