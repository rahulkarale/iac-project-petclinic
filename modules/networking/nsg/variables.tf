variable "nsg_name" {
  description = "(Required) Specifies the name of the network security group. Changing this forces a new resource to be created."
  type        = string
}
variable "resource_group_name" {
  description = "(Required) The name of the resource group in which to create the network security group. Changing this forces a new resource to be created."
  type        = string
}
variable "location" {
  description = "(Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
  type        = string
}
variable "security_rules" {
  description = "(Optional) List of objects representing security rules, as defined below"
  type = list(object({
    #(Required) The name of the security rule.
    name = string

    #(Required) Specifies the priority of the rule. The value can be between 100 and 4096. The priority number must be unique for each rule in the collection.
    #The lower the priority number, the higher the priority of the rule.
    priority = string

    #(Required) Specifies whether network traffic is allowed or denied. Possible values are Allow and Deny.
    access = string

    #(Required) The direction specifies if rule will be evaluated on incoming or outgoing traffic. Possible values are Inbound and Outbound.
    direction = string

    #(Required) Network protocol this rule applies to. Can be Tcp, Udp, Icmp, or * to match all
    protocol = string

    # (Optional) Source Port or Range. Integer or range between 0 and 65535 or * to match any. This is required if source_port_ranges is not specified.
    source_port_range = string

    #(Optional) Destination Port or Range. Integer or range between 0 and 65535 or * to match any. This is required if destination_port_ranges is not specified.
    destination_port_range = string

    #(Optional) CIDR or source IP range or * to match any IP. Tags such as ‘VirtualNetwork’, ‘AzureLoadBalancer’ and ‘Internet’ can also be used.
    #This is required if source_address_prefixes is not specified.
    source_address_prefix = string

    #(Optional) CIDR or destination IP range or * to match any IP. Tags such as ‘VirtualNetwork’, ‘AzureLoadBalancer’ and ‘Internet’ can also be used.
    #This is required if destination_address_prefixes is not specified
    destination_address_prefix = string

    #(Optional) A description for this rule. Restricted to 140 characters.
    description = string
  }))
  default = []
}

variable "tags" {
  description = "(Optional) A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {}
}