/*module "networking" {
  source = "./modules/networking"
}

module "shared-network" {
  source = "./modules/shared-network"
}

module "infrastructure" {
  source            = "./modules/infrastructure"
  subnet_self_links = ["${module.networking.subnet_self_links}"]
}

module "route-nat" {
  source = "./modules/route-nat"
}

module "cloud-sql" {
  source = "./modules/cloud-sql"
  general = {
    name       = "sql-test-instance"
    env        = "dev"
    region     = "europe-west1"
    db_version = "POSTGRES_9_6"
  }
  instance = {
    zone = "b"
  }
}

module "postgres" {
  source = "./modules/postgres"

}

module "new-network" {
  source = "./modules/new-network"
  
}


module "vpc" {
    source = "github.com/terraform-google-modules/terraform-google-network"
    project_id   = "sincere-chariot-214207"
    network_name = "example-vpc"
    shared_vpc_host = "true"

    subnets = [
        {
            subnet_name           = "subnet-01"
            subnet_ip             = "10.25.0.0/20"
            subnet_region         = "us-east1"
        },
        {
            subnet_name           = "subnet-02"
            subnet_ip             = "10.25.96.0/20"
            subnet_region         = "us-central1"
        },
    ]

    secondary_ranges = {
        subnet-01 = [
            {
                range_name    = "subnet-01-secondary-01"
                ip_cidr_range = "10.25.16.0/20"
            },
            {
                range_name    = "subnet-01-secondary-02"
                ip_cidr_range = "10.25.32.0/20"
            },
            {
                range_name    = "subnet-01-secondary-03"
                ip_cidr_range = "10.25.48.0/20"
            },
            {
                range_name    = "subnet-01-secondary-04"
                ip_cidr_range = "10.25.64.0/20"
            },
            {
                range_name    = "subnet-01-secondary-05"
                ip_cidr_range = "10.25.80.0/20"
            },
        ]

        subnet-02 = [
            {
                range_name    = "subnet-02-secondary-01"
                ip_cidr_range = "10.25.112.0/20"
            },
            {
                range_name    = "subnet-02-secondary-02"
                ip_cidr_range = "10.25.128.0/20"
            },
            {
                range_name    = "subnet-02-secondary-03"
                ip_cidr_range = "10.25.114.0/20"
            },
            {
                range_name    = "subnet-02-secondary-04"
                ip_cidr_range = "10.25.160.0/20"
            },
            {
                range_name    = "subnet-02-secondary-05"
                ip_cidr_range = "10.25.176.0/20"
            },
        ]
    }
}

module "iam_binding" {
  source = "terraform-google-modules/iam/google"
  projects = ["sincere-chariot-214207"]
  mode     = "additive"
  bindings = {
    "roles/storage.viewer" = [
      "serviceAccount:test-service-account@odsp-production.iam.gserviceaccount.com",
    ]
  }
}
*/

module "vikram" {
  source = "./modules/vikram"
}
