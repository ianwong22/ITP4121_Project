resource "google_container_cluster" "primary" {
  name     = "itp4121-gke-cluster"
  location = var.region
  network  = google_compute_network.ITP4121_network.self_link
  subnetwork = google_compute_subnetwork.ITP4121_private_network_a.self_link

  remove_default_node_pool = true
  initial_node_count       = 1

}

resource "google_container_node_pool" "primary" {
  name       = "itp4121-node-pool"
  location   = var.region
  cluster    = google_container_cluster.primary.name
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = "e2-medium"

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
  autoscaling {
      min_node_count = 1
      max_node_count = 2
  }
}