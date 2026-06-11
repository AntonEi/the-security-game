function FakeWebsiteIntro {
    $frames = @(
        @(
            '+------------------------------------------------+',
            '| http://secure-login-bank.com                    |',
            '+------------------------------------------------+',
            '|                                                |',
            '|  NORDIC TRUST BANK                             |',
            '|  --------------------------------------------  |',
            '|                                                |',
            '|        [ Username ]                            |',
            '|        [ Password ]                            |',
            '|        [  LOGIN   ]                            |',
            '|                                                |',
            '+------------------------------------------------+'
        ),
        @(
            '+------------------------------------------------+',
            '| http://secure-login-bank.com                    |',
            '+------------------------------------------------+',
            '|                                                |',
            '|  NORDIC TRUST BANK                             |',
            '|  --------------------------------------------  |',
            '|                                                |',
            '|        [ Username ]              ______        |',
            '|        [ Password ]             | LOCK |       |',
            '|        [  LOGIN   ]             |______|       |',
            '|                                                |',
            '+------------------------------------------------+'
        ),
        @(
            '+------------------------------------------------+',
            '| http://secure-login-bank.com                    |',
            '+------------------------------------------------+',
            '|                                                |',
            '|  NORDIC TRUST BANK                             |',
            '|  --------------------------------------------  |',
            '|                                                |',
            '|        [ Username ]              ______        |',
            '|        [ Password ]             | CERT |       |',
            '|        [  LOGIN   ]             |  X   |       |',
            '|                                                |',
            '+------------------------------------------------+'
        ),
        @(
            '+------------------------------------------------+',
            '| http://secure-login-bank.com                    |',
            '+------------------------------------------------+',
            '|                                                |',
            '|  NORDIC TRUST BANK                             |',
            '|  --------------------------------------------  |',
            '|                                                |',
            '|        [ Username ]              WARNING       |',
            '|        [ Password ]             CERT EXPIRED   |',
            '|        [  LOGIN   ]             NOT TRUSTED    |',
            '|                                                |',
            '+------------------------------------------------+'
        )
    )

    foreach ($frame in $frames) {
        Clear-Host

        Write-Host ""
        Write-Host "FAKE WEBSITE ROOM" -ForegroundColor Cyan
        Write-Host ""

        foreach ($line in $frame) {
            Write-Host $line -ForegroundColor Yellow
        }

        Start-Sleep -Milliseconds 1010
    }

    $finalOffset = 1

    Write-Host ""
    Write-Host (" " * $finalOffset + "Expired certificate detected...") -ForegroundColor Red
    Write-Host (" " * $finalOffset + "Entering Fake Website room...") -ForegroundColor Cyan
    Write-Host ""

    Start-Sleep -Milliseconds 2000
}