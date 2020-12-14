#The virtual NetworkConfiguration ID.
output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}

#One or more subnet (subnets[index].id)
output "subnets" {
  value = azurerm_virtual_network.vnet.subnet
}