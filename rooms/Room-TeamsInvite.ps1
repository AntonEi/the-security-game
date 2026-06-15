# Main function for playing the teams invite room

Function Start-RoomTeamsInvite {
    param (
        [Parameter(Mandatory = $true)]
        [object]$GameState 
    )

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
            Write-Host "or HINT"

$choice = Read-Host "Choose an option"

            switch ($choice) {
                "1" {
                    # Preview the message
                    $Action = Show-Message $GameState
                    if ($Action -eq $true) {
                        return
                    }
                    if ($Action -eq $false) {
                        return
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
                    return $false
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

Function Show-Message {
     param (
        [Parameter(Mandatory = $true)]
        [object]$GameState
    )

    Show-TerminalBox -Label "MESSAGE PREVIEW" -Lines @( # TODO: idk what room number this actually is
            "Hi, this is the IT Department.",
            "We see an issue with your account."
            ) -BorderColor "Cyan" -TextColor "White" -Clear

    Write-Host "What will you do?"
    $choice = Read-Host "1: Accept, 2: Block, 3: Go back, or HINT"

    switch ($choice) {
        "1" {
            # Accept
            Approve-Message $GameState
            return $false
        }
        "2" {
            # Block
            Block-Message $GameState
            return $true
        }
        "3" {
            #Go back
            return
        }
        "HINT" {
            Show-Hint $GameState
        }
    }
}

Function Block-Message {
    param (
        [Parameter(Mandatory = $true)]
        [object]$GameState
    )

    Show-TerminalBox -Label "ROOM CLEARED!" -Lines @(
                "Good job!",
                "You avoided the phishing attempt.",
                "",
                "Now redirecting to the next room..."
                ) -BorderColor "Green" -TextColor "Green" -Clear

            Start-Sleep -Seconds 2
            Add-Score -GameState $GameState
            return $true
}

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

    Start-Sleep -Seconds 2
    $GameState.Mistakes += 1
    Remove-Score $GameState
    return $false
}

Function Show-Hint {
    param (
        [object]$GameState
    )

        Show-TerminalBox -Label "HINT" -Lines @(
            "Listen to Microsoft"
            ) -BorderColor "Cyan" -TextColor "White" -Clear
  
    $GameState.HintsUsed += 1
    Start-Sleep -Seconds 4

    return
}