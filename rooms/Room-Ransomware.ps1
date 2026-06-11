# Starts the ransomware room and handles the player's choice, timer, score, and result.
function Start-RoomRansomware {
    param (
        [Parameter(Mandatory = $true)]
        [object]$GameState
    )

    $timeLimit = Get-RansomwareTimeLimit -Difficulty $GameState.Difficulty

    while ($true) {
        Show-RansomwareIntro -TimeLimit $timeLimit

        $stopwatch = [System.Diagnostics.Stopwatch]::StartNew()
        $choice = Read-Host "Choose an option (1-4) or HINT"
        $stopwatch.Stop()

        if ($choice.Trim().ToUpper() -eq "HINT") {
            $GameState.HintsUsed += 1
            Show-RansomwareHint -TimeLimit $timeLimit
            continue
        }

        if ($stopwatch.Elapsed.TotalSeconds -gt $timeLimit) {
            $GameState.Mistakes += 1
            $GameState.Score -= 10

            Show-TerminalBox -Label "FILES ENCRYPTED" -Lines @(
                "Your files have been encrypted.",
                "",
                "You took too long to react.",
                "The ransomware spread before the device was isolated.",
                "",
                "-10 points",
                "+1 mistake"
            ) -BorderColor "Red" -TextColor "Red" -Clear

            Read-Host "Press Enter to continue"
            return $false
        }

        switch ($choice.Trim()) {
            "1" {
                $GameState.Mistakes += 1
                $GameState.Score -= 10

                Show-TerminalBox -Label "WRONG ACTION" -Lines @(
                    "Paying the ransom is not the right first action.",
                    "",
                    "Payment does not guarantee recovery.",
                    "It can also encourage further attacks.",
                    "",
                    "Try again.",
                    "",
                    "-10 points",
                    "+1 mistake"
                ) -BorderColor "Red" -TextColor "Red" -Clear

                Read-Host "Press Enter to try again"
                continue
            }

            "2" {
                $GameState.Score += 20

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

                # Placeholder until the final results screen is implemented in issue #16.
                Show-TerminalBox -Label "FINAL ROOM CLEARED" -Lines @(
                    "Ransomware incident contained.",
                    "",
                    "You made the correct first response:",
                    "isolate the device and contact IT.",
                    "",
                    "Final results screen will be handled in a separate issue."
                ) -BorderColor "Green" -TextColor "Green" -Clear

                Read-Host "Press Enter to continue"

                return $true
            }

            "3" {
                $GameState.Mistakes += 1
                $GameState.Score -= 10

                Show-TerminalBox -Label "WRONG ACTION" -Lines @(
                    "Sending files to a colleague can spread the infection.",
                    "",
                    "Suspicious or encrypted files should not be shared.",
                    "The incident should be reported instead.",
                    "",
                    "Try again.",
                    "",
                    "-10 points",
                    "+1 mistake"
                ) -BorderColor "Red" -TextColor "Red" -Clear

                Read-Host "Press Enter to try again"
                continue
            }

            "4" {
                $GameState.Mistakes += 1
                $GameState.Score -= 10

                Show-TerminalBox -Label "WRONG ACTION" -Lines @(
                    "Restarting the computer does not solve ransomware.",
                    "",
                    "It may make investigation or recovery harder.",
                    "The safest action is to isolate and report.",
                    "",
                    "Try again.",
                    "",
                    "-10 points",
                    "+1 mistake"
                ) -BorderColor "Red" -TextColor "Red" -Clear

                Read-Host "Press Enter to try again"
                continue
            }

            default {
                $GameState.Mistakes += 1
                $GameState.Score -= 10

                Show-TerminalBox -Label "INVALID CHOICE" -Lines @(
                    "Invalid choice.",
                    "",
                    "In a real incident, unclear action wastes time.",
                    "",
                    "Try again.",
                    "",
                    "-10 points",
                    "+1 mistake"
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
function Show-RansomwareIntro {
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

    Show-RansomwareIntro -TimeLimit $TimeLimit
}