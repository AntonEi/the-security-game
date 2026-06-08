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
function Set-CurrentRoom {
    param (
        [Parameter(Mandatory = $true)]
        [object]$GameState,

        [Parameter(Mandatory = $true)]
        [int]$RoomNumber
    )

    $GameState.CurrentRoom = $RoomNumber
    return $GameState
}