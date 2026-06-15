

# Main function for playing the phising room
# TODO: this probs has to return gamestate object
Function Start-PhishingRoom {
    param (
        [object]$GameState
    )
    Show-PhishingIntro
    while ($true) {

        Show-TerminalBox -Label "ROOM 01" -Lines @(
            "Your mailbox contains 3 suspicious emails.",
            "Inspect each message carefully.",
            "Only one email is legitimate.",
            "Find it and click the correct link.",
            "",
            "1 - Important notice",
            "2 - [External] [Urgent]: Domain Renewal Failure - Mon 13..",
            "3 - Someone tried to log in to your account"
        ) -BorderColor "Cyan" -TextColor "White" -Clear


        $choice = Read-Host "Choose an email to view (1-3) or HINT"
            switch ($choice) {
                "1" {
                    Show-Email1 $GameState
                }
                "2" {
                    Show-Email2 $GameState
                }
                "3" {
                    if (Show-Email3 $GameState) {
                    Show-PhishingOutro
                    return $true
                }
            }
            "HINT" {
            Show-Hint $GameState
            }
            default {
                Write-Host "Invalid choice. Please try again." -ForegroundColor Red
                Start-Sleep -Seconds 2
            }
        }
    }
}

Function Show-Email1 {
    param (
        [object]$GameState
    )

    Show-TerminalBox -Label "EMAIL 01" -Lines @(
        "Important notice",
        "From: support@gooogle.com",
        "",
        "Due to inactivity, your account will soon", 
        "be DEACTIVATED !!",
        "Click the link below to prevent deactivation:",
        "",
        "http://google-account-security-verify.com"
    ) -BorderColor "Cyan" -TextColor "White" -Clear

    $choice = Read-Host "Choose (1) to click the link or (2) to return to the mailbox"
    switch ($choice) {
        "1" {
            Show-TerminalBox -Label "DANGER" -Lines @(
                "You have clicked on a phishing link!",
                "The account has been compromised",
                "",
                " -5 points"
            ) -BorderColor "Red" -TextColor "Red" -Clear

            Start-Sleep -Seconds 2
            $GameState.Mistakes += 1
            Remove-Score $GameState
        }
        "2" {
            return
        }
    }
}

Function Show-Email2 {
    param (
        [object]$GameState
    )

    Show-TerminalBox -Label "EMAIL 02" -Lines @(
        "[External] [Urgent]: Domain Renewal Failure - Mon 13 June 2026",
        "From: dms@gmail.com",
        "",
        "Your domain renewal for company.com has failed.",
        "Click the link below to prevent removal",
        "",
        "http://teams-security-update-login.com"
    ) -BorderColor "Cyan" -TextColor "White" -Clear

    $choice = Read-Host "Choose (1) to click the link or (2) to return to the mailbox"
    switch ($choice) {
        "1" {
            Show-TerminalBox -Label "DANGER" -Lines @(
                "You have clicked on a phishing link!",
                "The account has been compromised",
                "",
                " -5 points"
            ) -BorderColor "Red" -TextColor "Red" -Clear

            Start-Sleep -Seconds 2
            $GameState.Mistakes += 1
            Remove-Score $GameState
        }
        "2" {
            return
        }
    }
}

Function Show-Email3 {
    param (
        [object]$GameState
    )

    Show-TerminalBox -Label "EMAIL 03" -Lines @(
        "Someone tried to log in to your account",
        "From: no-reply@doodle.com",
        "",
        "We just noticed a failed login attempt for your",
        "Doodle account",
        "Not you? Use the link below to change your",
        "account password:",
        "",
        "https://doodle-account-security.com/reset"
    ) -BorderColor "Cyan" -TextColor "White" -Clear

    $choice = Read-Host "Choose (1) to click the link or (2) to return to the mailbox"
    switch ($choice) {
        "1" {
            Show-TerminalBox -Label "ROOM CLEARED!" -Lines @(
                "Good job!",
                "The link you clicked on saved your account",
                "from a hacker.",
                "",
                " +20 points",
                "Now redirecting to the next room..."
            ) -BorderColor "Green" -TextColor "Green" -Clear

            Start-Sleep -Seconds 2
            
            Add-Score $GameState
            return $true
        }
        "2" {
            return
        }
    }
}

Function Show-Hint {
    param (
        [object]$GameState
    )

    Show-TerminalBox -Label "HINT" -Lines @(
        "Check the sender's email address closely"
    ) -BorderColor "Cyan" -TextColor "White" -Clear
  
    $GameState.HintsUsed += 1
    Start-Sleep -Seconds 4
    
    return
}

# Just put this here now so that I can test run this function. 
# When integrated later, just call this function to start the room
#        $testGameState = [PSCustomObject]@{
#                PlayerName     = "test"
#               Difficulty     = "Medium"
#                CurrentRoom    = 1
#                Score          = 0
#                HintsUsed      = 0
#                Mistakes       = 0
#                CompletedRooms = @()
#            }
#        Start-PhishingRoom $testGameState
