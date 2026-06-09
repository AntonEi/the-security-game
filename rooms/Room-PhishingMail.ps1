# Main function for playing the phising room
# TODO: this probs has to return gamestate object
Function Start-PhishingRoom {
    param (
        $GameState
    )

    Clear-Host

    # TODO: make it so you can quit/save from here
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
                Show-Email1 $GameState
            }
            "2" {
                # Email 2
                Show-Email2 $GameState
            }
            "3" {
                # Email 3
                Show-Email3 $GameState
            }
            "4" {
                # Hint
                Show-Hint $GameState
            }
            default {
                Write-Host "Invalid choice. Please try again." -ForegroundColor Red
                Start-Sleep -Seconds 2
            }
        }
}

Function Show-Email1 {
    param (
        $GameState
    )

    Clear-Host

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
            Clear-Host
            Write-Host "DANGER! You have clicked on a phising link" -ForegroundColor Red
            Start-Sleep -Seconds 2
            $GameState.Mistakes += 1
            # TODO: add a thing about why its a phising mail?? like multi choice
        }
        "2" {
            Start-Room $GameState
        }
    }
}

Function Show-Email2 {
    param (
        $GameState
    )

    Clear-Host
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
            Clear-Host
            Write-Host "DANGER! You have clicked on a phising link" -ForegroundColor Red
            Start-Sleep -Seconds 2
            $GameState.Mistakes += 1
            # TODO: add a thing about why its a phising mail?? like multi choice
        }
        "2" {
            Start-Room $GameState
        }
    }
}

Function Show-Email3 {
    param (
        $GameState
    )

    Clear-Host
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
            # Click link - CORRECT
            Clear-Host
            Write-Host "========================================================" -ForegroundColor Green
            Write-Host "GOOD JOB!" -ForegroundColor Green
            Write-Host "The link you clicked on saved your account from a hacker." -ForegroundColor Green
            Write-Host "Now redirecting to the next room..." -ForegroundColor Green
            Write-Host "========================================================" -ForegroundColor Green
            Start-Sleep -Seconds 2
            $GameState.Score += 1 # Idk if it's meant to be used like this
            return $true
        }
        "2" {
            Start-Room $GameState
        }
    }
}

Function Show-Hint {
    param (
        $GameState
    )
    Clear-Host
    # TODO: add hints
    Write-Host "========================================================"
    Write-Host "HINT:"
    Write-Host "Check the sender's email address closely"
    Write-Host "========================================================"

    $GameState.HintsUsed += 1
    Start-Sleep -Seconds 6

    Start-Room $GameState
}

# Just put this here now so that I can test run this function. 
# When integrated later, just call this function to start the room
$testGameState = [PSCustomObject]@{
        PlayerName     = "test"
        Difficulty     = "Medel"
        CurrentRoom    = 1
        Score          = 0
        HintsUsed      = 0
        Mistakes       = 0
        CompletedRooms = @()
    }
Start-PhishingRoom $testGameState
