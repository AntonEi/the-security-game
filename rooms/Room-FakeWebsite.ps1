# Starts the fake website room
# Returns true when room is cleared
Function Start-RoomFakeWebsite {
    param (
        [Parameter(Mandatory = $true)]
        [object]$GameState
    )

    # Run four security checks until each one is answered correctly
    for ($i = 1; $i -le 4; $i++) {

        $Correct = $false
        
        do {
            switch ($i) {
                "1" {
                    # Security check 1: identify risks with an expired self-signed certificate
                    $Correct = Start-SecurityCheck1 $GameState
                }
                "2" {
                    # Security check 2: identify a phishing URL disguised as a trusted company domain
                    $Correct = Start-SecurityCheck2 $GameState
                }
                "3" {
                    # Security check 3: identify a suspicious document requesting macros or scripts
                    $Correct = Start-SecurityCheck3 $GameState
                } 
                "4" {
                    # Security check 4: identify the risk of using HTTP on a login page
                    $Correct = Start-SecurityCheck4 $GameState
                }
            }
            
        # Repeat the current security check until the player answers correctly
        } until ($Correct -eq $true)
    }

    # Display the completion message after all security checks are cleared
    Clear-Host
    Write-Host "=========================================================================="
    Write-Host " STAGE CLEARED: Well done! All 4 security checks bypassed successfully!" 
    Write-Host "=========================================================================="

    Read-Host "You can now proceed to the next room. Press Enter to continue"

    return $true
}

# Does the first security check
# Returns true when completed
Function Start-SecurityCheck1 {
    param (
        [Parameter(Mandatory = $true)]
        [object]$GameState
    )

    while ($true) {
        Show-TerminalBox -Label "SECURITY CHECK 1 OF 4" -Lines @(
            "Security Alert!"
            ""
            "A portal requires your admin login, but your browser flags the connection."
            ""
            "You inspect the SSL/TLS certificate. It says:"
            ""
            "   Issued to: internal.sediment.com" 
            "   Issued by: Unknown CA / Self-Signed" 
            "   Validity: EXPIRED 2025-12-31" 
            ""
            "What is the main danger here?" 

        ) -Clear

        Write-Host "1. None. Since it is issued to 'sediment.com' it is safe to proceed."
        Write-Host "2. The encryption is too strong for your current browser version."
        Write-Host "3. An expired, self-signed certificate means the connection is untrusted and could be intercepted."
        Write-Host "4. The website is just performing a scheduled database backup."
        Write-Host ""

        $Choice = Read-Host "Enter your choice (1-4) or HINT"

        switch ($Choice) {
            "1" {
                Remove-Score $GameState
                Add-Mistake $GameState
                Write-Host "Incorrect. The certificate is self-signed and expired. A familiar company name alone does not prove a site is trustworthy." 
            }
            "2" {
                Remove-Score $GameState
                Add-Mistake $GameState
                Write-Host "Incorrect. Strong encryption is not the problem. The problem is that the certificate cannot be trusted." 
            }
            "3" {
                Add-Score $GameState
                Write-Host "You are correct!" 
                Read-Host "Press Enter to continue"
                return $true
            }
            "4" {
                Remove-Score $GameState
                Add-Mistake $GameState
                Write-Host "Incorrect. Database backups have nothing to do with certificate validation or website trust." 
            }
            "HINT" {
                Use-Hint $GameState
                Write-Host "[HINT] Legitimate corporate sites use certificates from verified Authorities (CAs) and never let them expire." 
                Read-Host "Press Enter to try again"
            }
            default {
                Write-Host "Invalid choice." 
            }
        }
        
        Read-Host "Press Enter to try again"
        continue
    }
}

# Does the second security check
# Returns true when completed
Function Start-SecurityCheck2 {
    param (
        [Parameter(Mandatory = $true)]
        [object]$GameState
    )

    while ($true) {

        Show-TerminalBox -Label "SECURITY CHECK 2 OF 4" -Lines @(
            "You are analyzing a link sent to the finance team."
            ""
            "https://sediment.com.financial-portal.net/login" 
            ""
            "Is this website legitimate for your company (sediment.com)?"

        ) -Clear   

        Write-Host "1. Yes, because 'sediment.com' is written at the beginning."
        Write-Host "2. It is a secure connection so it must be safe."
        Write-Host "3. No, the actual main domain is 'financial-portal.net'."
        Write-Host "4. No, the link is too short to be dangerous."
        Write-Host ""

        $Choice = Read-Host "Enter your choice (1-4) or HINT"

        Switch ($Choice) {
            "1" {
                Remove-Score $GameState
                Add-Mistake $GameState
                Write-Host "Incorrect. Attackers often place trusted company names in subdomains. The real domain here is financial-portal.net." 
            }
            "2" {
                Remove-Score $GameState
                Add-Mistake $GameState
                Write-Host "Incorrect. A secure connection does not automatically mean the website belongs to the organization you trust." 
            }
            "3" {
                Add-Score $GameState
                Write-Host "You are correct!" 
                Read-Host "Press Enter to continue"
                return $true
            } 
            "4" {
                Remove-Score $GameState
                Add-Mistake $GameState
                Write-Host "Incorrect. The length of a URL does not determine whether it is malicious. The domain ownership is what matters." 
            }
            "HINT" {
                Use-Hint $GameState
                Write-Host "[HINT] In a URL, the true domain is the part just before the .com/.net. Everything before that is just a subdomain." 
                Read-Host "Press Enter to try again"
            }
            default {
                Write-Host "Invalid choice." 
            }
        }

        Read-Host "Press Enter to try again"
    }
}

