# Module for handling GameState updates such as score, room progression, hints and mistakes

# Function for adding score for a correct answer
function Add-Score {
    param (
        [Parameter(Mandatory = $true)]
        [object]$GameState
    )

    # Adds 20 points for a correct answer
    $GameState.Score += 20
    return $GameState
}

# Function for setting the current room the player is in
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

# Function for increasing the number of hints used by the player
function Use-Hint {
    param (
        [Parameter(Mandatory = $true)]
        [object]$GameState
    )

    $GameState.HintsUsed++
    return $GameState
}

# Function for increasing the number of mistakes made by the player
function Add-Mistake {
    param (
        [Parameter(Mandatory = $true)]
        [object]$GameState
    )

    $GameState.Mistakes++
    return $GameState
}

# Function for marking a room as completed if it has not already been completed
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

Export-ModuleMember -Function Add-Score, Set-CurrentRoom, Use-Hint, Add-Mistake, Complete-Room
