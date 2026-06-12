# Starts the password room
Function Start-RoomPassword {
    param (
        [Parameter(Mandatory = $true)]
        [object]$GameState
    )

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

        # Give the player a hint without ending the room
        if ($Password.Trim().ToUpper() -eq "HINT") {
            Write-Host "Hint: A strong password is long, unique, and hard to guess."
            Read-Host "Press Enter to try again"
            continue
        }

        # Stores all password requirements that are not met
        $MissingRequirements = @()

        # Check if password is at least 12 characters long
        if ($Password.Length -lt 12) {
            $MissingRequirements += "At least 12 characters"
        }

        # Check if password contains at least one uppercase letter
        if ($Password -notmatch "[A-Z]") {
            $MissingRequirements += "At least one uppercase letter"
        }

        # Check if password contains at least one lowercase letter
        if ($Password -notmatch "[a-z]") {
            $MissingRequirements += "At least one lowercase letter"
        }

        # Check if password contains at least one number
        if ($Password -notmatch "\d") {
            $MissingRequirements += "At least one number"
        }

        # Check if password contains at least one special character
        if ($Password -notmatch "[^a-zA-Z0-9]") {
            $MissingRequirements += "At least one special character"
        }

        # Reject weak passwords and show which requirements are missing
        if ($MissingRequirements.Count -gt 0) {

            Show-TerminalBox -Label "PASSWORD REJECTED" -Lines @(
                "The password does not meet all requirements.",
                "",
                "Missing requirements:"
            ) -Clear

            foreach ($Requirement in $MissingRequirements) {
                Write-Host "- $Requirement"
            }

            Remove-Score $GameState # Remove points for wrong password

            Read-Host "Press Enter to try again"
            continue
        }

        # Accept the password when all requirements are met
        Show-TerminalBox -Label "PASSWORD ACCEPTED" -Lines @(
            "The password meets all security requirements.",
            "",
            "The lock opens."
        ) -Clear

        $PasswordAccepted = $true
        Read-Host "Press Enter to continue"

    } until ($PasswordAccepted -eq $true)

    Add-Score $GameState # Add points for correct password

    return $true
}