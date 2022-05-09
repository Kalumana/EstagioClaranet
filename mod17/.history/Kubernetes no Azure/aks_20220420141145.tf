resource "azurerm_kubernetes_cluster" "aks" {
  name                = "akstf"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "akstf"

  default_node_pool {
    name       = "agentpool"
    node_count = 2
    vm_size    = "Standard_ B2s"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    owner = "António Kalumana"
  }
}

output "client_certificate" {
  value = azurerm_kubernetes_cluster.aks.kube_config.0.client_certificate
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.aks.kube_config_raw

  sensitive = true
}
resource "azurerm_role_assignment" "aks_acr" {
  name               = "aks_acr_tf"
  scope              = azurerm_container_registry.acr.id
  role_definition_id = "acrpull"
  principal_id       = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
}