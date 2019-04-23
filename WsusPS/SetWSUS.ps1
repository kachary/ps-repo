﻿set-executionpolicy unrestricted -confirm:0 -force;
if(!( Test-Path 'HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate' )){; New-Item 'HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate' -force;};
if(!( Test-Path 'HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate\AU' )){ ; New-Item 'HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate\AU' -force;};
New-ItemProperty 'HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate\AU' -name 'UseWUServer' -value '1' -propertyType "DWord" -force;
New-ItemProperty 'HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate\AU' -name 'IncludeRecommendedUpdates' -value '1' -propertyType "DWord" -force;
New-ItemProperty 'HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate\AU' -name 'AutoInstallMinorUpdates' -value '1' -propertyType "DWord" -force;
New-ItemProperty 'HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate\AU' -name 'NoAutoUpdate' -value '0' -propertyType "DWord" -force;
New-ItemProperty 'HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate\AU' -name 'AUOptions' -value '3' -propertyType "DWord" -force;
New-ItemProperty 'HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate' -name 'AcceptTrustedPublisherCerts' -value '1' -propertyType "DWord" -force;
New-ItemProperty 'HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate' -name 'TargetGroupEnabled' -value '1' -propertyType "DWord" -force;
New-ItemProperty 'HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate' -name 'TargetGroup' -value 'WIN10' -propertyType "String" -force;
New-ItemProperty 'HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate' -name 'WUServer' -value 'http://10.158.249.180' -propertyType "String" -force;
New-ItemProperty 'HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate' -name 'WUStatusServer' -value 'http://10.158.249.180' -propertyType "String" -force;
New-ItemProperty 'HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate' -name 'DisableWindowsUpdateAccess' -value '1' -propertyType "DWord" -force;