terraform {
  backend "gcs" {
    # bucket = "Your Google Storage Bucket"
    bucket = "ca-igarashi-test-2021q3-pkg-terraform-tfstate"
    prefix = "gcp-gke"
  }
  required_version = "~> 1.0"
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}

provider "google" {
  project = var.gcp_project_id
  region  = var.region
}


/*
APIs & Services
*/
module "service" {
  source     = "../../modules/gcp/project/service"

  project_id = var.gcp_project_id
  services = [
    "compute",
    "container",
    "storage-component",
    "iam",
    "dns",
    "logging",
    "monitoring",
  ]
}
# output "service" {
#   value = module.service
# }


/*
VPC network
*/
module "vpc" {
  depends_on = [module.service]
  source     = "../../modules/gcp/networking/vpc"

  vpc = {
    name                            = var.common
    delete_default_routes_on_create = false
    auto_create_subnetworks         = false
  }
}
# output "vpc" {
#   value = module.vpc
# }


# /*
# subnet
# */
# module "subnet" {
# 
#   depends_on = [module.vpc]
#   source     = "../../modules/gcp/networking/subnet"
# 
#   subnet = {
#     name          = var.common
#     network       = module.vpc.self_link
#     ip_cidr_range = "10.146.0.0/20"
#     region        = var.region
#     description   = "main product subnet"
#   }
#   secondary_ip_range = [
#     {
#       range_name    = "pyxis2v2-gke-pods"
#       ip_cidr_range = "10.127.0.0/17"
#     },
#     {
#       range_name    = "pyxis2v2-gke-services"
#       ip_cidr_range = "10.127.128.0/22"
#     },
#   ]
# }
# # output "subnet" {
# #   value = module.subnet
# # }


# /*
# Firewall
# */
# module "firewall_allow_internal" {
# 
#   depends_on = [module.vpc]
#   source     = "../../modules/gcp/networking/firewalls"
# 
#   firewall = {
#     name          = "${module.vpc.main.name}-allow-internal"
#     network       = module.vpc.self_link
#     source_ranges = [module.subnet.main.ip_cidr_range]
#   }
# 
#   allow_tcp = ["0-65535"]
#   allow_udp = ["0-65535"]
# }
# # output "firewall_allow_internal" {
# #   value = module.firewall_allow_internal
# # }


# /*
# Cloud NAT
# */
# module "cloud_nat" {
#   depends_on = [module.vpc]
#   source     = "../../modules/gcp/net_services/nat"
# 
#   router = {
#     name    = "pyxis2v2-gke-nat"
#     network = module.vpc.self_link
#     region  = var.region
#   }
#   address = {
#     name = "gke-pyxis2v2-nat"
#   }
# 
#   nat = {
#     name   = "pyxis2v2-gke"
#     subnet = module.subnet.main.id
#   }
# }
# # output "cloud_nat" {
# #   value = module.cloud_nat
# # }


/*
Cloud SQL
*/