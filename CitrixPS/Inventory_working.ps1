# Gets the application group names whoever have access to published apps
# Collect other XenApp 6.x Published Application properties
# Requires the Citrix XenApp PowerShell SDK 


add-pssnapin citrix*

$myDocumentsFolder = [Environment]::GetFolderPath("MyDocuments")

$csvfilename = "\CitrixApps.csv"
$csvfile = $myDocumentsFolder+$csvfilename
Get-XAApplicationReport * | select ApplicationType, DisplayName, FolderPath, Enabled, HideWhenDisabled, ContentAddress, CommandLineExecutable, WorkingDirectory, AnonymousConnectionsAllowed, AddToClientStartMenu, ClientFolder, StartMenuFolder, AddToClientDesktop,  ConnectionsThroughAccessGatewayAllowed, OtherConnectionsAllowed, AccessSessionConditionsEnabled, @{n="AccessSessionConditions";e={[string]::join(" ; ", $_.AccessSessionConditions)}}, InstanceLimit, MultipleInstancesPerUserAllowed, CpuPriorityLevel, AudioType, AudioRequired, SslConnectionEnabled, EncryptionLevel, EncryptionRequired, WaitOnPrinterCreation, WindowType, ColorDepth, TitleBarHidden, MaximizedOnStartup, OfflineAccessAllowed, CachingOption, AlternateProfiles, RunAsLeastPrivilegedUser, @{n="Servers";e={[string]::join(" ; ", $_.ServerNames)}}, @{n="WorkerGroups";e={[string]::join(" ; ", $_.WorkerGroupNames)}}, @{n="Users";e={[string]::join(" ; ", $_.Accounts)}} | Export-Csv -NoTypeInformation $csvFile
$processes = Import-Csv -Path $csvFile 
$Excel = New-Object -ComObject excel.application 
$Excel.visible = $false 
$workbook = $Excel.workbooks.add()
$Worksheet = $workbook.Worksheets.Item(1)
 $excel.cells.item(1,1) = "ApplicationType"
 $excel.cells.item(1,2) = "DisplayName"
 $excel.cells.item(1,3) = "FolderPath"
 $excel.cells.item(1,4) = "Enabled"
 $excel.cells.item(1,5) = "HideWhenDisabled"
 $excel.cells.item(1,6) = "ContentAddress"
 $excel.cells.item(1,7) = "CommandLineExecutable"
 $excel.cells.item(1,8) = "WorkingDirectory"
 $excel.cells.item(1,9) = "AnonymousConnectionsAllowed"
 $excel.cells.item(1,10) = "AddToClientStartMenu"
 $excel.cells.item(1,11) = "ClientFolder"
 $excel.cells.item(1,12) = "StartMenuFolder"
 $excel.cells.item(1,13) = "AddToClientDesktop"
 $excel.cells.item(1,14) = "ConnectionsThroughAccessGatewayAllowed"
 $excel.cells.item(1,15) = "OtherConnectionsAllowed"
 $excel.cells.item(1,16) = "AccessSessionConditionsEnabled"
 $excel.cells.item(1,17) = "AccessSessionConditions"
 $excel.cells.item(1,18) = "InstanceLimit"
 $excel.cells.item(1,19) = "MultipleInstancesPerUserAllowed"
 $excel.cells.item(1,20) = "CpuPriorityLevel"
 $excel.cells.item(1,21) = "AudioType"
 $excel.cells.item(1,22) = "AudioRequired"
 $excel.cells.item(1,23) = "SslConnectionEnabled"
 $excel.cells.item(1,24) = "EncryptionLevel"
 $excel.cells.item(1,25) = "EncryptionRequired"
 $excel.cells.item(1,26) = "WaitOnPrinterCreation"
 $excel.cells.item(1,27) = "WindowType"
 $excel.cells.item(1,28) = "ColorDepth"
 $excel.cells.item(1,29) = "TitleBarHidden"
 $excel.cells.item(1,30) = "MaximizedOnStartup"
 $excel.cells.item(1,31) = "OfflineAccessAllowed"
 $excel.cells.item(1,32) = "CachingOption"
 $excel.cells.item(1,33) = "AlternateProfiles"
 $excel.cells.item(1,34) = "RunAsLeastPrivilegedUser"
 $excel.cells.item(1,35) = "Servers"
 $excel.cells.item(1,36) = "WorkerGroups"
 $excel.cells.item(1,37) = "Users"
 $excel.Cells.Item(1, 1).EntireRow.Interior.ColorIndex = 30
 $excel.Cells.Item(1, 1).EntireRow.Font.Bold = $True
 $excel.Cells.Item(1, 1).EntireRow.Font.ColorIndex = 2
