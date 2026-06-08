function Update-Score {
    param (
        [Parameter(Mandatory = $true)]
        [object]$GameState,

        [Parameter(Mandatory = $true)]
        [int]$Points
    )

    $GameState.Score += $Points
    return $GameState
}