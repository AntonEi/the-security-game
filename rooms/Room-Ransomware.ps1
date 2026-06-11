function Get-RansomwareTimeLimit {
    param (
        [string]$Difficulty
    )

    switch ($Difficulty) {
        "Easy" { return 90 }
        "Medium" { return 45 }
        "Hard" { return 25 }
        default { return 45 }
    }
}

function Show-RansomwareIntro {
    param (
        [int]$TimeLimit
    )

    Show-TerminalBox -Label "RANSOMWARE FINAL" -Lines @(
        "WARNING!",
        "",
        "Files are being encrypted on this computer.",
        "",
        "        /!\",
        "       / ! \",
        "      /_____\",
        "      SYSTEM ALERT",
        "",
        "A message appears on screen:",
        "",
        '"Your files have been locked."',
        '"Pay 5 Bitcoin to restore access."',
        "",
        "This situation is time critical.",
        "Time limit: $TimeLimit seconds",
        "",
        "Type HINT if you need help."
    ) -BorderColor "Red" -TextColor "Red" -Clear

    Write-Host "1. Pay the ransom immediately"
    Write-Host "2. Disconnect the computer from the network and contact IT"
    Write-Host "3. Send the encrypted files to a colleague for help"
    Write-Host "4. Restart the computer and hope the problem disappears"
    Write-Host ""
}

function Show-RansomwareHint {
    param (
        [int]$TimeLimit
    )

    Show-TerminalBox -Label "HINT" -Lines @(
        "Ransomware can spread quickly.",
        "",
        "Your first priority is to isolate the infected device",
        "and contact IT or security staff."
    ) -BorderColor "Magenta" -TextColor "Magenta" -Clear

    Read-Host "Press Enter to continue"

    Show-RansomwareIntro -TimeLimit $TimeLimit
}

function Show-RansomwareResult {
    param (
        [Parameter(Mandatory = $true)]
        [string]$Label,

        [Parameter(Mandatory = $true)]
        [string[]]$Lines,

        [string]$BorderColor = "White",

        [string]$TextColor = "White"
    )

    Show-TerminalBox `
        -Label $Label `
        -Lines $Lines `
        -BorderColor $BorderColor `
        -TextColor $TextColor `
        -Clear

    Read-Host "Press Enter to continue"
}

