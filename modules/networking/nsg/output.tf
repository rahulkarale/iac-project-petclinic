#The ID of the Network Security Group.
output "nsg_id" {
  value = azurerm_network_security_group.nsg.id
}