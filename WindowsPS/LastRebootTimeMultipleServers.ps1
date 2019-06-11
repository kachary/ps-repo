function Get-Uptime ($target)
{

Get-WmiObject win32_operatingsystem -Computername $target -Credential $MyCred -Authentication Default | select csname, @{LABEL=’LastBootUpTime’;EXPRESSION={$_.ConverttoDateTime($_.lastbootuptime)}}

}

Get-Uptime localhost,server1,server2