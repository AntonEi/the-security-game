# Starts the ransomware room and handles the player's choice, timer, score, and result.
function Start-RoomRansomware {
    param (
        [Parameter(Mandatory = $true)]
        [object]$GameState
    )

    $timeLimit = Get-RansomwareTimeLimit -Difficulty $GameState.Difficulty

    Show-RansomwareIntro

    while ($true) {
        Show-RansomwareScenario -TimeLimit $timeLimit

        $stopwatch = [System.Diagnostics.Stopwatch]::StartNew()
        $choice = Read-Host "Choose an option (1-4) or HINT"
        $stopwatch.Stop()

        $choice = $choice.Trim()

        # Check the time limit before handling hints or answers.
        if ($stopwatch.Elapsed.TotalSeconds -gt $timeLimit) {
            $GameState = Add-Mistake -GameState $GameState
            $GameState = Remove-Score -GameState $GameState

            Show-TerminalBox -Label "FILES ENCRYPTED" -Lines @(
                "Your files have been encrypted.",
                "",
                "You took too long to react.",
                "The ransomware spread before the device was isolated."
            ) -BorderColor "Red" -TextColor "Red" -Clear

            Read-Host "Press Enter to continue"
            return $false
        }

        # Ignore an accidental empty Enter press.
        if ([string]::IsNullOrWhiteSpace($choice)) {
            continue
        }

        if ($choice.ToUpper() -eq "HINT") {
            $GameState = Use-Hint -GameState $GameState
            Show-RansomwareHint
            continue
        }

        switch ($choice) {
            "1" {
                $GameState = Add-Mistake -GameState $GameState
                $GameState = Remove-Score -GameState $GameState

                Show-TerminalBox -Label "WRONG ACTION" -Lines @(
                    "Paying the ransom is not the right first action.",
                    "",
                    "Payment does not guarantee recovery.",
                    "It can also encourage further attacks.",
                    "",
                    "Try again."
                ) -BorderColor "Red" -TextColor "Red" -Clear

                Read-Host "Press Enter to try again"
                continue
            }

            "2" {
                $GameState = Add-Score -GameState $GameState

                Show-TerminalBox -Label "CORRECT ACTION" -Lines @(
                    "Correct.",
                    "",
                    "You disconnected the computer from the network",
                    "and contacted IT/security staff.",
                    "",
                    "This helps prevent the ransomware from spreading.",
                    "",
                    "+20 points"
                ) -BorderColor "Green" -TextColor "Green" -Clear

                Read-Host "Press Enter to continue"

                Show-RansomwareOutro

                return $true
            }

            "3" {
                $GameState = Add-Mistake -GameState $GameState
                $GameState = Remove-Score -GameState $GameState

                Show-TerminalBox -Label "WRONG ACTION" -Lines @(
                    "Sending files to a colleague can spread the infection.",
                    "",
                    "Suspicious or encrypted files should not be shared.",
                    "The incident should be reported instead.",
                    "",
                    "Try again."
                ) -BorderColor "Red" -TextColor "Red" -Clear

                Read-Host "Press Enter to try again"
                continue
            }

            "4" {
                $GameState = Add-Mistake -GameState $GameState
                $GameState = Remove-Score -GameState $GameState

                Show-TerminalBox -Label "WRONG ACTION" -Lines @(
                    "Restarting the computer does not solve ransomware.",
                    "",
                    "It may make investigation or recovery harder.",
                    "The safest action is to isolate and report.",
                    "",
                    "Try again.",
                    ""
                ) -BorderColor "Red" -TextColor "Red" -Clear

                Read-Host "Press Enter to try again"
                continue
            }

            default {
                $GameState = Add-Mistake -GameState $GameState
                $GameState = Remove-Score -GameState $GameState

                Show-TerminalBox -Label "INVALID CHOICE" -Lines @(
                    "Invalid choice.",
                    "",
                    "In a real incident, unclear action wastes time.",
                    "",
                    "Try again."
                ) -BorderColor "Red" -TextColor "Red" -Clear

                Read-Host "Press Enter to try again"
                continue
            }
        }
    }
}

# Returns the time limit in seconds based on the selected difficulty.
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

# Shows the ransomware scenario and the available choices.
function Show-RansomwareScenario {
    param (
        [int]$TimeLimit
    )

    Show-TerminalBox -Label "RANSOMWARE FINAL" -Lines @(
        "WARNING!",
        "",
        "Files are being encrypted on this computer.",
        "",
        '        /!\',
        '       / ! \',
        '      /_____\',
        "    SYSTEM ALERT",
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

# Shows a hint and then returns to the ransomware scenario.
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

    Show-RansomwareScenario -TimeLimit $TimeLimit
}