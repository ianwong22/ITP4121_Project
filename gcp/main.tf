provider "google" {
    project = var.project_id
    region  = var.region
    zone    = var.zone
}

data "google_compute_zones" "this" {
  region  = var.region
  project = var.project_id
}

# VPC
resource "google_compute_network" "ITP4121_network" {
    name                            = "${var.project_id}-tf-network"
    auto_create_subnetworks         = "false"
    delete_default_routes_on_create = false
}

# SUBNETS
resource "google_compute_subnetwork" "ITP4121_private_network" {
    count= 3
    name                     =  "private-subnet-${count.index + 1}"
    ip_cidr_range            =  var.ip_private_cidr_range[count.index]
    region                   =  var.region
    network                  =  google_compute_network.ITP4121_network.id
    private_ip_google_access =  true
}

resource "google_compute_subnetwork" "ITP4121_public_network" {
    count= 3
    name                     =  "public-subnet-${count.index + 1}"
    ip_cidr_range            =  var.ip_public_cidr_range[count.index]
    region                   =  var.region
    network                  =  google_compute_network.ITP4121_network.id
    private_ip_google_access =  true
}