# Does the third security check
# Returns true when completed
Function Start-SecurityCheck3 {
    param (
        [Parameter(Mandatory = $true)]
        [object]$GameState
    )

    while ($true) {
        Show-TerminalBox -Label "SECURITY CHECK 3 OF 4" -Lines @(
            "A PDF invoice named 'Invoice_2026_Final.pdf' downloads from a portal."
            ""
            "When you open it, a popup says: 'To view this document, please enable Macros/Scripts'."
            ""
            "What should your security instinct tell you about this document?"

        ) -Clear

        Write-Host "1. Enable them; it's a common requirement for office documents."
        Write-Host "2. Enable them only if the sender is verified by email."
        Write-Host "3. Decline; standard PDF files do not require active macros."
        Write-Host "4. Disable your antivirus temporarily to view the content."
        Write-Host ""

        $Val = Read-Host "Enter your choice (1-4) or HINT"

        # Handle hint request, correct answer, and incorrect answers
        if ($Val.Trim().ToUpper() -eq "HINT") {
            Use-Hint $GameState
            Write-Host "[HINT] Macros are automated scripts. A simple document shouldn't need them to display text."
            Read-Host "Press Enter to try again"
        }
        elseif ($Val.Trim() -eq "3") {
            Add-Score $GameState
            Write-Host "You are correct!" 
            Read-Host "Press Enter to continue"
            return $true
        }
                    
        # Give feedback based on the selected incorrect answer
        else {
            switch ($Val.Trim()) {
                "1" {
                    Remove-Score $GameState
                    Add-Mistake $GameState
                    Write-Host "Incorrect. Enabling macros or scripts can allow malicious code to run on your computer." 
                }

                "2" {
                    Remove-Score $GameState
                    Add-Mistake $GameState
                    Write-Host "Incorrect. Even if the sender appears legitimate, a normal PDF should not require macros or scripts to display its contents." 
                }

                "4" {
                    Remove-Score $GameState
                    Add-Mistake $GameState
                    Write-Host "Incorrect. Disabling antivirus removes an important layer of protection and can make malware infections more likely." 
                }

                default {
                    Write-Host "Invalid choice." 
                }
            }

            Read-Host "Press Enter to try again"
        }
    }
}

Function Start-SecurityCheck4 {
    param (
        [Parameter(Mandatory = $true)]
        [object]$GameState
    )

    while ($true) {
        Show-TerminalBox -Label "SECURITY CHECK 4 OF 4" -Lines @(
            "You land on an internal login page. The address bar displays:"
            ""
            "http://secure-login.sediment.com" 
            ""
            "What is the primary security concern here?"

        ) -Clear

        Write-Host "1. The site name is too long."
        Write-Host "2. HTTP is unencrypted, exposing your credentials."
        Write-Host "3. It uses a secure protocol but the port is blocked."
        Write-Host "4. Nothing; it is an internal page so it does not need encryption."
        Write-Host ""

        $Val = Read-Host "Enter your choice (1-4) or HINT"

        # Handle hint requests, correct answers, and incorrect answers
        if ($Val.Trim().ToUpper() -eq "HINT") {
            Use-Hint $GameState
            Write-Host "[HINT] HTTPS encrypts your data. The S means secure. Without HTTPS, passwords can be read by others on the network." 
            Read-Host "Press Enter to try again"
        }
        elseif ($Val.Trim() -eq "2") {
            Add-Score $GameState
            Write-Host "You are correct!" 
            Read-Host "Press Enter to continue"
            return $true
        }

        # Give feedback based on the selected incorrect answer
        else {
            switch ($Val.Trim()) {
                "1" {
                    Remove-Score $GameState
                    Add-Mistake $GameState
                    Write-Host "Incorrect. The length of a website address does not determine whether it is secure." 
                }

                "3" {
                    Remove-Score $GameState
                    Add-Mistake $GameState
                    Write-Host "Incorrect. The main issue is not the port or protocol configuration. The problem is that HTTP does not encrypt data." 
                }

                "4" {
                    Remove-Score $GameState
                    Add-Mistake $GameState
                    Write-Host "Incorrect. Internal websites should still use HTTPS. Usernames and passwords can otherwise be intercepted on the network." 
                }

                default {
                    Write-Host "Invalid choice." 
                }
            }

            Read-Host "Press Enter to try again"   
        }
    }
}