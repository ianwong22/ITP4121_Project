data "google_client_config" "provider" {}

# Configure the Kubernetes provider for the GKE cluster
provider "kubernetes" {
  alias = "gke"
  host  = "https://${google_container_cluster.primary.endpoint}"
  token = data.google_client_config.provider.access_token
  cluster_ca_certificate = base64decode(google_container_cluster.primary.master_auth[0].cluster_ca_certificate)

}

# Apply the Deployment configuration
data "local_file" "deployment" {
  filename = "${path.module}/../k8s/1-deployment.yaml"
}

resource "kubernetes_manifest" "deployment_gke" {
  provider = kubernetes.gke
  manifest = yamldecode(data.local_file.deployment.content)
}

# Apply the public Service configuration
data "local_file" "service_public" {
  filename = "${path.module}/../k8s/2-service.yaml"
}

resource "kubernetes_manifest" "service_public_gke" {
  provider = kubernetes.gke
  manifest = yamldecode(data.local_file.service_public.content)
}

