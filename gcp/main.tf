provider "google" {
    project = var.project_id
    region  = var.region
    zone    = var.zone
}

data "google_compute_zones" "this" {
  region  = var.region
  project = var.project_id
}
