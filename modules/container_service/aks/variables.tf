variable "aks_name" {
  description = "(Required) The name of the Managed Kubernetes Cluster to create. Changing this forces a new resource to be created."
  type        = string
}
variable "resource_group_name" {
  description = "(Required) Specifies the Resource Group where the Managed Kubernetes Cluster should exist. Changing this forces a new resource to be created."
  type        = string
}
variable "location" {
  description = "(Required) The location where the Managed Kubernetes Cluster should be created. Changing this forces a new resource to be created."
  type        = string
}
variable "dns_prefix" {
  description = "(Required) DNS prefix specified when creating the managed cluster. Changing this forces a new resource to be created"
  type        = string
}
variable "kubernetes_version" {
  description = "(Optional) Version of Kubernetes specified when creating the AKS managed cluster. If not specified, the latest recommended version will be used at provisioning time (but won't auto-upgrade)."
  type        = string
  default     = "1.18."
}
variable "http_application_routing" {
  description = "(Required) Is HTTP Application Routing Enabled?"
  type        = bool
  default     = true
}
variable "aks_rbac_enabled" {
  description = "(Required) Is Role Based Access Control Enabled? Changing this forces a new resource to be created."
  type        = bool
  default     = true
}
variable "kube_dashboard" {
  description = "(Required) Is the Kubernetes Dashboard enabled?"
  type        = bool
  default     = true
}
variable "client_id" {
  description = "(Required) The Client ID for the Service Principal."
  type        = string
}
variable "client_secret" {
  description = "(Required) The Client Secret for the Service Principal."
  type        = string
}
variable "default_np_name" {
  description = "(Required) The name which should be used for the default Kubernetes Node Pool. Changing this forces a new resource to be created."
  type        = string
  default     = "default"
}
variable "default_np_count" {
  description = "(Required) The number of nodes which should exist in this Node Pool. If specified this must be between 1 and 1000"
  type        = string
  default     = "1"
}
variable "default_np_vm_size" {
  description = "(Required) The size of the Virtual Machine, such as Standard_DS2_v2"
  type        = string
  default     = "Standard_DS2_v2"
}
variable "availability_zones" {
  description = "(Optional) A list of Availability Zones across which the Node Pool should be spread. Changing this forces a new resource to be created."
  type        = list(string)
  default     = []
}
variable "vnet_subnet_id" {
  description = "(Optional) The ID of a Subnet where the Kubernetes Node Pool should exist. Changing this forces a new resource to be created"
  type        = string
}
variable "network_policy" {
  description = "(Optional) Sets up network policy to be used with Azure CNI. Network policy allows us to control the traffic flow between pods. Currently supported values are calico and azure. Changing this forces a new resource to be created"
  type        = string
  default     = "calico"
}
variable "network_plugin" {
  description = "(Required) Network plugin to use for networking. Currently supported values are azure and kubenet. Changing this forces a new resource to be created."
  type        = string
  default     = "azure"
}
variable "dns_service_ip" {
  description = "(Optional) IP address within the Kubernetes service address range that will be used by cluster service discovery (kube-dns). Changing this forces a new resource to be created."
  type        = string
}
variable "docker_bridge_cidr" {
  description = "(Optional) IP address (in CIDR notation) used as the Docker bridge IP address on nodes. Changing this forces a new resource to be created."
  type        = string
}
variable "service_cidr" {
  description = "(Optional) IP address (in CIDR notation) used as the Docker bridge IP address on nodes. Changing this forces a new resource to be created."
  type        = string
}

variable "load_balancer_sku" {
  description = "(Optional) Specifies the SKU of the Load Balancer used for this Kubernetes Cluster. Possible values are Basic and Standard. Defaults to Standard."
  default     = "Standard"
}
variable "tags" {
  description = "(Optional) A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {}
}