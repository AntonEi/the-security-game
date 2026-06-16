# Main function for playing the teams invite room
# Returns 
Function Start-RoomTeamsInvite {
    param (
        [Parameter(Mandatory = $true)]
        [object]$GameState 
    )

    Show-TeamsInviteIntro

    while ($true) {
        Show-TerminalBox -Label "TEAMS MESSAGE REQUEST" -Lines @(
            "You open Teams and see a new message request.",
            "",
            "----------------------------------------",
            "FROM: itservisprovider@onmicrosoft.com",
            "DISPLAY: Service Internet Provider (External)",
            "----------------------------------------",
            "",
            "⚠ This user is outside your organization",
            "⚠ Unknown messages may be phishing attempts",
            "",
            "Security advice:",
            "- Never share login details",
            "- Do not approve sign-in requests blindly",
            "",
            "What will you do?"
        ) -BorderColor "Cyan" -TextColor "White" -Clear

        Write-Host "1: Preview message (inspect sender details)"
        Write-Host "2: Block sender (mark as suspicious)"
        Write-Host "3: Accept request (trust sender)"

        $Choice = Read-Host "Choose an option (1-3) or HINT"

        switch ($Choice) {
            "1" {
                # Preview the message
                if (Show-Message $GameState) { # Call on show-message, if user clears room return true
                    return $true
                }
            }
            "2" {
                # Block
                Block-Message $GameState
                return $true
            }
            "3" {
                # Accept
                Approve-Message $GameState
            }
            "HINT" {
                Show-Hint $GameState
                continue
            }
            default {
                Write-Host "Invalid choice. Please try again." -ForegroundColor Red
                Start-Sleep -Seconds 2
            }
        }    
    }

}

# Previews the message request
# Returns true if player blocks message requests (and thus clears room)
Function Show-Message {
    param (
        [Parameter(Mandatory = $true)]
        [object]$GameState
    )

    Show-TerminalBox -Label "MESSAGE PREVIEW" -Lines @(
        "Hi, this is the IT Department.",
        "We see an issue with your account."
    ) -BorderColor "Cyan" -TextColor "White" -Clear

    Write-Host "What will you do?"
    $Choice = Read-Host "1: Accept, 2: Block, 3: Go back, or HINT"

    switch ($Choice.Trim().ToUpper()) {
        "1" {
            # Accept
            $null = Approve-Message -GameState $GameState
            return $false
        }

        "2" {
            # Block
            $null = Block-Message -GameState $GameState
            return $true
        }

        "3" {
            # Go back
            return $false
        }

        "HINT" {
            $null = Show-Hint -GameState $GameState
            return $false
        }

        default {
            Write-Host "Invalid choice. Please try again." -ForegroundColor Red
            Start-Sleep -Seconds 2
            return $false
        }
    }
}

# Show message when user has cleared room, add score
Function Block-Message {
    param (
        [Parameter(Mandatory = $true)]
        [object]$GameState
    )

    Show-TerminalBox -Label "ROOM CLEARED!" -Lines @(
        "Good job!",
        "You avoided the phishing attempt."
    ) -BorderColor "Green" -TextColor "Green" -Clear

    Show-TeamsInviteOutro
    Add-Score $GameState
    Read-Host "Press Enter to continue"
    return $true
}

# Show danger message when user has approved the social engineering message, remove score, add mistake
Function Approve-Message {
    param (
        [Parameter(Mandatory = $true)]
        [object]$GameState
    )

    Show-TerminalBox -Label "DANGER" -Lines @(
        "This message is a part of a social engineering scheme.",
        "The sender isn't actually your IT department.",
        "The account has been compromised",
        "",
        "Now redirecting to the next room..."
    ) -BorderColor "Red" -TextColor "Red" -Clear

    Add-Mistake $GameState
    Remove-Score $GameState
    Read-Host "Press Enter to try again"
    return
}

# Shows, and uses, a hint
Function Show-Hint {
    param (
        [Parameter(Mandatory = $true)]
        [object]$GameState
    )

    Show-TerminalBox -Label "HINT" -Lines @(
        "Listen to Microsoft"
    ) -BorderColor "Cyan" -TextColor "White" -Clear

    $GameState = Use-Hint -GameState $GameState
    $null = Read-Host "Press Enter to continue"
}
