variable "vnet_name" {
  description = "(Required) The name of the virtual network. Changing this forces a new resource to be created."
  type        = string
}
variable "resource_group_name" {
  description = "(Required) The name of the resource group in which to create the virtual network."
  type        = string
}
variable "cidr_block" {
  description = "(Required) The address space that is used the virtual network. You can supply more than one address space."
  type = list(string)
}
variable "location" {
  description = "(Required) The location/region where the virtual network is created. Changing this forces a new resource to be created."
  type        = string
}
variable "tags" {
  description = "(Optional) A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {}
}
variable "subnets" {
  description = "(Optional) Can be specified multiple times to define multiple subnets. Each subnet block supports fields documented below."
  type = list(object({
    #(Required) The name of the subnet.
    name = string
    #(Required) The address prefix to use for the subnet.
    address_prefix = string
  }))
  default = []
}