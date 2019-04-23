if (!(test-path "c:\Patching")) { mkdir c:\patching -force} ;
$host.UI.RawUI.BufferSize = new-object System.Management.Automation.Host.Size(89260,89150);
$script = 'get-itemproperty "HKCU:\software\Microsoft\Windows\CurrentVersion\Internet Settings\" -ea silentlycontinue | remove-item -confirm:0 -force -recurse;
$waar = 1 -eq 1;
$Session = New-Object -com "Microsoft.Update.Session";
$Search = $Session.CreateUpdateSearcher() ;
$SearchResults = $Search.Search("IsInstalled=0 and IsHidden=0");
if (!$error){; $output = $SearchResults.Updates.Count;	
$output2 = $SearchResults.Updates | select Title;	$output2 | out-file c:\Patching\updatelist.txt;}
else{;	$output = "error";};
$output | out-file c:\Patching\updates.txt;
$DownloadCollection = New-Object -com "Microsoft.Update.UpdateColl";
$SearchResults.Updates | ForEach-Object { ; if ($_.InstallationBehavior.CanRequestUserInput -ne $waar) { ; $DownloadCollection.Add($_) | Out-Null ; } ; } ; 
if ($($SearchResults.Updates.Count -gt 0)) 
{;	$Downloader = $Session.CreateUpdateDownloader();	$Downloader.Updates = $DownloadCollection ;	$Downloader.Download();};';
$script | out-file "C:\Patching\UpdateSearch.ps1" -force;