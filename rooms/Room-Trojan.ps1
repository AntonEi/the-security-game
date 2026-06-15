# Starts the Trojan room.
# The player must answer all Trojan-related security checks correctly to clear the room.
function Start-RoomTrojan {
    param (
        [Parameter(Mandatory = $true)]
        [object]$GameState
    )

    Show-TrojanIntro

    # Stores all questions for the room in one array.
# Each question contains the text, answer options, correct answer, hint, and feedback.
    $questions = @(
        [PSCustomObject]@{
            Label           = "TROJAN CHECK 1 OF 3"
            Lines           = @(
                "You find a file on the company computer.",
                "",
                "Filename:",
                "Quarterly_Report.pdf.exe",
                "",
                "The icon looks like a normal PDF document.",
                "",
                "What is suspicious about this file?"
            )
            Options         = @(
                "1. Nothing. It is just a PDF file.",
                "2. The file name is too long.",
                "3. The file has .exe at the end and may be disguised as a document.",
                "4. The file should be opened to check the content."
            )
            CorrectAnswer   = "3"
            Hint            = "Look carefully at the last file extension, not only the icon."
            CorrectFeedback = "Correct. A file ending with .exe can run code, even if it looks like a PDF."
            WrongFeedback   = "Incorrect. Attackers often disguise executable files as documents."
        },

        [PSCustomObject]@{
            Label           = "TROJAN CHECK 2 OF 3"
            Lines           = @(
                "You try to open the file.",
                "",
                "Windows shows a warning:",
                "",
                "Publisher: Unknown",
                "App wants permission to make changes to this device.",
                "",
                "What should you do?"
            )
            Options         = @(
                "1. Click Yes because the file looks work-related.",
                "2. Click Yes only if you are in a hurry.",
                "3. Stop and verify the file before allowing it to run.",
                "4. Disable security warnings so it does not happen again."
            )
            CorrectAnswer   = "3"
            Hint            = "Unknown publisher plus admin permission is a major warning sign."
            CorrectFeedback = "Correct. You should not allow unknown files to run with elevated permissions."
            WrongFeedback   = "Incorrect. Giving unknown files admin access can allow malware to install."
        },

        [PSCustomObject]@{
            Label           = "TROJAN CHECK 3 OF 3"
            Lines           = @(
                "After investigating, you notice the file came from an unexpected email attachment.",
                "",
                "The sender address looks slightly wrong.",
                "The message uses urgent language.",
                "",
                "What is the safest next step?"
            )
            Options         = @(
                "1. Open the file on another computer.",
                "2. Forward the file to a colleague and ask them to test it.",
                "3. Rename the file so it becomes safe.",
                "4. Do not open it. Report it and delete or quarantine the file."
            )
            CorrectAnswer   = "4"
            Hint            = "If a file looks suspicious, do not test it by opening it."
            CorrectFeedback = "Correct. Suspicious files should be reported and quarantined, not opened."
            WrongFeedback   = "Incorrect. Suspicious files should not be opened, renamed, or shared."
        }
    )

    foreach ($question in $questions) {
        $answeredCorrectly = $false

        do {
            Show-TerminalBox `
                -Label $question.Label `
                -Lines $question.Lines `
                -BorderColor "Cyan" `
                -TextColor "White" `
                -Clear

            foreach ($option in $question.Options) {
                Write-Host $option
            }

            Write-Host ""
            $choice = Read-Host "Choose an option (1-4) or HINT"

            if ($choice.Trim().ToUpper() -eq "HINT") {
                Show-TerminalBox `
                    -Label "HINT" `
                    -Lines @($question.Hint) `
                    -BorderColor "Magenta" `
                    -TextColor "Magenta" `
                    -Clear

                Read-Host "Press Enter to try again"
            }
            elseif ($choice.Trim() -eq $question.CorrectAnswer) {
                $answeredCorrectly = $true

                Show-TerminalBox `
                    -Label "ACCESS GRANTED" `
                    -Lines @(
                    $question.CorrectFeedback
                ) `
                    -BorderColor "Green" `
                    -TextColor "Green" `
                    -Clear

                Read-Host "Press Enter to continue"
            }
            else {
                Show-TerminalBox `
                    -Label "ACCESS DENIED" `
                    -Lines @(
                    $question.WrongFeedback
                ) `
                    -BorderColor "Red" `
                    -TextColor "Red" `
                    -Clear

                Read-Host "Press Enter to try again"
            }

        } until ($answeredCorrectly -eq $true)
    }
    Show-TrojanOutro

    Read-Host "Press Enter to continue"

    return $true
}

