Import-Module "$PSScriptRoot\GameState.psm1" -Force

. "$PSScriptRoot\..\rooms\Room-FakeWebsite.ps1"


function Show-TerminalBox {
    param (
        [Parameter(Mandatory = $true)]
        [string]$Label,

        [Parameter(Mandatory = $true)]
        [AllowEmptyString()]
        [string[]]$Lines,

        [int]$Width = 58,

        [string]$BorderColor = "Cyan",

        [string]$TextColor = "White",

        [switch]$Clear
    )

    if ($Clear) {
        Clear-Host
    }

    $maxTextLength = $Width - 4

    $topStart = "┌─[ $Label ]"
    $dashCount = $Width - $topStart.Length - 1

    if ($dashCount -lt 0) {
        $dashCount = 0
    }

    $topLine = $topStart + ("─" * $dashCount) + "┐"
    $bottomLine = "└" + ("─" * ($Width - 2)) + "┘"

    Write-Host $topLine -ForegroundColor $BorderColor

    foreach ($line in $Lines) {
        if ($line.Length -gt $maxTextLength) {
            $line = $line.Substring(0, $maxTextLength - 3) + "..."
        }

        $formattedLine = "│  " + $line.PadRight($maxTextLength) + "│"
        Write-Host $formattedLine -ForegroundColor $TextColor
    }

    Write-Host $bottomLine -ForegroundColor $BorderColor
    Write-Host ""
}
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
                Pause
            }

            "2" {
                $gameState = Load-GameState

                if (-not $gameState) {
                    Write-Host ""
                    Write-Host "No saved game found." -ForegroundColor Yellow
                    Read-Host "Press Enter to return to menu"
                }
                else {
                    Write-Host ""
                    Write-Host "Loaded game."
                    Write-Host "Player: $($gameState.PlayerName)"
                    Write-Host "Difficulty: $($gameState.Difficulty)"
                    Write-Host "Current room: $($gameState.CurrentRoom)"
                    Write-Host "Score: $($gameState.Score)"
                    Write-Host "Hints used: $($gameState.HintsUsed)"
                    Write-Host "Mistakes: $($gameState.Mistakes)"
                    Write-Host "Completed rooms: $($gameState.CompletedRooms -join ', ')"

                    Read-Host "Press Enter to return to menu"
                }
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

Export-ModuleMember -Function Show-MainMenu, Show-TerminalBox