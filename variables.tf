#----------------------------------------resource_group-------------------------------------------
variable "location" {
  description = "(Required) The Azure Region where the Resources should exist. Changing this forces a new Resource Group to be created"
  default     = "West Europe"
}
variable "resource_group_name" {
  description = "(Required) The Name where all the resources will be created"
  type        = string
  default     = "rg-project-petclinic"
}

#----------------------------------------virtual_network------------------------------------------
variable "cidr_block" {
  description = "(Required) The address space that is used the virtual network"
  type        = list(string)
  default     = ["172.0.0.0/19"]
}
variable "vnet_name" {
  description = "(Required) The name of the virtual network. Changing this forces a new resource to be created."
  type        = string
  default     = "vnet-project-petclinic"
}
variable "subnets" {
  description = "(Optional) Can be specified multiple times to define multiple subnets"
  default = [{
    name           = "snet-project-petclinic-01"
    address_prefix = "172.0.0.0/20"
    },
    {
      name           = "snet-project-petclinic-02"
      address_prefix = "172.0.16.0/20"
    },
  ]
}

#----------------------------------------------nsg------------------------------------------------
variable "nsg_name" {
  description = "(Required) Specifies the name of the network security group. Changing this forces a new resource to be created."
  type        = string
  default     = "nsg-project-petclinic"
}
variable "security_rules" {
  description = "(Optional) List of objects representing security rules"
  default = [
    {
      name                       = "sr-project-petclinic-01"
      priority                   = "100"
      access                     = "Allow"
      direction                  = "Inbound"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
      description                = "*"
    }
  ]
}

#----------------------------------------------provider_azurerm------------------------------------------------
variable "tenant_id" {
  description = "(Optional) The Tenant ID should be used. This can also be sourced from the TF_VAR_tenant_id Environment Variable"
}
variable "client_id" {
  description = "(Optional) The Client ID which should be used. This can also be sourced from the TF_VAR_client_id Environment Variable"
}
variable "client_secret" {
  description = "(Optional) The Client Secret which should be used. This can also be sourced from the TF_VAR_client_secret Environment Variable."
}
variable "subscription_id" {
  description = "(Optional) The Subscription ID which should be used. This can also be sourced from the TF_VAR_subscription_id Environment Variable"
}

#----------------------------------------------aks------------------------------------------------
variable "aks_name" {
  description = "(Required) The name of the Managed Kubernetes Cluster to create. Changing this forces a new resource to be created."
  type        = string
  default     = "aks-project-petclinic"
}
variable "dns_prefix" {
  description = "(Required) DNS prefix specified when creating the managed cluster. Changing this forces a new resource to be created"
  type        = string
  default     = "akspetclinic"
}
variable "kubernetes_version" {
  description = "(Optional) Version of Kubernetes specified when creating the AKS managed cluster. If not specified, the latest recommended version will be used at provisioning time (but won't auto-upgrade)."
  type        = string
  default     = "1.18.10"
}
variable "dns_service_ip" {
  description = "(Optional) IP address within the Kubernetes service address range that will be used by cluster service discovery (kube-dns). Changing this forces a new resource to be created."
  type        = string
  default     = "10.0.0.10"
}
variable "docker_bridge_cidr" {
  description = "(Optional) IP address (in CIDR notation) used as the Docker bridge IP address on nodes. Changing this forces a new resource to be created."
  type        = string
  default     = "172.17.0.1/16"
}
variable "service_cidr" {
  description = "(Optional) IP address (in CIDR notation) used as the Docker bridge IP address on nodes. Changing this forces a new resource to be created."
  type        = string
  default     = "10.0.0.0/16"
}

#----------------------------------------------aks_node_pool--------------------------------------------
variable "aks_node_pool_name" {
  description = "(Required) The name of the Node Pool which should be created within the Kubernetes Cluster. Changing this forces a new resource to be created"
  type        = string
  default     = "aksnp01"
}
variable "vm_size" {
  description = "(Required) The SKU which should be used for the Virtual Machines used in this Node Pool. Changing this forces a new resource to be created."
  type        = string
  default     = "Standard_D2_v2"
}
variable "availability_zones" {
  description = "(Optional) A list of Availability Zones where the Nodes in this Node Pool should be created in. Changing this forces a new resource to be created."
  type        = list(string)
  default     = []
}
variable "enable_auto_scaling" {
  description = "(Optional) Whether to enable auto-scaler. Defaults to false."
  type        = string
  default     = true
}
variable "max_count" {
  description = "If enable_auto_scaling is set to true. (Required) The maximum number of nodes which should exist within this Node Pool. Valid values are between 0 and 1000 and must be greater than or equal to min_count"
  type        = string
  default     = "2"
}
variable "min_count" {
  description = "If enable_auto_scaling is set to true. (Required) The minimum number of nodes which should exist within this Node Pool. Valid values are between 0 and 1000 and must be less than or equal to max_count."
  type        = string
  default     = "1"
}
variable "node_count" {
  description = "(Optional) The initial number of nodes which should exist within this Node Pool. Valid values are between 0 and 1000 and must be a value in the range min_count - max_count"
  type        = string
  default     = "1"
}
#----------------------------------------tags------------------------------------------
variable "tags" {
  type    = map(string)
  default = {}
}
variable "billing_unit" {
  description = "Name of billing unit"
  type        = string
  default     = "petclinic-dev-team"
}
variable "environment" {
  description = "Name of environment"
  type        = string
  default     = "dev"
}