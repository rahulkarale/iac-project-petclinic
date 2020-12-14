# Terraform Module : Azure Virtual Network
![](https://upload.wikimedia.org/wikipedia/commons/thumb/0/04/Terraform_Logo.svg/1920px-Terraform_Logo.svg.png)

## How to use?
You can refer the below module into your terraform file with required parameters
```
module "virtual_network" {
  source              = "./modules/networking/vnet"
  cidr_block          = var.cidr_block
  vnet_name           = var.vnet_name
  resource_group_name = var.resource_group_name
  location            = var.location
  subnets             = var.subnets
  tags                = var.tags
}
```

## References

- [Terraform : azurerm_virtual_network](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network)
- [Microsoft Azure : What is Azure Virtual Network?](https://docs.microsoft.com/en-us/azure/virtual-network/virtual-networks-overview)




