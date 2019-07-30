provider "google" {
  credentials = "credentials"
  project     = "${var.project-id}"
  region      = "${var.region}"
  //org_id     = "1052607630679"
}

# provider "aws" {}
# terraform {
# backend "gcs" {
#     bucket      = "terraforming-state"
#     credentials = "creds.json"
#   }
# }
