# https://blogs.technet.microsoft.com/heyscriptingguy/2011/07/23/use-powershell-to-modify-your-environmental-path/


$cp = (Get-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name PATH).path
$cp


IF (!$AddedFolder)
{ Return ‘No Folder Supplied. $ENV:PATH Unchanged’}

# See if the new folder exists on the file system.

IF (!(TEST-PATH $AddedFolder))
{ Return ‘Folder Does not Exist, Cannot be added to $ENV:PATH’ }

# See if the new Folder is already in the path.

IF ($ENV:PATH | Select-String -SimpleMatch $AddedFolder)
{ Return ‘Folder already within $ENV:PATH' }

# Set the New Path

$NewPath=$OldPath+’;’+$AddedFolder

Set-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINESystemCurrentControlSetControlSession ManagerEnvironment' -Name PATH –Value $newPath

# Show our results back to the world

Return $NewPath
}