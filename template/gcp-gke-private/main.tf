terraform {
  backend "gcs" {
    bucket = "Your Google Storage Bucket"
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
  source     = "../modules/project/service"

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
  source     = "../modules/networking/vpc"

  vpc = {
    name                            = "pyxis2v2"
    delete_default_routes_on_create = false
    auto_create_subnetworks         = false
  }
}
# output "vpc" {
#   value = module.vpc
# }


/*
subnet
*/
module "subnet" {

  depends_on = [module.vpc]
  source     = "../modules/networking/subnet"

  subnet = {
    name          = "pyxis2v2-gke"
    network       = module.vpc.self_link
    ip_cidr_range = "10.146.0.0/20"
    region        = var.region
    description   = "main product subnet"
  }
  secondary_ip_range = [
    {
      range_name    = "pyxis2v2-gke-pods"
      ip_cidr_range = "10.127.0.0/17"
    },
    {
      range_name    = "pyxis2v2-gke-services"
      ip_cidr_range = "10.127.128.0/22"
    },
  ]
}
# output "subnet" {
#   value = module.subnet
# }


/*
Firewall
*/
module "firewall_allow_internal" {

  depends_on = [module.vpc]
  source     = "../modules/networking/firewalls"

  firewall = {
    name          = "${module.vpc.main.name}-allow-internal"
    network       = module.vpc.self_link
    source_ranges = [module.subnet.main.ip_cidr_range]
  }

  allow_tcp = ["0-65535"]
  allow_udp = ["0-65535"]
}
# output "firewall_allow_internal" {
#   value = module.firewall_allow_internal
# }


/*
Cloud NAT
*/
module "cloud_nat" {
  depends_on = [module.vpc]
  source     = "../modules/net_services/nat"

  router = {
    name    = "pyxis2v2-gke-nat"
    network = module.vpc.self_link
    region  = var.region
  }
  address = {
    name = "gke-pyxis2v2-nat"
  }

  nat = {
    name   = "pyxis2v2-gke"
    subnet = module.subnet.main.id
  }
}
# output "cloud_nat" {
#   value = module.cloud_nat
# }


/*
Service Account
*/
module "sa_gke_node" {
  source = "../modules/iam_admin/serviceaccounts"

  serviceaccounts = {
    account_id   = "pyxis2v2-node"
    display_name = "GKE の node 用サービスアカウント"
  }
}
# output "sa_gke_node" {
#   value = module.sa_gke_node
# }


/*
Permissions
*/
module "sa_gke_node_permissions" {
  source = "../modules/iam_admin/iam"

  email = module.sa_gke_node.main.email
  roles = [
    "roles/storage.admin",
    "roles/storage.objectAdmin",
    "roles/logging.admin",
    "roles/monitoring.admin",
    "roles/container.admin",
  ]
}
# output "sa_gke_node_permissions" {
#   value = module.sa_gke_node_permissions
# }


/*
Service Account
*/
module "sa_gke_pod" {
  source = "../modules/iam_admin/serviceaccounts"

  serviceaccounts = {
    account_id   = "pyxis2v2-pod"
    display_name = "GKE の Pod 用サービスアカウント"
  }
}
# output "sa_gke_pod" {
#   value = module.sa_gke_pod
# }


/*
Permissions
*/
module "sa_gke_pod_permissions" {
  source = "../modules/iam_admin/iam"

  email = module.sa_gke_pod.main.email
  roles = [
    "roles/storage.admin",
    "roles/storage.objectAdmin",
    "roles/logging.admin",
    "roles/monitoring.admin",
  ]
}
# output "sa_gke_pod_permissions" {
#   value = module.sa_gke_pod_permissions
# }


/*
GKE Cluster
*/
module "gke_cluster" {
  depends_on = [module.vpc]
  source     = "../modules/kubernetes/cluster"

  cluster = {
    name            = "pyxis2v2"
    location        = var.region
    network         = module.vpc.self_link
    subnetwork      = module.subnet.main.id
    release_channel = "RAPID" ## RAPID, REGULAR, STABLE
    project         = var.gcp_project_id

    cluster_secondary_range_name  = "pyxis2v2-gke-pods"
    services_secondary_range_name = "pyxis2v2-gke-services"
  }

  master_authorized_networks_config_cidr_block = [
    {
      display_name = "any"
      cidr_block   = "0.0.0.0/0"
    },
    {
      display_name = "any-2"
      cidr_block   = "0.0.0.0/0"
    },
  ]
}
# output "gke_cluster" {
#   value     = module.gke_cluster
#   sensitive = true
# }


/*
GKE Node Pools
*/
module "gke_node_pool_web" {
  depends_on = [module.gke_cluster]
  source     = "../modules/kubernetes/node_pool_autoscaling"

  node_pool_autoscaling = {
    name    = "pyxis2v2-web-pool"
    cluster = module.gke_cluster.main.id

    node_locations = [
      "asia-northeast1-a",
    ]
    node_count      = 1
    max_surge       = 1
    max_unavailable = 0

    machine_type    = "n1-standard-1"
    service_account = module.sa_gke_node.main.email

    autoscaling_min = 0
    autoscaling_max = 3
  }
}


/*
GKE Node Pools
*/
module "gke_node_pool_rs_db" {
  depends_on = [module.gke_cluster]
  source     = "../modules/kubernetes/node_pool"

  node_pool = {
    name    = "pyxis2v2-rs-db-pool"
    cluster = module.gke_cluster.main.id

    node_locations = [
      "asia-northeast1-a",
    ]
    node_count      = 1
    max_surge       = 1
    max_unavailable = 0

    machine_type    = "n1-standard-1"
    service_account = module.sa_gke_node.main.email
  }
}


/*
GKE Node Pools
*/
module "gke_node_pool_rsa_db" {
  depends_on = [module.gke_cluster]
  source     = "../modules/kubernetes/node_pool"

  node_pool = {
    name    = "pyxis2v2-rsa-db-pool"
    cluster = module.gke_cluster.main.id

    node_locations = [
      "asia-northeast1-a",
    ]
    node_count      = 1
    max_surge       = 1
    max_unavailable = 0

    machine_type    = "n1-standard-1"
    service_account = module.sa_gke_node.main.email
  }
}


/*
External IP addresses for Ingress
*/
module "global_address" {
  source = "../modules/networking/global_address"

  global_address = "pyxis2v2-ingress"
}
# output "global_address" {
#   value = module.global_address
# }
