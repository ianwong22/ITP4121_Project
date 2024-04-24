# VPC
resource "google_compute_network" "ITP4121_network" {
    name                            = "${var.project_id}-tf-network2"
    auto_create_subnetworks         = "false"
    delete_default_routes_on_create = false
}

# SUBNETS
resource "google_compute_subnetwork" "ITP4121_private_network_a" {
    name                     =  "private-subnet-a"
    ip_cidr_range            =  var.ip_private_cidr_range[0]
    region                   =  var.region
    network                  =  google_compute_network.ITP4121_network.id
    private_ip_google_access =  true
}

resource "google_compute_subnetwork" "ITP4121_public_network_a" {
    name                     =  "public-subnet-a"
    ip_cidr_range            =  var.ip_public_cidr_range[0]
    region                   =  var.region
    network                  =  google_compute_network.ITP4121_network.id
    private_ip_google_access =  true
}

resource "google_compute_subnetwork" "ITP4121_private_network_b" {
    name                     =  "private-subnet-b"
    ip_cidr_range            =  var.ip_private_cidr_range[1]
    region                   =  var.region
    network                  =  google_compute_network.ITP4121_network.id
    private_ip_google_access =  true
}

resource "google_compute_subnetwork" "ITP4121_public_network_b" {
    name                     =  "public-subnet-b"
    ip_cidr_range            =  var.ip_public_cidr_range[1]
    region                   =  var.region
    network                  =  google_compute_network.ITP4121_network.id
    private_ip_google_access =  true
}