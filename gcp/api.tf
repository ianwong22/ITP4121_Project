# API
resource "google_project_service" "project" {
  project = var.project_id
  service = "compute.googleapis.com"
  timeouts {
    create = "30m"
    update = "40m"
  }

  disable_dependent_services = true

}

resource "google_project_service" "project" {
  project = var.project_id
  service = "container.googleapis.com"
  timeouts {
    create = "30m"
    update = "40m"
  }

  disable_dependent_services = true

}
