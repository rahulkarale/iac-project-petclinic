# Terraform Module : Azure Kubernetes cluster node pool
![](https://upload.wikimedia.org/wikipedia/commons/thumb/0/04/Terraform_Logo.svg/1920px-Terraform_Logo.svg.png)

## How to use?
You can refer the below module into your terraform file with required parameters
```
module "aks_node_pool" {
  source                = "./modules/container_service/aks_node_pool"
  kubernetes_cluster_id = var.kubernetes_cluster_id
  aks_node_pool_name    = var.aks_node_pool_name
  vm_size               = var.vm_size
  availability_zones    = var.availability_zones
  enable_auto_scaling   = var.enable_auto_scaling
  max_count             = var.max_count
  min_count             = var.min_count
  node_count            = var.node_count
  orchestrator_version  = var.kubernetes_version
  vnet_subnet_id        = var.vnet_subnet_id
  tags                  = var.tags
}
```

## References

- [Terraform : azurerm_kubernetes_cluster_node_pool](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_node_pool)
- [Microsoft Azure : What is node pool in Aks?](https://docs.microsoft.com/en-us/azure/aks/use-multiple-node-pools)




