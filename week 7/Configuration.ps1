function readConfiguration {
    $lines = Get-Content "C:\Users\Carter\SYS320-01\week 7\configuration.txt"
    $Configuration = [PSCustomObject]@{
        Days          = $lines[0].Trim()
        ExecutionTime = $lines[1].Trim()
    }
    $Configuration
}

function changeConfiguration {
    do {
        $newDays = Read-Host "Enter new number of days"
        if ($newDays -notmatch '^\d+$') {
            Write-Host "Days must be digits only"
        }
    } while ($newDays -notmatch '^\d+$')

    do {
        $newTime = Read-Host "Enter new execution time (format: H:MM AM/PM)"
        if ($newTime -notmatch '^\d{1,2}:\d{2}\s(AM|PM)$') {
            Write-Host "Invalid. usage (9:00 AM, 12:30 PM)"
        }
    } while ($newTime -notmatch '^\d{1,2}:\d{2}\s(AM|PM)$')

    Set-Content -Path "C:\Users\Carter\SYS320-01\week 7\configuration.txt" -Value @($newDays, $newTime)
    Write-Host "Configuration Changed"
}

function configurationMenu {
    $Prompt  = "`n"
    $Prompt += "Please choose your operation:`n"
    $Prompt += "1 - Show configuration`n"
    $Prompt += "2 - Change configuration`n"
    $Prompt += "3 - Exit`n"

    do {
        $Choice = Read-Host $Prompt

        if ($Choice -eq "1") {
            readConfiguration
        }
        elseif ($Choice -eq "2") {
            changeConfiguration
        }
        elseif ($Choice -eq "3") {
            Write-Host "Exiting"
        }
        else {
            Write-Host "Invalid option. Please enter 1, 2, or 3."
        }
    } while ($Choice -ne "3")
}
