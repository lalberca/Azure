#Se crea objeto de configuración
$customConfig = @{
  "fileUris" = (,"https://raw.githubusercontent.com/Azure-Samples/compute-automation-configurations/master/automate-iis.ps1");
  "commandToExecute" = "powershell -ExecutionPolicy Unrestricted -File automate-iis.ps1"
}

#Se obtiene información acerca del conjunto de escalado
$vmss = Get-AzVmss `
          -ResourceGroupName "PLATAFORMAresourcegroup" `
          -VMScaleSetName "WEBscaleset"

#Agregar Custom Script Extension
$vmss = Add-AzVmssExtension `
  -VirtualMachineScaleSet $vmss `
  -Name "customScript" `
  -Publisher "Microsoft.Compute" `
  -Type "CustomScriptExtension" `
  -TypeHandlerVersion 1.9 `
  -Setting $customConfig

#Se actualiza el conjunto de escalado y se aplica el Custom Script Extension las instancias de las VMs
Update-AzVmss `
  -ResourceGroupName "PLATAFORMAresourcegroup" `
  -Name "WEBscaleset" `
  -VirtualMachineScaleSet $vmss