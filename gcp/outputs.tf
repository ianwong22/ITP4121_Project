output "endpoint" {
  value = google_container_cluster.primary.endpoint
}

output "region" {
    value = var.region
}

output "project_id" {
    value = var.project_id
}

output "name_servers" {
  description = "The list of nameservers for the managed DNS zone"
  value       = google_dns_managed_zone.default.name_servers
}