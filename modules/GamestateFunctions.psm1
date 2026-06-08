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

function Use-Hint {
    param (
        [Parameter(Mandatory = $true)]
        [object]$GameState
    )

    $GameState.HintsUsed++
    return $GameState
}

function Add-Mistake {
    param (
        [Parameter(Mandatory = $true)]
        [object]$GameState
    )

    $GameState.Mistakes++
    return $GameState
}

function Complete-Room {
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
