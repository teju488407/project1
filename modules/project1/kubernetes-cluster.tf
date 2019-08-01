resource "google_container_cluster" "primary" {
  name     = "gke-cluster-pro1"
  location = "us-central1"
  remove_default_node_pool = true
  initial_node_count = 1
  network = "${google_compute_network.vpc.name}"
  # subnetwork = "subnet-pro1b"
  network_policy { 
      enabled = true
  }
  private_cluster_config{
    enable_private_nodes = true
    enable_private_endpoint = true
    master_ipv4_cidr_block = "10.9.0.0/28"
  }
  ip_allocation_policy{
    use_ip_aliases    = true
    create_subnetwork = false
  }
  master_authorized_networks_config {
    cidr_blocks = [
      {
        cidr_block = "10.25.96.0/20"
      }
    ] # specify the bastion node range
  }
}

resource "google_container_node_pool" "my-pool" {
  name       = "pro1-node-pool"
  location   = "us-central1"
  cluster    = "${google_container_cluster.primary.name}"
  node_count = 1

  autoscaling {
    min_node_count = "1"
    max_node_count = "3"
  }

  node_config {
    machine_type = "n1-standard-1"
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
    tags = ["project1"]
  }
}