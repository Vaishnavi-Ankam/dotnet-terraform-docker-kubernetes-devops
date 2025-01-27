output "client_certificate" {
    value = azurerm_kubernetes_cluster.vaishuakscluster0909  
    sensitive = true
}

output "acr_id" {
  description = "The ID of the Azure Container Registry"
  value       = azurerm_container_registry.vaishuacr0909.id
}

output "aks_identity_principal_id" {
  description = "The Principal ID of the AKS cluster's managed identity"
  value       = azurerm_kubernetes_cluster.vaishuakscluster0909.identity[0].principal_id
}

output "acr_pull_role_assignment_id" {
  description = "The ID of the role assignment for AKS to pull images from ACR"
  value       = azurerm_role_assignment.acrpull.id
}
