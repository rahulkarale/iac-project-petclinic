#The ID of the Kubernetes Cluster Node Pool.
output "kubernetes_cluster_np_id" {
  value = azurerm_kubernetes_cluster_node_pool.aks_node_pool.id
}