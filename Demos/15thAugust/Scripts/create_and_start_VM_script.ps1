# create a resource group
New-AzResourceGroup -Name myResourceGroup1 -Location EastUS
# create the virtual machine
# when prompted, provide a username and password to be used as the logon credentials for the VM
New-AzVm `
-ResourceGroupName "myResourceGroup1" `
-Name "myVM" `
-Location "East US" `
-VirtualNetworkName "myVnet" `
-SubnetName "mySubnet" `
-SecurityGroupName "myNetworkSecurityGroup" `
-PublicIpAddressName "myPublicIpAddress" `
-OpenPorts 80,3389
 $var = Get-AzPublicIpAddress -ResourceGroupName "myResourceGroup1" 
 mstsc /v:$var