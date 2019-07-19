//VPC NETWORK
resource "google_compute_network" "vpc" {
    name                    = "vpc-pro-1"
    auto_create_subnetworks = "false"
}

// SUBNETS
resource "google_compute_subnetwork" "subnet" {
    count         = "${length(var.subnet_cidr)}"
    name          = "subnet-pro1${var.sub-names[count.index]}"
    ip_cidr_range = "${var.subnet_cidr[count.index]}"
    region        = "${var.subnet_region[count.index]}"
    network       = "${google_compute_network.vpc.name}"
}


// FIREWALL RULES
resource "google_compute_firewall" "firewall" {
    name        = "firewall-pro1"
    network     = "${google_compute_network.vpc.name}"

    allow {
        protocol = "icmp"
    }
    allow {
        protocol = "tcp"
        ports    = ["22"]
    }

    source_ranges = ["35.239.140.117/32"]
}
