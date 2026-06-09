# Main function for playing the phising room
# TODO: this probs has to return gamestate object
Function Start-PhishingRoom {
    # TODO: pass param gamestate here?
    # TODO: add hints
    Clear-Host

    Start-Room
}

Function Start-Room {
        Write-Host "========================================================"
        Write-Host "Before you is a mailbox, filled with 3 emails:"
        Write-Host "1 -  Important notice"
        Write-Host "2 - [External] [Urgent]: Domain Renewal Failure - Mon 13.."
        Write-Host "3 - Someone tried to log in to your account"
        Write-Host "========================================================"
        Write-Host ""
        Write-Host "1. Look at email 1"
        Write-Host "2. Look at email 2 "
        Write-Host "3. Look at email 3"
        Write-Host "4. Hint"
        Write-Host ""

        $choice = Read-Host "Choose an option"
        switch ($choice) {
            "1" {
                # Email 1
                Show-Email1
            }
            "2" {
                # Email 2
                Show-Email2
            }
            "3" {
                # Email 3
                Show-Email3
            }
            "4" {
                # Hint
                Show-Hint
            }
            default {
                Write-Host "Invalid choice. Please try again." -ForegroundColor Red
                Start-Sleep -Seconds 2
            }
        }
}

Function Show-Email1 {
    # TODO: update email text
    Write-Host "========================================================"
    Write-Host "Important notice"
    Write-Host "From: example@mail.com"
    Write-Host "Text text text"
    Write-Host "<link> Click here to stop removal"
    Write-Host "========================================================"
    Write-Host ""
    Write-Host "1. Click on the link"
    Write-Host "2. Go back"
    Write-Host ""

    $choice = Read-Host "Choose an option"
    switch ($choice) {
        "1" {
            # Click link
        }
        "2" {
            Start-Room
        }
    }
}

Function Show-Email2 {
    # TODO: update email text
    Write-Host "========================================================"
    Write-Host "[External] [Urgent]: Domain Renewal Failure - Mon 13 June 2026"
    Write-Host "From: example@mail.com"
    Write-Host "Text text text"
    Write-Host "<link> Click here to stop removal"
    Write-Host "========================================================"
    Write-Host ""
    Write-Host "1. Click on the link"
    Write-Host "2. Go back"
    Write-Host ""

    $choice = Read-Host "Choose an option"
    switch ($choice) {
        "1" {
            # Click link
        }
        "2" {
            Start-Room
        }
    }
}

Function Show-Email3 {
        # TODO: update email text
    Write-Host "========================================================"
    Write-Host "Someone tried to log in to your account"
    Write-Host "From: example@mail.com"
    Write-Host "Text text text"
    Write-Host "<link> Click here to stop removal"
    Write-Host "========================================================"
    Write-Host ""
    Write-Host "1. Click on the link"
    Write-Host "2. Go back"
    Write-Host ""

    $choice = Read-Host "Choose an option"
    switch ($choice) {
        "1" {
            # Click link
        }
        "2" {
            Start-Room
        }
    }
}

Function Show-Hint {

}

# Just put this here now so that I can test run this function. 
# When integrated later, just call this function to start the room
Start-PhishingRoom
