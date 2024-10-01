terraform {
  required_providers {
    azurerm = {
      source                = "hashicorp/azurerm"
      version               = "~> 3.93.0"
      configuration_aliases = []
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_container_registry" "vaishuacr0909" {
  name                = "vaishuacr0909" 
  resource_group_name = data.azurerm_resource_group.myResourceGroup.name
  location            = "northeurope"

  sku = "Basic"

  admin_enabled = true
}

resource "azurerm_kubernetes_cluster" "vaishuakscluster0909" {
  name                = "vaishuakscluster0909"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.myResourceGroup.name
  dns_prefix          = "vaishuaks"

  default_node_pool {
    name       = "default"
    node_count = 2
    vm_size    = "Standard_DS2_v2"
  }

identity {
  type = "SystemAssigned"
}

}

resource "azurerm_role_assignment" "acrpull" {

    principal_id = azurerm_kubernetes_cluster.vaishuakscluster0909.identity[0].principal_id
    role_definition_name = "AcrPull"
    scope = azurerm_container_registry.vaishuacr0909.id

    depends_on = [
    azurerm_kubernetes_cluster.vaishuakscluster0909
  ]
    
}
