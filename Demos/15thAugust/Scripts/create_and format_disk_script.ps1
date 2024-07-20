$diskconfig= New-AzureRMDiskConfig -Location eastus -Createoption empty -DiskSizeGB 40 

$dd = New-azureRmDIsk -ResourceGroupName rg3 -Diskname disk2 $diskconfig

Disk is created bt not connected to any machine

Get machine for this disk

$vm = GetAzureRmVM -ResourceGroupName rg3 -Name vm3

Define commands

$vm = Add-AzureRmVMDataDisk -vm $vm -name disk2 -CreateOption attach -ManagedDiskId $dd.id -lun 1  

Creta some partiotions
get-disk  | where PartitionStyle -eq raw | InitializeDisk -PartitionStyle mbr=passThru | new-parttion -AssignDriveLetter -UseMaximumSize | format-volume -Filesystem NTFS -NewfileSystemLabel "disk1" -confirm:$false
	
