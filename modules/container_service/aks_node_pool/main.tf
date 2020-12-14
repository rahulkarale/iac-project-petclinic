resource "azurerm_kubernetes_cluster_node_pool" "aks_node_pool" {
  name                  = var.aks_node_pool_name
  kubernetes_cluster_id = var.kubernetes_cluster_id
  vm_size               = var.vm_size
  availability_zones    = var.availability_zones
  enable_auto_scaling   = var.enable_auto_scaling
  vnet_subnet_id        = var.vnet_subnet_id
  orchestrator_version  = var.orchestrator_version
  max_count             = var.max_count
  min_count             = var.min_count
  node_count            = var.node_count
  tags                  = var.tags
}