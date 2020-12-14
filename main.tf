locals {
  default_tags = {
    "billing_unit" = var.billing_unit
    "environment"  = var.environment
  }
}

module "resource_group" {
  source              = "./modules/resources/resource_group"
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = merge(local.default_tags, var.tags)
}

module "virtual_network" {
  source              = "./modules/networking/vnet"
  cidr_block          = var.cidr_block
  vnet_name           = var.vnet_name
  resource_group_name = module.resource_group.resource_group_name
  location            = var.location
  subnets             = var.subnets
  tags                = merge(local.default_tags, var.tags)
}

module "nsg" {
  source              = "./modules/networking/nsg"
  location            = var.location
  nsg_name            = var.nsg_name
  resource_group_name = module.resource_group.resource_group_name
  security_rules      = var.security_rules
  tags                = merge(local.default_tags, var.tags)
}

module "association" {
  count                     = length(var.subnets)
  source                    = "./modules/networking/subnet_nsg_association"
  network_security_group_id = module.nsg.nsg_id
  subnet_id                 = tolist(module.virtual_network.subnets)[count.index].id
}

module "aks" {
  source              = "./modules/container_service/aks"
  aks_name            = var.aks_name
  client_id           = var.client_id
  client_secret       = var.client_secret
  dns_prefix          = var.dns_prefix
  location            = var.location
  resource_group_name = module.resource_group.resource_group_name
  kubernetes_version  = var.kubernetes_version
  dns_service_ip      = var.dns_service_ip
  docker_bridge_cidr  = var.docker_bridge_cidr
  service_cidr        = var.service_cidr
  vnet_subnet_id      = tolist(module.virtual_network.subnets)[0].id
  tags                = merge(local.default_tags, var.tags)
}


module "aks_node_pool" {
  source                = "./modules/container_service/aks_node_pool"
  kubernetes_cluster_id = module.aks.kubernetes_cluster_id
  aks_node_pool_name    = var.aks_node_pool_name
  vm_size               = var.vm_size
  availability_zones    = var.availability_zones
  enable_auto_scaling   = var.enable_auto_scaling
  max_count             = var.max_count
  min_count             = var.min_count
  node_count            = var.node_count
  orchestrator_version  = var.kubernetes_version
  vnet_subnet_id        = tolist(module.virtual_network.subnets)[0].id
  tags                  = merge(local.default_tags, var.tags)
}