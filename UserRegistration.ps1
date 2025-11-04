# User Registration Form Script
# This script provides an interactive form to register new users in Active Directory
# Author: IT Scripts Collection

Write-Host -ForegroundColor Red "---------------------------------------------"
Write-Host -ForegroundColor Green "       User Registration Form v1.0"
Write-Host -ForegroundColor Red "---------------------------------------------"
Write-Host ""
Write-Host -ForegroundColor Cyan "
  _   _                 ___           _     _           _   _             
 | | | |___ ___ _ _    | _ \___ __ _(_)___| |_ _ _ __ _| |_(_)___ _ _    
 | |_| (_-</ -_) '_|   |   / -_) _` | (_-<  _| '_/ _` |  _| / _ \ ' \   
  \___//__/\___|_|     |_|_\___\__, |_/__/\__|_| \__,_|\__|_\___/_||_|  
                                |___/                                     
"
Write-Host -ForegroundColor DarkCyan "                              by IT Admin Team"
Write-Host ""

# Function to validate email format
function Test-EmailFormat {
    param([string]$email)
    return $email -match "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"
}

# Function to validate username format (no special characters except underscore)
function Test-UsernameFormat {
    param([string]$username)
    return $username -match "^[a-zA-Z0-9_]{3,20}$"
}

# Main script loop
do {
    $continue = $true
    Clear-Host
    
    Write-Host -ForegroundColor Cyan "==========================================="
    Write-Host -ForegroundColor Yellow "       NEW USER REGISTRATION FORM"
    Write-Host -ForegroundColor Cyan "==========================================="
    Write-Host ""
    
    # Domain Authentication
    Write-Host -ForegroundColor Blue "Step 1: Admin Authentication"
    Write-Host -ForegroundColor DarkGray "Please provide admin credentials to create users"
    Write-Host ""
    
    $domain = Read-Host -Prompt "Domain (e.g., posprod)"
    $adminUser = Read-Host -Prompt "Admin Username"
    $adminPWord = Read-Host -Prompt "Admin Password" -AsSecureString
    $domainAdmin = $domain + "\" + $adminUser
    $adminCredential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $domainAdmin, $adminPWord
    
    Write-Host ""
    Write-Host -ForegroundColor Green "✓ Admin credentials captured"
    Write-Host ""
    Write-Host -ForegroundColor Blue "Step 2: New User Information"
    Write-Host ""
    
    # Collect new user information
    do {
        $newUsername = Read-Host -Prompt "New Username (3-20 characters, alphanumeric and underscore only)"
        if (-not (Test-UsernameFormat -username $newUsername)) {
            Write-Host -ForegroundColor Red "✗ Invalid username format. Please use 3-20 characters (letters, numbers, underscore only)"
        }
    } while (-not (Test-UsernameFormat -username $newUsername))
    
    $firstName = Read-Host -Prompt "First Name"
    $lastName = Read-Host -Prompt "Last Name"
    $displayName = "$firstName $lastName"
    
    do {
        $email = Read-Host -Prompt "Email Address"
        if (-not (Test-EmailFormat -email $email)) {
            Write-Host -ForegroundColor Red "✗ Invalid email format. Please enter a valid email address"
        }
    } while (-not (Test-EmailFormat -email $email))
    
    $department = Read-Host -Prompt "Department (e.g., IT, Sales, Support)"
    $jobTitle = Read-Host -Prompt "Job Title"
    
    Write-Host ""
    Write-Host -ForegroundColor Blue "Step 3: User Account Settings"
    Write-Host ""
    
    # Password setup
    do {
        $newUserPassword = Read-Host -Prompt "Initial Password" -AsSecureString
        $confirmPassword = Read-Host -Prompt "Confirm Password" -AsSecureString
        
        $pwd1_text = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($newUserPassword))
        $pwd2_text = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($confirmPassword))
        
        if ($pwd1_text -ne $pwd2_text) {
            Write-Host -ForegroundColor Red "✗ Passwords do not match. Please try again."
        } elseif ($pwd1_text.Length -lt 8) {
            Write-Host -ForegroundColor Red "✗ Password must be at least 8 characters long."
        }
    } while ($pwd1_text -ne $pwd2_text -or $pwd1_text.Length -lt 8)
    
    $changePasswordAtLogon = Read-Host -Prompt "Require password change at first logon? (Y/N)"
    $mustChangePassword = $changePasswordAtLogon -eq "Y" -or $changePasswordAtLogon -eq "y"
    
    # Display summary
    Write-Host ""
    Write-Host -ForegroundColor Cyan "==========================================="
    Write-Host -ForegroundColor Yellow "       REGISTRATION SUMMARY"
    Write-Host -ForegroundColor Cyan "==========================================="
    Write-Host ""
    Write-Host -ForegroundColor White "Username:     " -NoNewline
    Write-Host -ForegroundColor Green $newUsername
    Write-Host -ForegroundColor White "Full Name:    " -NoNewline
    Write-Host -ForegroundColor Green $displayName
    Write-Host -ForegroundColor White "Email:        " -NoNewline
    Write-Host -ForegroundColor Green $email
    Write-Host -ForegroundColor White "Department:   " -NoNewline
    Write-Host -ForegroundColor Green $department
    Write-Host -ForegroundColor White "Job Title:    " -NoNewline
    Write-Host -ForegroundColor Green $jobTitle
    Write-Host -ForegroundColor White "Change Pwd:   " -NoNewline
    Write-Host -ForegroundColor Green $(if ($mustChangePassword) { "Yes" } else { "No" })
    Write-Host ""
    
    $confirm = Read-Host -Prompt "Create this user account? (Y/N)"
    
    if ($confirm -eq "Y" -or $confirm -eq "y") {
        Write-Host ""
        Write-Host -ForegroundColor Yellow "Creating user account..."
        
        try {
            # Note: This is a simulation/template. In production, you would use New-ADUser cmdlet
            # Example command structure (commented out as it requires AD module and proper domain setup):
            <#
            Import-Module ActiveDirectory
            New-ADUser -Name $displayName `
                      -GivenName $firstName `
                      -Surname $lastName `
                      -SamAccountName $newUsername `
                      -UserPrincipalName "$newUsername@$domain.com" `
                      -EmailAddress $email `
                      -Department $department `
                      -Title $jobTitle `
                      -AccountPassword $newUserPassword `
                      -ChangePasswordAtLogon $mustChangePassword `
                      -Enabled $true `
                      -Credential $adminCredential
            #>
            
            # Simulation output
            Write-Host -ForegroundColor Green ""
            Write-Host -ForegroundColor Green "✓ User account created successfully!"
            Write-Host -ForegroundColor Green "✓ Username: $newUsername"
            Write-Host -ForegroundColor Green "✓ Email: $email"
            Write-Host -ForegroundColor Green "✓ Display Name: $displayName"
            Write-Host ""
            Write-Host -ForegroundColor Yellow "Note: This is a template script. To create actual AD users, uncomment"
            Write-Host -ForegroundColor Yellow "      the New-ADUser command section and ensure the ActiveDirectory"
            Write-Host -ForegroundColor Yellow "      PowerShell module is installed and you have proper permissions."
            Write-Host ""
            
            # Log the registration
            $logEntry = "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss') - User created: $newUsername ($displayName) - Email: $email - Department: $department"
            Add-Content -Path "$PSScriptRoot\UserRegistration.log" -Value $logEntry
            Write-Host -ForegroundColor Cyan "✓ Registration logged to UserRegistration.log"
            
        } catch {
            Write-Host -ForegroundColor Red ""
            Write-Host -ForegroundColor Red "✗ Error creating user account:"
            Write-Host -ForegroundColor Red $_.Exception.Message
            Write-Host ""
        }
    } else {
        Write-Host -ForegroundColor Yellow ""
        Write-Host -ForegroundColor Yellow "User registration cancelled."
        Write-Host ""
    }
    
    Write-Host ""
    $again = Read-Host -Prompt "Register another user? (Y/N)"
    
    if ($again -ne "Y" -and $again -ne "y") {
        $continue = $false
    }
    
} while ($continue)

Write-Host ""
Write-Host -ForegroundColor Cyan "Thank you for using User Registration Form!"
Write-Host -ForegroundColor Cyan "Goodbye!"
Write-Host ""