$i = 2 
foreach($process in $processes) 
{ 
 $excel.cells.item($i,1) = $process.ApplicationType 
 $excel.cells.item($i,2) = $process.DisplayName 
 $excel.cells.item($i,3) = $process.FolderPath 
 $excel.cells.item($i,4) = $process.Enabled 
 $excel.cells.item($i,5) = $process.HideWhenDisabled 
 $excel.cells.item($i,6) = $process.ContentAddress
 $excel.cells.item($i,7) = $process.CommandLineExecutable
 $excel.cells.item($i,8) = $process.WorkingDirectory
 $excel.cells.item($i,9) = $process.AnonymousConnectionsAllowed
 $excel.cells.item($i,10) = $process.AddToClientStartMenu
 $excel.cells.item($i,11) = $process.ClientFolder
 $excel.cells.item($i,12) = $process.StartMenuFolder
 $excel.cells.item($i,13) = $process.AddToClientDesktop
 $excel.cells.item($i,14) = $process.ConnectionsThroughAccessGatewayAllowed
 $excel.cells.item($i,15) = $process.OtherConnectionsAllowed
 $excel.cells.item($i,16) = $process.AccessSessionConditionsEnabled
 $excel.cells.item($i,17) = $process.AccessSessionConditions
 $excel.cells.item($i,18) = $process.InstanceLimit
 $excel.cells.item($i,19) = $process.MultipleInstancesPerUserAllowed
 $excel.cells.item($i,20) = $process.CpuPriorityLevel
 $excel.cells.item($i,21) = $process.AudioType
 $excel.cells.item($i,22) = $process.AudioRequired
 $excel.cells.item($i,23) = $process.SslConnectionEnabled
 $excel.cells.item($i,24) = $process.EncryptionLevel
 $excel.cells.item($i,25) = $process.EncryptionRequired
 $excel.cells.item($i,26) = $process.WaitOnPrinterCreation
 $excel.cells.item($i,27) = $process.WindowType
 $excel.cells.item($i,28) = $process.ColorDepth
 $excel.cells.item($i,29) = $process.TitleBarHidden
 $excel.cells.item($i,30) = $process.MaximizedOnStartup
 $excel.cells.item($i,31) = $process.OfflineAccessAllowed
 $excel.cells.item($i,32) = $process.CachingOption
 $excel.cells.item($i,33) = $process.AlternateProfiles
 $excel.cells.item($i,34) = $process.RunAsLeastPrivilegedUser
 $excel.cells.item($i,35) = $process.Servers
 $excel.cells.item($i,36) = $process.WorkerGroups
 $excel.cells.item($i,37) = $process.Users
  $i++ 
} #end foreach process 

 $Range = $Worksheet.UsedRange 
[void] $Range.EntireColumn.Autofit()

$excel.application.activewindow.splitcolumn = 0
$excel.application.activewindow.splitrow = 1
$excel.application.activewindow.freezepanes = $true

$currdate = Get-Date

$xlfilename = "\CitrixApps"+"-"+$currdate.month+"-"+$currdate.day+"-"+$currdate.year+".xlsx"
$xlfile = $myDocumentsFolder+$xlfilename

$workbook.saveas($xlfile) 
$Excel.Quit() 
Remove-Variable -Name excel 
[gc]::collect() 
[gc]::WaitForPendingFinalizers() 