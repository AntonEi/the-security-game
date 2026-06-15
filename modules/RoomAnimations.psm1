# Shows the intro animation for the Fake Website room.
# The animation presents a fake login page and highlights certificate warnings.

function Show-FakeWebsiteIntro {
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


# Shows the outro animation for the Fake Website room.
# The animation blocks the unsafe website and confirms that the room was cleared.
function Show-FakeWebsiteOutro {
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

# Shows the intro animation for the Phishing room.
# The animation introduces the phishing theme by showing a fishing hook and bait.

function Show-PhishingIntro {
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

# Shows the outro animation for the Phishing room.
# The animation shows the player avoiding the bait and clearing the phishing challenge.

function Show-PhishingOutro {
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

# Shows the intro animation for the Password room.
# The animation displays weak password examples before entering the password challenge.
function Show-PasswordIntro {
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

# Shows the outro animation for the Password room.
# The animation shows the password becoming stronger and confirms the room was cleared.
function Show-PasswordOutro {
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

# Shows the intro animation for the Teams Invite room.
# The animation presents a suspicious external Teams invite before the challenge starts.
function Show-TeamsInviteIntro {
    $frames = @(
        @(
            '+------------------------------------------------+',
            '| MICROSOFT TEAMS                                 |',
            '+------------------------------------------------+',
            '|                                                |',
            '|        Incoming meeting invite                 |',
            '|                                                |',
            '|        [ Join meeting ]                        |',
            '|                                                |',
            '+------------------------------------------------+'
        ),
        @(
            '+------------------------------------------------+',
            '| MICROSOFT TEAMS                                 |',
            '+------------------------------------------------+',
            '|                                                |',
            '|        Project Sync                            |',
            '|        Organizer: External User                |',
            '|                                                |',
            '|        [ Join meeting ]                        |',
            '|                                                |',
            '+------------------------------------------------+'
        ),
        @(
            '+------------------------------------------------+',
            '| MICROSOFT TEAMS                                 |',
            '+------------------------------------------------+',
            '|                                                |',
            '|        Project Sync                            |',
            '|        Organizer: External User                |',
            '|        Link: teams-login.verify-meeting.ru     |',
            '|                                                |',
            '|        [ Join meeting ]                        |',
            '+------------------------------------------------+'
        ),
        @(
            '+------------------------------------------------+',
            '| SECURITY WARNING                                |',
            '+------------------------------------------------+',
            '|                                                |',
            '|        External invite detected                |',
            '|        Suspicious meeting link                 |',
            '|                                                |',
            '|        [ Do not join ]                         |',
            '|                                                |',
            '+------------------------------------------------+'
        )
    )

    foreach ($frame in $frames) {
        Clear-Host

        Write-Host ""
        Write-Host "TEAMS INVITE ROOM" -ForegroundColor Cyan
        Write-Host ""

        foreach ($line in $frame) {
            Write-Host $line -ForegroundColor Yellow
        }

        Start-Sleep -Milliseconds 1200
    }

    $finalOffset = 1

    Write-Host ""
    Write-Host (" " * $finalOffset + "Suspicious Teams invite detected...") -ForegroundColor Red
    Write-Host (" " * $finalOffset + "Entering Teams Invite room...") -ForegroundColor Cyan
    Write-Host ""

    Start-Sleep -Milliseconds 2000
}

# Shows the outro animation for the Teams Invite room.
# The animation shows the suspicious invite being inspected, blocked, and avoided.
function Show-TeamsInviteOutro {
    $frames = @(
        @(
            '+------------------------------------------------+',
            '| MICROSOFT TEAMS                                 |',
            '+------------------------------------------------+',
            '|                                                |',
            '|        Project Sync                            |',
            '|        Organizer: External User                |',
            '|        Link: teams-login.verify-meeting.ru     |',
            '|                                                |',
            '|        [ Join meeting ]                        |',
            '+------------------------------------------------+'
        ),
        @(
            '+------------------------------------------------+',
            '| USER ACTION                                     |',
            '+------------------------------------------------+',
            '|                                                |',
            '|        Invite inspected                        |',
            '|        Suspicious link found                   |',
            '|                                                |',
            '|        [ Report invite ]                       |',
            '|                                                |',
            '+------------------------------------------------+'
        ),
        @(
            '+------------------------------------------------+',
            '| INVITE BLOCKED                                  |',
            '+------------------------------------------------+',
            '|                                                |',
            '|        ########                                |',
            '|        # STOP #                                |',
            '|        ########                                |',
            '|                                                |',
            '|        Meeting was not opened                  |',
            '+------------------------------------------------+'
        ),
        @(
            '+------------------------------------------------+',
            '| ROOM CLEARED                                    |',
            '+------------------------------------------------+',
            '|                                                |',
            '|        Teams invite identified                 |',
            '|        Suspicious meeting avoided              |',
            '|                                                |',
            '|        Status: SAFE                            |',
            '+------------------------------------------------+'
        )
    )

    foreach ($frame in $frames) {
        Clear-Host

        Write-Host ""
        Write-Host "TEAMS INVITE ROOM" -ForegroundColor Cyan
        Write-Host ""

        foreach ($line in $frame) {
            Write-Host $line -ForegroundColor Yellow
        }

        Start-Sleep -Milliseconds 1200
    }

    Write-Host ""
    Write-Host "TEAMS INVITE ROOM CLEARED" -ForegroundColor Green
    Write-Host "The suspicious Teams invite was avoided." -ForegroundColor Green
    Write-Host ""

    Start-Sleep -Milliseconds 1000
}

# Shows the intro animation for the Trojan room.
# The animation moves a disguised executable file into view before the Trojan challenge starts.
function Show-TrojanIntro {
    $trojanArt = @(
        "              /\",
        "             /  \",
        "       _____/____\_____",
        "      /  File.PDF.EXE  \",
        " ____/__________________\____",
        "   (O)                (O)"
    )

    $finalOffset = 16

    for ($offset = 0; $offset -le $finalOffset; $offset++) {
        Clear-Host

        Write-Host ""
        Write-Host ""

        foreach ($line in $trojanArt) {
            Write-Host ((" " * $offset) + $line) -ForegroundColor Yellow
        }

        Start-Sleep -Milliseconds 80
    }
    $finalOffset = 1
    Write-Host ""
    Write-Host (" " * $finalOffset + "Suspicious file detected...") -ForegroundColor Red
    Write-Host (" " * $finalOffset + "Entering Trojan room...") -ForegroundColor DarkYellow
    Write-Host ""

    Start-Sleep -Milliseconds 2200
}

# Shows the outro animation for the Trojan room.
# The animation removes the suspicious file and confirms that the Trojan threat was contained.
function Show-TrojanOutro {
    $offset = 16

    $frames = @(
        @(
            "              /\",
            "             /  \",
            "       _____/____\_____",
            "      /  File.PDF.EXE  \",
            " ____/__________________\____",
            "   (O)                (O)"
        ),
        @(
            "              /\",
            "             /  \",
            "       _____/____\_____",
            "      /   File.PDF.E   \",
            " ____/__________________\____",
            "                         "
        ),
        @(
            "                         ",
            "                         ",
            "                         ",
            "      /    File.PDF    \",
            " ____/__________________\____",
            "                         "
        )
    )

    foreach ($frame in $frames) {
        Clear-Host

        Write-Host ""
        Write-Host ""

        foreach ($line in $frame) {
            Write-Host ((" " * $offset) + $line) -ForegroundColor Yellow
        }

        Start-Sleep -Milliseconds 700
    }

    
    Write-Host ""
    Write-Host ((" " * $offset) + "ROOM CLEARED") -ForegroundColor Green
    Write-Host ((" " * $offset) + "Trojan threat contained.") -ForegroundColor Green
    Write-Host ""

    Start-Sleep -Milliseconds 1500
}

# Shows the intro animation for the Ransomware room.
# The animation shows files being encrypted and introduces the final ransomware challenge.
function Show-RansomwareIntro {
    $frames = @(
        @(
            '  FILE SYSTEM',
            '',
            '  [ family_photos ]    [ invoices ]       [ contracts ]',
            '  photo_01.jpg         invoice.xlsx       agreement.pdf',
            '  photo_02.jpg         budget.xlsx        customer_list.csv',
            '',
            '  Status: Normal'
        ),
        @(
            '  FILE SYSTEM',
            '',
            '  [ family_photos ]    [ invoices ]       [ contracts ]',
            '  photo_01.jpg         invoice.xlsx       agreement.pdf',
            '  photo_02.jpg         budget.xlsx        customer_list.csv',
            '',
            '  Status: Unknown process detected...'
        ),
        @(
            '  FILE SYSTEM',
            '',
            '  [ family_photos ]    [ invoices ]       [ contracts ]',
            '  photo_01.jpg.locked  invoice.xlsx       agreement.pdf',
            '  photo_02.jpg         budget.xlsx.locked customer_list.csv',
            '',
            '  Status: Encrypting files...'
        ),
        @(
            '  FILE SYSTEM',
            '',
            '  [ family_photos ]       [ invoices ]          [ contracts ]',
            '  photo_01.jpg.locked     invoice.xlsx.locked   agreement.pdf.locked',
            '  photo_02.jpg.locked     budget.xlsx.locked    customer_list.csv.locked',
            '',
            '  Status: Files encrypted'
        ),
        @(
            '                 _____________',
            '                /             \',
            '               /   RANSOM      \',
            '              |     LOCKED     |',
            '              |       ___      |',
            '              |      |###|     |',
            '              |      |###|     |',
            '              |______|###|_____|',
            '',
            '              YOUR FILES ARE LOCKED'
        )
    )

    foreach ($frame in $frames) {
        Clear-Host

        Write-Host ""
        Write-Host "RANSOMWARE ROOM" -ForegroundColor Cyan
        Write-Host ""

        foreach ($line in $frame) {
            Write-Host $line -ForegroundColor Red
        }

        Start-Sleep -Milliseconds 1500
    }

    Write-Host ""
    Write-Host " Ransomware infection detected..." -ForegroundColor Red
    Write-Host " Files have been encrypted." -ForegroundColor DarkYellow
    Write-Host " Entering final room..." -ForegroundColor Cyan
    Write-Host ""

    Start-Sleep -Milliseconds 1200
}

# Shows the outro animation for the Ransomware room.
# The animation shows recovery starting, files being restored, and the ransomware being contained.
function Show-RansomwareOutro {
    $frames = @(
        @(
            '                 _____________',
            '                /             \',
            '               /   RANSOM      \',
            '              |     LOCKED     |',
            '              |       ___      |',
            '              |      |###|     |',
            '              |      |###|     |',
            '              |______|###|_____|',
            '',
            '              RECOVERY STARTED'
        ),
        @(
            '                 _____________',
            '                /             \',
            '               /   RANSOM      \',
            '              |    RECOVERY    |',
            '              |       ___      |',
            '              |      |# #|     |',
            '              |      |# #|     |',
            '              |______|# #|_____|',
            '',
            '              RESTORING FILES...'
        ),
        @(
            '                 _____________',
            '                /             \',
            '               /   RANSOM      \',
            '              |    RECOVERY    |',
            '              |       ___      |',
            '              |      |   |     |',
            '              |      |   |     |',
            '              |______|___|_____|',
            '',
            '              LOCK REMOVED'
        ),
        @(
            '  FILE SYSTEM',
            '',
            '  [ family_photos ]       [ invoices ]          [ contracts ]',
            '  photo_01.jpg.locked     invoice.xlsx.locked   agreement.pdf.locked',
            '  photo_02.jpg.locked     budget.xlsx.locked    customer_list.csv.locked',
            '',
            '  Status: Decrypting files...'
        ),
        @(
            '  FILE SYSTEM',
            '',
            '  [ family_photos ]    [ invoices ]       [ contracts ]',
            '  photo_01.jpg         invoice.xlsx       agreement.pdf',
            '  photo_02.jpg         budget.xlsx        customer_list.csv',
            '',
            '  Status: Files restored'
        ),
        @(
            '                 _____________',
            '                /             \',
            '               /   SYSTEM      \',
            '              |      SAFE      |',
            '              |                |',
            '              |      OK        |',
            '              |                |',
            '              |________________|',
            '',
            '              RANSOMWARE CONTAINED'
        )
    )

    foreach ($frame in $frames) {
        Clear-Host

        Write-Host ""
        Write-Host "RANSOMWARE ROOM" -ForegroundColor Cyan
        Write-Host ""

        foreach ($line in $frame) {
            Write-Host $line -ForegroundColor Green
        }

        Start-Sleep -Milliseconds 1500
    }

    Write-Host ""
    Write-Host "RANSOMWARE ROOM CLEARED" -ForegroundColor Green
    Write-Host "The ransomware was contained and the files were restored." -ForegroundColor Green
    Write-Host ""

    Start-Sleep -Milliseconds 1200
}