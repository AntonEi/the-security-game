Import-Module "$PSScriptRoot\GameState.psm1" -Force

. "$PSScriptRoot\..\rooms\Room-FakeWebsite.ps1"

function Show-MainMenu {
    while ($true) {
        Clear-Host

        Write-Host "===================================="
        Write-Host "DARKWEB ESCAPE: TERMINAL LOCKDOWN"
        Write-Host "===================================="
        Write-Host ""
        Write-Host "1. Start new game"
        Write-Host "2. Load saved game"
        Write-Host "3. Exit"
        Write-Host ""

        $choice = Read-Host "Choose an option"

        switch ($choice) {
            "1" {
                $gameState = New-GameState -PlayerName "Test Player" -Difficulty "Medel"

                $roomCompleted = Start-RoomFakeWebsite -GameState $gameState

                if ($roomCompleted -eq $true) {
                    $gameState = Add-CompletedRoom -GameState $gameState -RoomName "Fake Website"
                    Save-GameState -GameState $gameState
                }

                Write-Host ""
                Write-Host "Game saved."
                Write-Host "Score: $($gameState.Score)"
                Write-Host "Hints used: $($gameState.HintsUsed)"
                Write-Host "Mistakes: $($gameState.Mistakes)"
                Write-Host "Completed rooms: $($gameState.CompletedRooms -join ', ')"

                Read-Host "Press Enter to return to menu"
            }

            "2" {
                $gameState = Import-SavedGame

                if ($null -ne $gameState) {
                    Start-SavedRoom -GameState $gameState
                }

                Read-Host "Press Enter to return to menu"
            }

            "3" {
                Write-Host "Exiting game..."
                return
            }

            default {
                Write-Host "Invalid choice. Please try again." -ForegroundColor Red
                Start-Sleep -Seconds 2
            }
        }
    }
}

function Start-SavedRoom {
    param (
        [Parameter(Mandatory = $true)]
        [object]$GameState
    )

    Write-Host "Continuing from room $($GameState.CurrentRoom)..."

    switch ($GameState.CurrentRoom) {
        1 {
            Start-RoomFakeWebsite -GameState $GameState
        }

        2 {
            # Start-RoomPassword -GameState $GameState
            Write-Host "Room navigation for this room is not implemented yet." -ForegroundColor Yellow
            Write-Host "Current room from save file: $($GameState.CurrentRoom)"
        }

        3 {
            # Start-RoomPhishingMail -GameState $GameState
            Write-Host "Room navigation for this room is not implemented yet." -ForegroundColor Yellow
            Write-Host "Current room from save file: $($GameState.CurrentRoom)"
        }

        4 {
            # Start-RoomTeamsInvite -GameState $GameState
            Write-Host "Room navigation for this room is not implemented yet." -ForegroundColor Yellow
            Write-Host "Current room from save file: $($GameState.CurrentRoom)"
        }

        5 {
            # Start-RoomTrojan -GameState $GameState
            Write-Host "Room navigation for this room is not implemented yet." -ForegroundColor Yellow
            Write-Host "Current room from save file: $($GameState.CurrentRoom)"
        }

        6 {
            # Start-RoomRansomware -GameState $GameState
            Write-Host "Room navigation for this room is not implemented yet." -ForegroundColor Yellow
            Write-Host "Current room from save file: $($GameState.CurrentRoom)"
        }

        default {
            Write-Host "Invalid room number in save file." -ForegroundColor Red
            Write-Host "Current room from save file: $($GameState.CurrentRoom)"
        }
    }
}

Export-ModuleMember -Function Show-MainMenu, Show-TerminalBox, Start-SavedRoom