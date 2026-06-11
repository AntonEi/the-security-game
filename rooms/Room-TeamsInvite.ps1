# Main function for playing the teams invite room

Function Start-TeamsInviteRoom {
    param (
        [Parameter(Mandatory = $true)]
        [object]$GameState
    )

    while ($true) {
        Show-TerminalBox -Label "ROOM 0X" -Lines @( # TODO: idk what room number this actually is
            "You open up teams, and notice a new message request.",
            "",
            "from: itservisprovider@onmicrosoft.com",
            "Service Internet provider (Extrernal) wants to chat with you!",
            "! This person is from outside your organisation",
            "Messages from unknown or unexpected people could be spam or phising attempts.",
            "Never share your account information or authorize sign-in requests over chat.",
            "To be safe, preview their messages",
            "",
            "What will you do?"
            ) -BorderColor "Cyan" -TextColor "White" -Clear

            $choice = Read-Host "1: preview the message, 2: block, 3: accept, or HINT"

            switch ($choice) {
                "1" {
                    # Preview the message
                    if (Show-Message $GameState) {
                        return
                    }
                }
                "2" {
                    # Block
                    Block-Message $GameState
                    return
                }
                "3" {
                    # Accept
                    
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
            Show-Hint
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
            Add-Score 
            return $true
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