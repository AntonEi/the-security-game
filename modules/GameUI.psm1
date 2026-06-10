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
                Pause
            }

            "2" {
                $gameState = Import-SavedGame

                if ($null -ne $gameState) {
                    Write-Host ""
                    Write-Host "Player: $($gameState.PlayerName)"
                    Write-Host "Difficulty: $($gameState.Difficulty)"
                    Write-Host "Current room: $($gameState.CurrentRoom)"
                    Write-Host "Score: $($gameState.Score)"
                    Write-Host "Hints used: $($gameState.HintsUsed)"
                    Write-Host "Mistakes: $($gameState.Mistakes)"
                    Write-Host "Completed rooms: $($gameState.CompletedRooms -join ', ')"
                    Write-Host ""

                    # TODO: Connect CurrentRoom to actual room scripts when all rooms are implemented.

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

Export-ModuleMember -Function Show-MainMenu