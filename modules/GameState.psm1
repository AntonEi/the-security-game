function New-GameState {
    param (
        [string]$PlayerName = "",
        [string]$Difficulty = "Medel"
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

Export-ModuleMember -Function New-GameState, Save-GameState