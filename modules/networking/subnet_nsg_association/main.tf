resource "azurerm_subnet_network_security_group_association" "association" {
  network_security_group_id = var.network_security_group_id
  subnet_id = var.subnet_id
  lifecycle {
    ignore_changes = [subnet_id]
  }
}