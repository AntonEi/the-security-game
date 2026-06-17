Import-Module "$PSScriptRoot\modules\GameUI.psm1" -Force

try {
    Show-MainMenu
}
catch {
    Write-Output "An error has occured"
}
