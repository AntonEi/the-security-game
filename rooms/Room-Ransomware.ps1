function Start-RoomRansomware {
    param (
        [Parameter(Mandatory = $true)]
        [object]$GameState
    )

    $timeLimit = Get-RansomwareTimeLimit -Difficulty $GameState.Difficulty

    Show-RansomwareIntro -TimeLimit $timeLimit

    $stopwatch = [System.Diagnostics.Stopwatch]::StartNew()
    $choice = Read-Host "Choose an option (1-4) or HINT"
    $stopwatch.Stop()

    if ($choice.Trim().ToUpper() -eq "HINT") {
        $GameState.HintsUsed += 1
        Show-RansomwareHint -TimeLimit $timeLimit

        $stopwatch = [System.Diagnostics.Stopwatch]::StartNew()
        $choice = Read-Host "Choose an option (1-4)"
        $stopwatch.Stop()
    }

    if ($stopwatch.Elapsed.TotalSeconds -gt $timeLimit) {
        $GameState.Mistakes += 1
        $GameState.Score -= 10

        Show-RansomwareResult `
            -Label "FILES ENCRYPTED" `
            -Lines @(
                "Your files have been encrypted.",
                "",
                "You took too long to react.",
                "The ransomware spread before the device was isolated.",
                "",
                "-10 points",
                "+1 mistake"
            ) `
            -BorderColor "Red" `
            -TextColor "Red"

        return $false
    }

    switch ($choice.Trim()) {
        "1" {
            $GameState.Mistakes += 1
            $GameState.Score -= 10

            Show-RansomwareResult `
                -Label "WRONG ACTION" `
                -Lines @(
                    "Paying the ransom is not the right first action.",
                    "",
                    "Payment does not guarantee recovery.",
                    "It can also encourage further attacks.",
                    "",
                    "The first priority is to isolate the device",
                    "and contact IT or security staff.",
                    "",
                    "-10 points",
                    "+1 mistake"
                ) `
                -BorderColor "Red" `
                -TextColor "Red"

            return $false
        }

        "2" {
            $GameState.Score += 20

            Show-RansomwareResult `
                -Label "CORRECT ACTION" `
                -Lines @(
                    "Correct.",
                    "",
                    "You disconnected the computer from the network",
                    "and contacted IT/security staff.",
                    "",
                    "This helps prevent the ransomware from spreading.",
                    "",
                    "+20 points"
                ) `
                -BorderColor "Green" `
                -TextColor "Green"
        }

        "3" {
            $GameState.Mistakes += 1
            $GameState.Score -= 10

            Show-RansomwareResult `
                -Label "WRONG ACTION" `
                -Lines @(
                    "Sending files to a colleague can spread the infection.",
                    "",
                    "Suspicious or encrypted files should not be shared.",
                    "The incident should be reported instead.",
                    "",
                    "-10 points",
                    "+1 mistake"
                ) `
                -BorderColor "Red" `
                -TextColor "Red"

            return $false
        }

        "4" {
            $GameState.Mistakes += 1
            $GameState.Score -= 10

            Show-RansomwareResult `
                -Label "WRONG ACTION" `
                -Lines @(
                    "Restarting the computer does not solve ransomware.",
                    "",
                    "It may make investigation or recovery harder.",
                    "The safest action is to isolate and report.",
                    "",
                    "-10 points",
                    "+1 mistake"
                ) `
                -BorderColor "Red" `
                -TextColor "Red"

            return $false
        }

        default {
            $GameState.Mistakes += 1
            $GameState.Score -= 10

            Show-RansomwareResult `
                -Label "INVALID CHOICE" `
                -Lines @(
                    "Invalid choice.",
                    "",
                    "In a real incident, unclear action wastes time.",
                    "",
                    "-10 points",
                    "+1 mistake"
                ) `
                -BorderColor "Red" `
                -TextColor "Red"

            return $false
        }
    }

    Show-RansomwareResult `
        -Label "FINAL ROOM CLEARED" `
        -Lines @(
            "Ransomware incident contained.",
            "",
            "You made the correct first response:",
            "isolate the device and contact IT.",
            "",
            "Final results screen will be handled in a separate issue."
        ) `
        -BorderColor "Green" `
        -TextColor "Green"

    return $true
}

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

