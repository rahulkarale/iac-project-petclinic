# Terraform Module : Azure Network Security Groups Association
![](https://upload.wikimedia.org/wikipedia/commons/thumb/0/04/Terraform_Logo.svg/1920px-Terraform_Logo.svg.png)

## How to use?
You can refer the below module into your terraform file with required parameters
```
module "association" {
  source                    = "./modules/networking/subnet_nsg_association"
  network_security_group_id = var.network_security_group_id
  subnet_id                 = var.subnet_id
}
```

## References

- [Terraform : azurerm_subnet_network_security_group_association](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_network_security_group_association)
- [Microsoft Azure : What is Network Security Groups Association?](https://docs.microsoft.com/en-us/azure/virtual-network/virtual-network-network-interface#associate-or-dissociate-a-network-security-group)




