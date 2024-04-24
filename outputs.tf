output "resource_group_name" {
  description = "Azure resource group name"
  value       = module.azure.resource_group_name
}

output "kubernetes_cluster_name" {
  description = "AKS cluster name"
  value       = module.azure.kubernetes_cluster_name
}

output "host" {
  value = module.azure.host
  sensitive = true
}

output "rds_endpoint" {
    value = module.aws.rds_endpoint
}

output "gke_endpoint" {
    value = module.gcp.endpoint
}

output "gke_region" {
    value = module.gcp.region
}

output "gke_project" {
    value = module.gcp.project_id
}

output "name_servers" {
    value = module.gcp.name_servers
}
