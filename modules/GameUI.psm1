Import-Module "$PSScriptRoot\GameState.psm1" -Force
Import-Module "$PSScriptRoot\GamestateFunctions.psm1" -Force
Import-Module "$PSScriptRoot\RoomAnimations.psm1" -Force

. "$PSScriptRoot\..\rooms\Room-FakeWebsite.ps1"
. "$PSScriptRoot\..\rooms\Room-Password.ps1"
. "$PSScriptRoot\..\rooms\Room-PhishingMail.ps1"
. "$PSScriptRoot\..\rooms\Room-Ransomware.ps1"
. "$PSScriptRoot\..\rooms\Room-TeamsInvite.ps1"
. "$PSScriptRoot\..\rooms\Room-Trojan.ps1"


function Show-TerminalBox {
    param (
        [Parameter(Mandatory = $true)]
        [string]$Label,

        [Parameter(Mandatory = $true)]
        [AllowEmptyString()]
        [string[]]$Lines,

        [int]$Width = 90,

        [string]$BorderColor = "Cyan",

        [string]$TextColor = "White",

        [switch]$Clear
    )

    if ($Clear) {
        Clear-Host
    }

    $topLeft = [char]0x250C
    $topRight = [char]0x2510
    $bottomLeft = [char]0x2514
    $bottomRight = [char]0x2518
    $horizontal = [char]0x2500
    $vertical = [char]0x2502

    $maxTextLength = $Width - 4

    $topStart = "$topLeft$horizontal[ $Label ]"
    $dashCount = $Width - $topStart.Length - 1

    if ($dashCount -lt 0) {
        $dashCount = 0
    }

    $topLine = $topStart + ($horizontal.ToString() * $dashCount) + $topRight
    $bottomLine = $bottomLeft + ($horizontal.ToString() * ($Width - 2)) + $bottomRight

    Write-Host $topLine -ForegroundColor $BorderColor

    foreach ($line in $Lines) {
        if ($line.Length -gt $maxTextLength) {
            $line = $line.Substring(0, $maxTextLength - 3) + "..."
        }

        $formattedLine = "$vertical  " + $line.PadRight($maxTextLength) + $vertical
        Write-Host $formattedLine -ForegroundColor $TextColor
    }

    Write-Host $bottomLine -ForegroundColor $BorderColor
    Write-Host ""
}

# Displays the main menu and handles starting, loading, or exiting the game.
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
                Clear-Host

                Show-TerminalBox -Label "PLAYER SETUP" -Lines @(
                    "Before the game starts,",
                    "enter your player name."
                ) -BorderColor "Cyan" -TextColor "White" -Clear

                $playerName = Read-Host "Enter player name"

                while ([string]::IsNullOrWhiteSpace($playerName)) {
                    Write-Host "Player name cannot be empty." -ForegroundColor Red
                    $playerName = Read-Host "Enter player name"
                }

                $difficulty = Select-Difficulty
                $gameState = New-GameState -PlayerName $playerName -Difficulty $difficulty

                $rooms = @(
                    @{
                        Name         = "Fake Website"
                        FunctionName = "Start-RoomFakeWebsite"
                    },
                    @{
                        Name         = "Trojan"
                        FunctionName = "Start-RoomTrojan"
                    },
                    @{
                        Name         = "Password"
                        FunctionName = "Start-RoomPassword"
                    },
                    @{
                        Name         = "Phishing Mail"
                        FunctionName = "Start-PhishingRoom"
                    },
                    @{
                        Name         = "Teams Invite"
                        FunctionName = "Start-RoomTeamsInvite"
                    },
                    @{
                        Name         = "Ransomware"
                        FunctionName = "Start-RoomRansomware"
                    }
                )

                foreach ($room in $rooms) {
                    $functionName = $room.FunctionName

                    if (-not (Get-Command $functionName -ErrorAction SilentlyContinue)) {
                        Show-TerminalBox -Label "ROOM NOT FOUND" -Lines @(
                            "Could not find room function:",
                            $functionName,
                            "",
                            "Stopping game here."
                        ) -BorderColor "Yellow" -TextColor "Yellow" -Clear

                        break
                    }

                    $roomCompleted = & $functionName -GameState $gameState

                    if ($roomCompleted -eq $true) {
                        $gameState = Add-CompletedRoom -GameState $gameState -RoomName $room.Name
                        $gameState.CurrentRoom++

                        if ($gameState.CurrentRoom -le $rooms.Count) {
                            Show-TerminalBox -Label "NEXT ROOM" -Lines @(
                                "Room completed: $($room.Name)",
                                "",
                                "Press Enter to continue to the next room.",
                                "Type 2 to save the game first."
                            ) -BorderColor "Cyan" -TextColor "White" -Clear

                            $nextChoice = Read-Host "Choose"

                            if ($nextChoice.Trim() -eq "2") {
                                Save-GameState -GameState $gameState

                                Show-TerminalBox -Label "GAME SAVED" -Lines @(
                                    "Your progress has been saved.",
                                    "",
                                    "You will continue from room $($gameState.CurrentRoom)."
                                ) -BorderColor "Green" -TextColor "Green" -Clear

                                Read-Host "Press Enter to continue"
                            }
                        }
                    }
                    else {
                        break
                    }
                }

                Show-EndScreen -GameState $gameState
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

