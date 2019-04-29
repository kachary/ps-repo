https://gallery.technet.microsoft.com/scriptcenter/Export-all-AD-groups-and-3ae6fb42

$EnabledAppsList = get-xaapplication | ? {$_.Enabled -eq "True"}

$Array = @()
# $infoObject = New-Object PSObject 
# $infoObject | Add-member -MemberType NoteProperty -Name "ApplicationName" -value $NULL
# $infoObject | Add-member -MemberType NoteProperty -Name "Accounts" -value $NULL
foreach ($App in $EnabledAppsList)
{
$props = Get-XAApplicationReport -BrowserName $App # | select-object DisplayName,Accounts
$Object = New-Object PSCustomObject
        $Object | Add-Member -MemberType NoteProperty -Name "ApplicationName" -value $props.DisplayName
        $Object | Add-Member -MemberType NoteProperty -Name "Accounts" -value $props.Accounts
        # $Object | Add-Member -MemberType NoteProperty -Name "Memory %" -Value $RoundMemory
 
        $Object
        $Array += $Object



#Add-Member -inputObject $infoObject -memberType NoteProperty -name "ApplicationName" -value $props.DisplayName
# Add-Member -inputObject $infoObject -memberType NoteProperty -name "Accounts" -value $props.Accounts

}

$Array | Export-Csv yourfile.csv -notypeinformation




