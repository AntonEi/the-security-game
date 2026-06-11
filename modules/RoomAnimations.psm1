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


function FakeWebsiteOutro {
    $frames = @(
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
        ),
        @(
            '+------------------------------------------------+',
            '| http://secure-login-bank.com                    |',
            '+------------------------------------------------+',
            '|                                                |',
            '|  NORDIC TRUST BANK                             |',
            '|  --------------------------------------------  |',
            '|                                                |',
            '|        [ Username ]              ########      |',
            '|        [ Password ]             # STOP #       |',
            '|        [  LOGIN   ]              ########      |',
            '|                                                |',
            '+------------------------------------------------+'
        ),
        @(
            '+------------------------------------------------+',
            '| WEBSITE BLOCKED                                 |',
            '+------------------------------------------------+',
            '|                                                |',
            '|  NORDIC TRUST BANK                             |',
            '|  --------------------------------------------  |',
            '|                                                |',
            '|        [ Username ]              ########      |',
            '|        [ Password ]             # STOP #       |',
            '|        [  LOGIN   ]              ########      |',
            '|                                                |',
            '+------------------------------------------------+'
        ),
        @(
            '+------------------------------------------------+',
            '| ROOM CLEARED                                    |',
            '+------------------------------------------------+',
            '|                                                |',
            '|  NORDIC TRUST BANK                             |',
            '|  --------------------------------------------  |',
            '|                                                |',
            '|        [ Username ]                 OK         |',
            '|        [ Password ]                /           |',
            '|        [  LOGIN   ]               /            |',
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

    Write-Host ""
    Write-Host "FAKE WEBSITE ROOM CLEARED" -ForegroundColor Green
    Write-Host "Expired certificate noticed. Unsafe login avoided." -ForegroundColor Green
    Write-Host ""

    Start-Sleep -Milliseconds 2000
}

function FishingIntro {
    $frames = @(
        @(
            '        O',
            '       /|\',
            '       / \',
            '______/___\________________',
            '          |',
            '          |',
            '          J',
            '',
            '                     ><(((o>'
        ),
        @(
            '        O',
            '       /|\',
            '       / \',
            '______/___\________________',
            '          |',
            '          |',
            '          J',
            '',
            '                 ><(((o>'
        ),
        @(
            '        O',
            '       /|\',
            '       / \',
            '______/___\________________',
            '          |',
            '          |',
            '          J',
            '',
            '             ><(((o>'
        )
    )

    foreach ($frame in $frames) {
        Clear-Host

        Write-Host ""
        Write-Host "FISHING ROOM" -ForegroundColor Cyan
        Write-Host ""

        foreach ($line in $frame) {
            Write-Host $line -ForegroundColor Yellow
        }

        Write-Host ""
        Write-Host "The bait is waiting..." -ForegroundColor DarkCyan
        Write-Host ("Entering Phishing mail room...") -ForegroundColor DarkYellow

        Start-Sleep -Milliseconds 600
    }

    Start-Sleep -Milliseconds 700
}

function FishingOutro {
    $frames = @(
        @(
            '        O',
            '       /|\',
            '       / \',
            '______/___\________________',
            '          |',
            '          |',
            '          J ><(((o>',
            ''
        ),
        @(
            '        O',
            '       /|\',
            '       / \',
            '______/___\________________',
            '          |',
            '          |',
            '          J',
            '               ><(((o>'
        ),
        @(
            '        O',
            '       /|\',
            '       / \',
            '______/___\________________',
            '          |',
            '          J',
            '',
            '                    ><(((o>'
        ),
        @(
            '        O',
            '       /|\',
            '       / \',
            '______/___\________________',
            '          J',
            '',
            '',
            '                         ><(((o>'
        )
    )

    foreach ($frame in $frames) {
        Clear-Host

        Write-Host ""
        Write-Host "FISHING ROOM" -ForegroundColor Cyan
        Write-Host ""

        foreach ($line in $frame) {
            Write-Host $line -ForegroundColor Yellow
        }

        Write-Host ""
        Write-Host "The HACKER lost the catch..." -ForegroundColor Red

        Start-Sleep -Milliseconds 600
    }

    Write-Host ""
    Write-Host "FISHING ROOM CLEARED" -ForegroundColor Green
    Write-Host "You escaped the bait." -ForegroundColor Green
    Write-Host ""

    Start-Sleep -Milliseconds 1000
}


function PasswordIntro {
    $frames = @(
        @(
            '+------------------------------------------------+',
            '| PASSWORD VAULT                                  |',
            '+------------------------------------------------+',
            '|                                                |',
            '|        Username: admin                         |',
            '|        Password: 123456                        |',
            '|                                                |',
            '|        Strength: [##--------]                  |',
            '|                                                |',
            '+------------------------------------------------+'
        ),
        @(
            '+------------------------------------------------+',
            '| PASSWORD VAULT                                  |',
            '+------------------------------------------------+',
            '|                                                |',
            '|        Username: admin                         |',
            '|        Password: qwerty                        |',
            '|                                                |',
            '|        Strength: [###-------]                  |',
            '|                                                |',
            '+------------------------------------------------+'
        ),
        @(
            '+------------------------------------------------+',
            '| PASSWORD VAULT                                  |',
            '+------------------------------------------------+',
            '|                                                |',
            '|        Username: admin                         |',
            '|        Password: Summer123                     |',
            '|                                                |',
            '|        Strength: [####------]                  |',
            '|                                                |',
            '+------------------------------------------------+'
        ),
        @(
            '+------------------------------------------------+',
            '| PASSWORD WARNING                                |',
            '+------------------------------------------------+',
            '|                                                |',
            '|        Weak password detected.                 |',
            '|                                                |',
            '|        Strength: [####------]                  |',
            '|                                                |',
            '+------------------------------------------------+'
        )
    )

    foreach ($frame in $frames) {
        Clear-Host

        Write-Host ""
        Write-Host "PASSWORD ROOM" -ForegroundColor Cyan
        Write-Host ""

        foreach ($line in $frame) {
            Write-Host $line -ForegroundColor Yellow
        }

        Start-Sleep -Milliseconds 1000
    }

    $finalOffset = 1

    Write-Host ""
    Write-Host (" " * $finalOffset + "Weak password detected...") -ForegroundColor Red
    Write-Host (" " * $finalOffset + "Entering Password room...") -ForegroundColor Cyan
    Write-Host ""

    Start-Sleep -Milliseconds 2000
}


function PasswordOutro {
    $frames = @(
        @(
            '+------------------------------------------------+',
            '| PASSWORD VAULT                                  |',
            '+------------------------------------------------+',
            '|                                                |',
            '|        Username: admin                         |',
            '|        Password: ********                      |',
            '|                                                |',
            '|        Strength: [######----]                  |',
            '|                                                |',
            '+------------------------------------------------+'
        ),
        @(
            '+------------------------------------------------+',
            '| PASSWORD VAULT                                  |',
            '+------------------------------------------------+',
            '|                                                |',
            '|        Username: admin                         |',
            '|        Password: ************                  |',
            '|                                                |',
            '|        Strength: [########--]                  |',
            '|                                                |',
            '+------------------------------------------------+'
        ),
        @(
            '+------------------------------------------------+',
            '| PASSWORD VAULT                                  |',
            '+------------------------------------------------+',
            '|                                                |',
            '|        Username: admin                         |',
            '|        Password: **************                |',
            '|                                                |',
            '|        Strength: [##########]                  |',
            '|                                                |',
            '+------------------------------------------------+'
        ),
        @(
            '+------------------------------------------------+',
            '| ROOM CLEARED                                    |',
            '+------------------------------------------------+',
            '|                                                |',
            '|        Password secured.                       |',
            '|                                                |',
            '|        Strength: [##########]                  |',
            '|                                                |',
            '+------------------------------------------------+'
        )
    )

    foreach ($frame in $frames) {
        Clear-Host

        Write-Host ""
        Write-Host "PASSWORD ROOM" -ForegroundColor Cyan
        Write-Host ""

        foreach ($line in $frame) {
            Write-Host $line -ForegroundColor Yellow
        }

        Start-Sleep -Milliseconds 1000
    }

    Write-Host ""
    Write-Host "PASSWORD ROOM CLEARED" -ForegroundColor Green
    Write-Host "The weak password was replaced with a stronger one." -ForegroundColor Green
    Write-Host ""

    Start-Sleep -Milliseconds 2000
}