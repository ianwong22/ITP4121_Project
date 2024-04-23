output "endpoint" {
  value = google_container_cluster.primary.endpoint
}

output "region" {
    value = var.region
}

output "project_id" {
    value = var.project_id
}