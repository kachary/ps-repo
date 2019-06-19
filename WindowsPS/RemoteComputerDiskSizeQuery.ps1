<# Using WMIquery#>

Get-WmiObject Win32_LogicalDisk -ComputerName Localhost -Filter "DeviceID='C:'" | select Name,FileSystem,Freespace,Size | 
Format-Table Name, 
             @{Name='FileSystem';Expression={$_.FileSystem}},
             @{Name='FreeSpace';Expression={'{0:N2}' -f ($_.FreeSpace/1GB)}},
             @{Name='TotalSize';Expression={'{0:N2}' -f ($_.Size/1GB)}}
