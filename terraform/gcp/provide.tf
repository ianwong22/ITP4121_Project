terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.66.0"
    }
  }

  required_version = ">= 0.14"
}


provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}


# VPC
resource "google_compute_network" "ITP4121_network" {
  name                    = "${var.project_id}-tf-network"
  auto_create_subnetworks = "false"
}