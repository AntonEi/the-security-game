function New-GameState {
    param (
        [string]$PlayerName = "Player",
        [string]$Difficulty = "Medium"
    )

    return [PSCustomObject]@{
        PlayerName     = $PlayerName
        Difficulty     = $Difficulty
        CurrentRoom    = 1
        Score          = 0
        HintsUsed      = 0
        Mistakes       = 0
        CompletedRooms = @()
    }
}

function Save-GameState {
    param (
        [Parameter(Mandatory = $true)]
        [object]$GameState,

        [string]$SavePath = "$PSScriptRoot/../saves/savegame.json"
    )

    $saveDirectory = Split-Path -Path $SavePath -Parent

    if (-not (Test-Path -Path $saveDirectory)) {
        New-Item -Path $saveDirectory -ItemType Directory | Out-Null
    }

    $GameState |
        ConvertTo-Json -Depth 5 |
        Set-Content -Path $SavePath -Encoding UTF8
}

function Load-GameState {
    param (
        [string]$SavePath = "$PSScriptRoot/../saves/savegame.json"
    )

    if (-not (Test-Path -Path $SavePath)) {
        return $null
    }

    $json = Get-Content -Path $SavePath -Raw

    if ([string]::IsNullOrWhiteSpace($json)) {
        return $null
    }

    return $json | ConvertFrom-Json
}

function Add-CompletedRoom {
    param (
        [Parameter(Mandatory = $true)]
        [object]$GameState,

        [Parameter(Mandatory = $true)]
        [string]$RoomName
    )

    if ($GameState.CompletedRooms -notcontains $RoomName) {
        $GameState.CompletedRooms += $RoomName
    }

    return $GameState
}

function Import-SavedGame {
    $gameState = Load-GameState

    if ($null -eq $gameState) {
        Write-Host "No saved game found." -ForegroundColor Yellow
        return $null
    }

    Write-Host "Saved game found." -ForegroundColor Green
    Write-Host "Welcome back, $($gameState.PlayerName)."
    Write-Host "You continue from room $($gameState.CurrentRoom)."

    Start-Sleep -Seconds 5

    return $gameState
}

Export-ModuleMember -Function New-GameState, Save-GameState, Load-GameState, Import-SavedGame, Add-CompletedRoom
