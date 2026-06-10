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
        Write-Host "2. Load "
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
                    # Function to start game here
                Pause
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

Export-ModuleMember -Function Show-MainMenu