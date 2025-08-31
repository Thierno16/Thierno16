Windows PowerShell
Copyright (C) Microsoft Corporation. All rights reserved.

Install the latest PowerShell for new features and improvements! https://aka.ms/PSWindows

PS C:\Users\Thierno> <#
>> .SYNOPSIS
>>   Remediates STIG ID: WN11-AU-000560
>>   (Audit Other Logon/Logoff Events - Success)
>>
>> .LINKED PROFILES
    LinkedIn  : https://linkedin.com/in/thierno-bah-95931259/
    GitHub    : https://github.com/Thierno16/

.NOTES
    Author          : Thierno Bah
    Date Created    : 2025-08-31
    Last Modified   : 2025-08-31
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AU-000560

.TESTED ON
    Date(s) Tested  : 2025-08-31
    Tested By       : Thierno Bah
    Systems Tested  : Windows 11 Pro, Windows 11 Enterprise
    PowerShell Ver. : 5.1, 7.x
>> #>
PS C:\Users\Thierno>
PS C:\Users\Thierno> # Enable auditing of "Other Logon/Logoff Events" for Success
PS C:\Users\Thierno> Write-Output "Configuring Audit Policy: Other Logon/Logoff Events -> Success"
Configuring Audit Policy: Other Logon/Logoff Events -> Success
PS C:\Users\Thierno> auditpol /set /subcategory:"Other Logon/Logoff Events" /success:enable
The command was successfully executed.
PS C:\Users\Thierno>
PS C:\Users\Thierno> # Optional: If you also want Failure auditing (not required, but acceptable by STIG)
PS C:\Users\Thierno> # auditpol /set /subcategory:"Other Logon/Logoff Events" /success:enable /failure:enable
PS C:\Users\Thierno>
PS C:\Users\Thierno> # Verify setting
PS C:\Users\Thierno> Write-Output "Verifying applied settings..."
Verifying applied settings...
PS C:\Users\Thierno> auditpol /get /subcategory:"Other Logon/Logoff Events"
System audit policy
Category/Subcategory                      Setting
Logon/Logoff
  Other Logon/Logoff Events               Success
