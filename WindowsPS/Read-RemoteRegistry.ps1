$key="SOFTWARE\Microsoft\Virtual Machine\Guest\Parameters"
$valuename="HostName"
$type = [Microsoft.Win32.RegistryHive]::LocalMachine
$computers = Get-Content c:\servers.txt
foreach($computer in $computers)
{
    $reg = [Microsoft.Win32.RegistryKey]::OpenRemoteBaseKey($type,$computer)
    
    #write $reg
    $regkey = $reg.opensubkey($key)
    $v= $regkey.getvalue($valuename)
    Write-Host -nonewline $computer `t $v `n

    
}