$osversion = gwmi -class Win32_OperatingSystem;
If ($osversion.Version -like "5.2*")
{; $Username = "Ipsdev\mauto" ; if($Username -match ".\\"){$username = $username.replace(".\","")}; 
$StartDate = New-Object -TypeName DateTime -ArgumentList:(2069,09,10); 
$FormatHack = ($([System.Globalization.DateTimeFormatInfo]::CurrentInfo.ShortDatePattern) -replace 'M+/', 'MM/') -replace 'd+/', 'dd/'; 
schtasks /create /tn "Update Search" /tr "$($Env:WinDir)\System32\WindowsPowerShell\v1.0\powershell.exe -f C:\Patching\UpdateSearch.ps1" /sc once /st 23:59:59 /RU "NT AUTHORITY\SYSTEM" /F;} 
else 
{; $Username = "Ipsdev\mauto" ; if($Username -match ".\\"){$username = $username.replace(".\","")}; 
$StartDate = New-Object -TypeName DateTime -ArgumentList:(2069,09,10); 
$FormatHack = ($([System.Globalization.DateTimeFormatInfo]::CurrentInfo.ShortDatePattern) -replace 'M+/', 'MM/') -replace 'd+/', 'dd/'; 
schtasks /create /tn "Update Search" /tr "$($Env:WinDir)\System32\WindowsPowerShell\v1.0\powershell.exe -f C:\Patching\UpdateSearch.ps1" /sc once /st 23:59:59 /RU "NT AUTHORITY\SYSTEM" /F /RL HIGHEST;};
schtasks /run /tn "Update Search";