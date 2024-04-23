provider "kubernetes" {
  alias = "aks"
  host  = azurerm_kubernetes_cluster.default.kube_config.0.host
  client_certificate     = base64decode(azurerm_kubernetes_cluster.default.kube_config.0.client_certificate)
  client_key             = base64decode(azurerm_kubernetes_cluster.default.kube_config.0.client_key)
  cluster_ca_certificate = base64decode(azurerm_kubernetes_cluster.default.kube_config.0.cluster_ca_certificate)
 }

 # Apply the Deployment configuration
data "local_file" "deployment" {
  filename = "${path.module}/../k8s/1-deployment.yaml"
}

resource "kubernetes_manifest" "deployment_aks" {
  provider = kubernetes.aks
  manifest = yamldecode(data.local_file.deployment.content)
}

# Apply the public Service configuration
data "local_file" "service_public" {
  filename = "${path.module}/../k8s/2-service.yaml"
}

resource "kubernetes_manifest" "service_public_aks" {
  provider = kubernetes.aks
  manifest = yamldecode(data.local_file.service_public.content)
}

# Apply the private Service configuration
data "local_file" "service_private" {
  filename = "${path.module}/../k8s/3-service.yaml"
}

resource "kubernetes_manifest" "service_private_aks" {
  provider = kubernetes.aks  
  manifest = yamldecode(data.local_file.service_private.content)
}
