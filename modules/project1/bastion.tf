resource "google_compute_instance" "default" {
  name         = "bastion-pro1"
  machine_type = "n1-standard-1"
  zone         = "us-east1-b"

  tags = ["bastion-ssh"]
  boot_disk {
    initialize_params {
      image = "centos-cloud/centos-7"
    }
  }
  network_interface {
    network = "${google_compute_network.vpc.name}"
    # subnetwork="subnet-pro1a"
    subnetwork = "${element(google_compute_subnetwork.subnet.*.self_link,0)}"
    access_config {
      // Ephemeral IP
    }
  }
  metadata_startup_script = "sudo yum install -y git && sudo yum install -y ansible"
}