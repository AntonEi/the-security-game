# Main function for playing the phising room
Phishing-Room
function Start-PhishingRoom {
        Clear-Host

        Start-Room
}

# The start point of the room, introducing it
function Start-Room {
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
        Write-Host "4. Pick"
        Write-Host ""
}

Start-PhishingRoom
