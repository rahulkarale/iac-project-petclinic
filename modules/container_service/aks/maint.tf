resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = var.aks_name
  resource_group_name = var.resource_group_name
  location            = var.location
  dns_prefix          = var.dns_prefix
  kubernetes_version  = var.kubernetes_version

  default_node_pool {
    name               = var.default_np_name
    node_count         = var.default_np_count
    vm_size            = var.default_np_vm_size
    availability_zones = var.availability_zones
    vnet_subnet_id     = var.vnet_subnet_id
  }

  role_based_access_control {
    enabled = var.aks_rbac_enabled
  }

  service_principal {
    client_id     = var.client_id
    client_secret = var.client_secret
  }

  network_profile {
    network_plugin     = var.network_plugin
    network_policy     = var.network_policy
    dns_service_ip     = var.dns_service_ip
    docker_bridge_cidr = var.docker_bridge_cidr
    service_cidr       = var.service_cidr
    load_balancer_sku  = var.load_balancer_sku
  }

  addon_profile {
    http_application_routing {
      enabled = var.http_application_routing
    }
    kube_dashboard {
      enabled = var.kube_dashboard
    }
  }
  tags = var.tags
}
