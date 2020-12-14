# Terraform Module : Azure Resource Group
![](https://upload.wikimedia.org/wikipedia/commons/thumb/0/04/Terraform_Logo.svg/1920px-Terraform_Logo.svg.png)

## How to use?
You can refer the below module into your terraform file with required parameters
```
module "resource_group" {
  source              = "./modules/resources/resource_group"
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags
}

```

## References

- [Terraform : azurerm_resource_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group)
- [Microsoft Azure : What is Azure Resource Group?](https://docs.microsoft.com/en-us/azure/azure-resource-manager/management/manage-resource-groups-portal#what-is-a-resource-group)




