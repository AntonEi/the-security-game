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
