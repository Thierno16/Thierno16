<#
.SYNOPSIS
    Remediates STIG requirement WN11-AU-000500 (Application event log size must be 32768 KB or greater).

.DESCRIPTION
    This script configures the registry value to ensure the Application 
    event log maximum size is set to 32768 KB (or greater), 
    per DISA Windows 11 STIG guidance.

.LINKED PROFILES
    LinkedIn  : https://linkedin.com/in/thierno-bah-95931259/
    GitHub    : https://github.com/Thierno16/

.NOTES
    Author          : Thierno Bah
    Date Created    : 2025-08-31
    Last Modified   : 2025-08-31
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AU-000500

.TESTED ON
    Date(s) Tested  : 2025-08-31
    Tested By       : Thierno Bah
    Systems Tested  : Windows 11 Pro, Windows 11 Enterprise
    PowerShell Ver. : 5.1, 7.x
#>

Windows PowerShell
Copyright (C) Microsoft Corporation. All rights reserved.

Install the latest PowerShell for new features and improvements! https://aka.ms/PSWindows

PS C:\Windows\system32> <#
>> .SYNOPSIS
>>   Remediates STIG ID: WN11-AU-000500 (Application event log size)
>>
>> .DESCRIPTION
>>   Ensures the Application event log size is set to at least 32768 KB
>>   by updating the registry value:
>>   HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application\MaxSize
>> #>
PS C:\Windows\system32>
PS C:\Windows\system32> # Define registry path and required size (in KB)
PS C:\Windows\system32> $RegPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application"
PS C:\Windows\system32> $ValueName = "MaxSize"
PS C:\Windows\system32> $RequiredSize = 32768
PS C:\Windows\system32>
PS C:\Windows\system32> # Ensure registry path exists
PS C:\Windows\system32> if (-not (Test-Path $RegPath)) {
>>     New-Item -Path $RegPath -Force | Out-Null
>> }
PS C:\Windows\system32>
PS C:\Windows\system32> # Get current value (if exists)
PS C:\Windows\system32> $CurrentValue = (Get-ItemProperty -Path $RegPath -Name $ValueName -ErrorAction SilentlyContinue).$ValueName
PS C:\Windows\system32>
PS C:\Windows\system32> if ($null -eq $CurrentValue -or $CurrentValue -lt $RequiredSize) {
>>     Write-Output "Updating Application log size to $RequiredSize KB..."
>>     New-ItemProperty -Path $RegPath -Name $ValueName -Value $RequiredSize -PropertyType DWord -Force | Out-Null
>> } else {
>>     Write-Output "Application log size already set to $CurrentValue KB (compliant)."
>> }
Updating Application log size to 32768 KB...
PS C:\Windows\system32>
PS C:\Windows\system32> # Optional: Verify setting
PS C:\Windows\system32> $Verify = (Get-ItemProperty -Path $RegPath -Name $ValueName).$ValueName
PS C:\Windows\system32> Write-Output "Application Log MaxSize is now set to $Verify KB."
Application Log MaxSize is now set to 32768 KB.