# Lets the player choose a difficulty level and keeps asking until a valid option is selected.
function Select-Difficulty {
    while ($true) {
        Clear-Host

        Write-Host "Choose difficulty"
        Write-Host ""
        Write-Host "1. Easy"
        Write-Host "2. Medium"
        Write-Host "3. Hard"
        Write-Host ""

        $choice = Read-Host "Choose an option"

        switch ($choice) {
            "1" { return "Easy" }
            "2" { return "Medium" }
            "3" { return "Hard" }
            default {
                Write-Host "Invalid choice. Please try again." -ForegroundColor Red
                Start-Sleep -Seconds 2
            }
        }
    }
}

# Continues a saved game by starting the room stored in GameState.CurrentRoom.
function Start-SavedRoom {
    param (
        [Parameter(Mandatory = $true)]
        [object]$GameState
    )

    Write-Host "Continuing from room $($GameState.CurrentRoom)..."

    switch ($GameState.CurrentRoom) {
        1 {
            $roomCompleted = Start-RoomFakeWebsite -GameState $GameState

            if ($roomCompleted -eq $true) {
                $GameState = Add-CompletedRoom -GameState $GameState -RoomName "Fake Website"
                $GameState.CurrentRoom = 2
                Save-GameState -GameState $GameState
            }
        }

        2 {
            $roomCompleted = Start-RoomTrojan -GameState $GameState

            if ($roomCompleted -eq $true) {
                $GameState = Add-CompletedRoom -GameState $GameState -RoomName "Trojan"
                $GameState.CurrentRoom = 3
                Save-GameState -GameState $GameState
            }
        }

        3 {
            $roomCompleted = Start-RoomPassword -GameState $GameState

            if ($roomCompleted -eq $true) {
                $GameState = Add-CompletedRoom -GameState $GameState -RoomName "Password"
                $GameState.CurrentRoom = 4
                Save-GameState -GameState $GameState
            }
        }

        4 {
            $roomCompleted = Start-PhishingRoom -GameState $GameState

            if ($roomCompleted -eq $true) {
                $GameState = Add-CompletedRoom -GameState $GameState -RoomName "Phishing Mail"
                $GameState.CurrentRoom = 5
                Save-GameState -GameState $GameState
            }
        }

        5 {
            $roomCompleted = Start-RoomTeamsInvite -GameState $GameState

            if ($roomCompleted -eq $true) {
                $GameState = Add-CompletedRoom -GameState $GameState -RoomName "Teams Invite"
                $GameState.CurrentRoom = 6
                Save-GameState -GameState $GameState
            }
        }

        6 {
            $roomCompleted = Start-RoomRansomware -GameState $GameState

            if ($roomCompleted -eq $true) {
                $GameState = Add-CompletedRoom -GameState $GameState -RoomName "Ransomware"
                $GameState.CurrentRoom = 7
                Save-GameState -GameState $GameState

                Show-EndScreen -GameState $GameState
            }
            else {
                Save-GameState -GameState $GameState

                Show-TerminalBox -Label "ROOM FAILED" -Lines @(
                    "The ransomware incident was not contained.",
                    "",
                    "You can try again from the saved game."
                ) -BorderColor "Red" -TextColor "Red" -Clear
            }
        }

        7 {
            Show-EndScreen -GameState $GameState
        }

        default {
            Write-Host "Invalid room number in save file." -ForegroundColor Red
            Write-Host "Current room from save file: $($GameState.CurrentRoom)"
        }
    }
}

function Get-SecurityAssessment {
    param(
        [int]$Score,
        [int]$Mistakes
    )

    if ($Score -ge 210) {
        return "Strong security awareness. You identified threats confidently and made safe decisions."
    }
    elseif ($Score -ge 110) {
        return "Good understanding of security risks. With a bit more practice, you'll be fully prepared."
    }
    else {
        return "You're building your security awareness. Reviewing the scenarios will help strengthen your skills."
    }
}

function Show-EndScreen {
    param(
        [Parameter(Mandatory = $true)]
        [object]$GameState
    )

    $assessment = Get-SecurityAssessment -Score $GameState.Score -Mistakes $GameState.Mistakes

    Show-TerminalBox `
        -Label "GAME COMPLETE" `
        -Lines @(
        "Well done, $($GameState.PlayerName)!",
        "",
        "You successfully escaped DARKWEB: TERMINAL LOCKDOWN.",
        "",
        "RESULTS:",
        "Player: $($GameState.PlayerName)",
        "Difficulty: $($GameState.Difficulty)",
        "Score: $($GameState.Score)",
        "Mistakes: $($GameState.Mistakes)",
        "Hints used: $($GameState.HintsUsed)",
        "Completed rooms: $($GameState.CompletedRooms.Count)",
        "",
        "Security Assessment:",
        "$assessment",
        "",
        "Press Enter to exit the game..."
    ) `
        -BorderColor "Cyan" `
        -TextColor "White" `
        -Clear

    Read-Host | Out-Null
    exit
}

Export-ModuleMember -Function Show-MainMenu, Show-TerminalBox, Start-SavedRoom, Show-EndScreen
