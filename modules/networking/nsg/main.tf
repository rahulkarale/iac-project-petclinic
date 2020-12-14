resource "azurerm_network_security_group" "nsg" {
  name                = var.nsg_name
  resource_group_name = var.resource_group_name
  location            = var.location

  dynamic "security_rule" {
    for_each = length(var.security_rules) == 0 ? [] : [
      for srule in var.security_rules : {
        name : srule.name,
        priority : srule.priority,
        access : srule.access,
        direction : srule.direction,
        protocol                   = srule.protocol,
        source_port_range          = srule.source_port_range,
        destination_port_range     = srule.destination_port_range,
        source_address_prefix      = srule.source_address_prefix,
        destination_address_prefix = srule.destination_address_prefix,
        description                = srule.description
      }
    ]
    content {
      name                       = security_rule.value.name
      priority                   = security_rule.value.priority
      access                     = security_rule.value.access
      direction                  = security_rule.value.direction
      protocol                   = security_rule.value.protocol
      source_port_range          = security_rule.value.source_port_range
      destination_port_range     = security_rule.value.destination_port_range
      source_address_prefix      = security_rule.value.source_address_prefix
      destination_address_prefix = security_rule.value.destination_address_prefix
      description                = security_rule.value.description
    }
  }

  tags = var.tags
}