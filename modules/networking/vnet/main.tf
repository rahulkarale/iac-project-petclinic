resource "azurerm_virtual_network" "vnet" {
  address_space       = var.cidr_block
  location            = var.location
  name                = var.vnet_name
  resource_group_name = var.resource_group_name

  dynamic "subnet" {
    for_each = length(var.subnets) == 0 ? [] : [
      for snet in var.subnets : { name : snet.name, address_prefix : snet.address_prefix }
    ]
    content {
      name           = subnet.value.name
      address_prefix = subnet.value.address_prefix
    }
  }

  lifecycle {
    ignore_changes = [subnet]
  }
  tags = var.tags
}