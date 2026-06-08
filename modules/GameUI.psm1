function Show-MainMenu {
    while ($true) {
        Clear-Host

        Write-Host "===================================="
        Write-Host "DARKWEB ESCAPE: TERMINAL LOCKDOWN"
        Write-Host "===================================="
        Write-Host ""
        Write-Host "1. Starta nytt spel"
        Write-Host "2. Ladda sparat spel"
        Write-Host "3. Avsluta"
        Write-Host ""

        $choice = Read-Host "Välj alternativ"

        switch ($choice) {
            "1" {
                # Function to start game here
                Pause
            }

            "2" {
                    # Function to load game here
                Pause
            }

            "3" {
                Write-Host "Avslutar spelet..."
                return
            }

            default {
                Write-Host "Ogiltigt val. Försök igen." -ForegroundColor Red
                Start-Sleep -Seconds 2
            }
        }
    }
}

Export-ModuleMember -Function Show-MainMenu