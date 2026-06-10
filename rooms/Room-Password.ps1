# Starts the password room
Function Start-RoomPassword ($GameState) {

    # Tracks whether the player has created an accepted password
    $PasswordAccepted = $false

    do {

        # Displays the password room using the shared terminal box UI
        Show-TerminalBox -Label "PASSWORD LOCK" -Lines @(
            "Create a secure password.",
            "",
            "Requirements:",
            "- At least 12 characters",
            "- At least one uppercase letter",
            "- At least one lowercase letter",
            "- At least one number",
            "- At least one special character",
            "",
            "Type HINT if you need help."
        ) -Clear

        $Password = Read-Host "Enter password or HINT"

    } until ($PasswordAccepted -eq $true)

    return $true
}