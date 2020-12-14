# Terraform Module : Azure Kubernetes service
![](https://upload.wikimedia.org/wikipedia/commons/thumb/0/04/Terraform_Logo.svg/1920px-Terraform_Logo.svg.png)

## How to use?
You can refer the below module into your terraform file with required parameters
```
module "aks" {
  source              = "./modules/container_service/aks"
  aks_name            = var.aks_name
  client_id           = var.client_id
  client_secret       = var.client_secret
  dns_prefix          = var.dns_prefix
  location            = var.location
  resource_group_name = var.resource_group_name
  kubernetes_version  = var.kubernetes_version
  dns_service_ip      = var.dns_service_ip
  docker_bridge_cidr  = var.docker_bridge_cidr
  service_cidr        = var.service_cidr
  vnet_subnet_id      = var.vnet_subnet_id
  tags                = var.tags
}
```

## References

- [Terraform : azurerm_kubernetes_cluster](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster)
- [Microsoft Azure : What is AKS?](https://docs.microsoft.com/en-us/azure/aks/intro-kubernetes)




