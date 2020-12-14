# Terraform Module : Azure Network Security Groups
![](https://upload.wikimedia.org/wikipedia/commons/thumb/0/04/Terraform_Logo.svg/1920px-Terraform_Logo.svg.png)

## How to use?
You can refer the below module into your terraform file with required parameters
```
module "nsg" {
  source              = "./modules/networking/nsg"
  location            = var.location
  nsg_name            = var.nsg_name
  resource_group_name = var.resource_group_name
  security_rules      = var.security_rules
  tags                = var.tags
}
```

## References

- [Terraform : azurerm_network_security_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group)
- [Microsoft Azure : What is Network Security Groups?](https://azure.microsoft.com/en-in/blog/network-security-groups/)




