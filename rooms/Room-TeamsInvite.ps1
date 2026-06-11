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

            $choice = Read-Host "1: preview the message, 2: block, 3: accept or HINT"

            switch ($choice) {
                "1" {
                    # Preview the message

                }
                "2" {
                    # Block

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