#The Name of the Resource Group.
output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}
#The ID of the Resource Group.
output "resource_group_id" {
  value = azurerm_resource_group.rg.id
}