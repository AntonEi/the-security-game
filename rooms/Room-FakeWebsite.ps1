# Starts the fake website room
Function Start-RoomFakeWebsite ($GameState) {

    # Displays text with typewriter effect
    Function Write-Slow ($Text, $Color = "White", $Delay = 40, $LinePause = 600) {
        if ($Global:SkipTyping) {
            Write-Host $Text -ForegroundColor $Color
            return
        }
        # Print the text one character at a time
        foreach ($Char in $Text.ToCharArray()) {
            Write-Host $Char -NoNewline -ForegroundColor $Color
            Start-Sleep -Milliseconds $Delay
        }

        # Pause before continuing and move to the next line
        Start-Sleep -Milliseconds $LinePause
        Write-Host ""
    }

    # Run four security checks until each one is answered correctly
    for ($i = 1; $i -le 4; $i++) {

        $Correct = $false
        $Global:SkipTyping = $false

        do {
            Clear-Host
            Write-Host "--- SECURITY CHECK $i OF 4 ---`n" -ForegroundColor Cyan

            # Security check 1: identify risks with an expired self-signed certificate
            if ($i -eq 1) {
                Write-Slow "Security Alert!" "White"
                Write-Slow "`nA portal requires your admin login, but your browser flags the connection." "White"
                Write-Slow "`nYou inspect the SSL/TLS certificate. It says:" "White"
                Write-Host ""
                Write-Host "   Issued to: internal.sediment.com" 
                Write-Host "   Issued by: Unknown CA / Self-Signed" 
                Write-Host "   Validity: EXPIRED 2025-12-31" 
                Write-Slow "`nWhat is the main danger here?" 
                Write-Host "`n1. None. Since it is issued to 'sediment.com' it is safe to proceed."
                Write-Host "2. The encryption is too strong for your current browser version."
                Write-Host "3. An expired, self-signed certificate means the connection is untrusted and could be intercepted."
                Write-Host "4. The website is just performing a scheduled database backup."

                $Val = Read-Host "`nEnter your choice (1-4) or HINT"

# Handle hint request, correct answer, and incorrect answers
if ($Val.Trim().ToUpper() -eq "HINT") {
    Write-Host "`n[HINT] Legitimate corporate sites use certificates from verified Authorities (CAs) and never let them expire." 
    Read-Host "`nPress Enter to try again"
    $Global:SkipTyping = $true
}
elseif ($Val.Trim() -eq "3") {
    Write-Host "`n✔ You are correct!" 
    $Correct = $true
    Read-Host "Press Enter to continue"
}

    # Give feedback based on the selected incorrect answer
    else {
        switch ($Val.Trim()) {
        "1" {
            Write-Host "`n❌ Incorrect. The certificate is self-signed and expired. A familiar company name alone does not prove a site is trustworthy." 
        }
        "2" {
            Write-Host "`n❌ Incorrect. Strong encryption is not the problem. The problem is that the certificate cannot be trusted." 
        }
        "4" {
            Write-Host "`n❌ Incorrect. Database backups have nothing to do with certificate validation or website trust." 
        }
        default {
            Write-Host "`n❌ Invalid choice." 
        }
    }

    # Redisplay the question without the typing effect
    Read-Host "Press Enter to try again"
    $Global:SkipTyping = $true
}
        }

            # Security check 2: identify a phishing URL disguised as a trusted company domain
            elseif ($i -eq 2) {

                Write-Slow "You are analyzing a link sent to the finance team." "White"
                Write-Host "`n👉 https://sediment.com.financial-portal.net/login 👈" 
                Write-Slow "`nIs this website legitimate for your company (sediment.com)?" "White"
                Write-Host "`n1. Yes, because 'sediment.com' is written at the beginning."
                Write-Host "2. It is a secure connection so it must be safe."
                Write-Host "3. No, the actual main domain is 'financial-portal.net'."
                Write-Host "4. No, the link is too short to be dangerous."

                $Val = Read-Host "`nEnter your choice (1-4) or HINT"

                # Handle hint request, correct answer, and incorrect answers
                if ($Val.Trim().ToUpper() -eq "HINT") {
                    Write-Host "`n[HINT] In a URL, the true domain is the part just before the .com/.net. Everything before that is just a subdomain." 
                    Read-Host "`nPress Enter to try again"
                    $Global:SkipTyping = $true
                }
                elseif ($Val.Trim() -eq "3") {
                    Write-Host "`n✔ You are correct!" 
                    $Correct = $true
                    Read-Host "Press Enter to continue"
                }

                # Give feedback based on the selected incorrect answer
                else {
    switch ($Val.Trim()) {
        "1" {
            Write-Host "`n❌ Incorrect. Attackers often place trusted company names in subdomains. The real domain here is financial-portal.net." 
        }
        "2" {
            Write-Host "`n❌ Incorrect. A secure connection does not automatically mean the website belongs to the organization you trust." 
        }
        "4" {
            Write-Host "`n❌ Incorrect. The length of a URL does not determine whether it is malicious. The domain ownership is what matters." 
        }
        default {
            Write-Host "`n❌ Invalid choice." 
        }
    }

    # Redisplay the question without the typing effect
    Read-Host "Press Enter to try again"
    $Global:SkipTyping = $true
}

}

            # Security check 3: identify a suspicious document requesting macros or scripts
            elseif ($i -eq 3) {

                Write-Slow "A PDF invoice named 'Invoice_2026_Final.pdf' downloads from a portal." "White"
                Write-Slow "`nWhen you open it, a popup says: 'To view this document, please enable Macros/Scripts'." "White"
                Write-Slow "`nWhat should your security instinct tell you about this document?" "White"
                Write-Host "`n1. Enable them; it's a common requirement for office documents."
                Write-Host "2. Enable them only if the sender is verified by email."
                Write-Host "3. Decline; standard PDF files do not require active macros."
                Write-Host "4. Disable your antivirus temporarily to view the content."

                $Val = Read-Host "`nEnter your choice (1-4) or HINT"

                # Handle hint request, correct answer, and incorrect answers
                if ($Val.Trim().ToUpper() -eq "HINT") {
                    Write-Host "`n[HINT] Macros are automated scripts. A simple document shouldn't need them to display text."
                    Read-Host "`nPress Enter to try again"
                    $Global:SkipTyping = $true
                }
                elseif ($Val.Trim() -eq "3") {
                    Write-Host "`n✔ You are correct!" 
                    $Correct = $true
                    Read-Host "Press Enter to continue"
                }
                
                # Give feedback based on the selected incorrect answer
                else {
    switch ($Val.Trim()) {
        "1" {
            Write-Host "`n❌ Incorrect. Enabling macros or scripts can allow malicious code to run on your computer." 
        }

        "2" {
            Write-Host "`n❌ Incorrect. Even if the sender appears legitimate, a normal PDF should not require macros or scripts to display its contents." 
        }

        "4" {
            Write-Host "`n❌ Incorrect. Disabling antivirus removes an important layer of protection and can make malware infections more likely." 
        }

        default {
            Write-Host "`n❌ Invalid choice." 
        }
    }

    # Redisplay the question without the typing effect
    Read-Host "Press Enter to try again"
    $Global:SkipTyping = $true
}

}

# Security check 4: identify the risk of using HTTP on a login page
elseif ($i -eq 4) {

                Write-Slow "You land on an internal login page. The address bar displays:" "White"
                Write-Host "`n👉 http://secure-login.sediment.com 👈" 
                Write-Slow "`nWhat is the primary security concern here?" "White"
                Write-Host "`n1. The site name is too long."
                Write-Host "2. HTTP is unencrypted, exposing your credentials."
                Write-Host "3. It uses a secure protocol but the port is blocked."
                Write-Host "4. Nothing; it is an internal page so it does not need encryption."

                $Val = Read-Host "`nEnter your choice (1-4) or HINT"

                # Handle hint requests, correct answers, and incorrect answers
                if ($Val.Trim().ToUpper() -eq "HINT") {
                    Write-Host "`n[HINT] HTTPS encrypts your data. The S means secure. Without HTTPS, passwords can be read by others on the network." 
                    Read-Host "`nPress Enter to try again"
                    $Global:SkipTyping = $true
                }
                elseif ($Val.Trim() -eq "2") {
                    Write-Host "`n✔ You are correct!" 
                    $Correct = $true
                    Read-Host "Press Enter to continue"
                }

            # Give feedback based on the selected incorrect answer
            else {
    switch ($Val.Trim()) {
        "1" {
            Write-Host "`n❌ Incorrect. The length of a website address does not determine whether it is secure." 
        }

        "3" {
            Write-Host "`n❌ Incorrect. The main issue is not the port or protocol configuration. The problem is that HTTP does not encrypt data." 
        }

        "4" {
            Write-Host "`n❌ Incorrect. Internal websites should still use HTTPS. Usernames and passwords can otherwise be intercepted on the network." 
        }

        default {
            Write-Host "`n❌ Invalid choice." 
        }
    }

    # Redisplay the question without the typing effect
    Read-Host "Press Enter to try again"
    $Global:SkipTyping = $true
}
    }

        # Repeat the current security check until the player answers correctly
        } until ($Correct -eq $true)
    }

    # Display the completion message after all security checks are cleared
    Clear-Host
    Write-Host "==========================================================================" -ForegroundColor Cyan
    Write-Host " STAGE CLEARED: Well done! All 4 security checks bypassed successfully!" 
    Write-Host "==========================================================================" -ForegroundColor Cyan

    Read-Host "`nYou can now proceed to the next room. Press Enter to continue"

    return $true
}