# Main function for playing the phising room
class PhishingRoom {
    # True if player is still in the room
    [boolean]$playing

    # Initialize the PhishingRoom object
    PhisingRoom() {
        $this.playing = true
    }

    [void]StartPhishingRoom() {
        # TODO: pass param gamestate here?
        # TODO: add hints
        Clear-Host

        Start-Room
    }

    [void]StartRoom() {
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
                $this.ShowEmail1()
            }
            "2" {
                # Email 2
                $this.ShowEmail2()
            }
            "3" {
                # Email 3
                $this.ShowEmail3()
            }
            "4" {
                # Hint
                $this.ShowHint()
            }
        }
    }

    [void]ShowEmail1() {
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
                return
            }
        }
    }

    [void]ShowEmail2() {
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
                return
            }
        }
    }

    [void]ShowEmail3() {
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
            return
        }
    }
    }

    [void]ShowHint() {

    }
}

# Just put this here now so that I can test run this function. 
# When integrated later, just call this function to start the room
$phishingRoom = [PhishingRoom]::New()
$phishingRoom.StartPhishingRoom()
