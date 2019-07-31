resource "google_container_cluster" "primary" {
  name     = "gke-cluster-pro1"
  location = "us-central1"
  remove_default_node_pool = true
  initial_node_count = 1
  network = "${google_compute_network.vpc.name}"
}

resource "google_container_node_pool" "my-pool" {
  name       = "pro1-node-pool"
  location   = "us-central1"
  cluster    = "${google_container_cluster.primary.name}"
  node_count = 1

  node_config {
    machine_type = "n1-standard-1"
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
    tags = ["project1"]
  }
}