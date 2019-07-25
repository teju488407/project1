resource "google_compute_instance" "default" {
  name         = "bastion-pro1"
  machine_type = "n1-standard-1"
  zone         = "us-central1-f"

  tags = ["bastion-ssh"]
  boot_disk {
    initialize_params {
      image = "centos-cloud/centos-7"
    }
  }
  network_interface {
    network = "${google_compute_network.vpc.name}"

    access_config {
      // Ephemeral IP
    }
  }

  metadata = {
    foo = "bar"
  }

  metadata_startup_script = "echo hi > /test.txt"
}