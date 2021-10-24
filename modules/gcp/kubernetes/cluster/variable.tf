variable "master_authorized_networks_config_cidr_block" {
  type = list(object({
    display_name = string
    cidr_block   = string
  }))
}

variable "cluster" {
  type = object({
    name                          = string
    location                      = string
    network                       = string
    subnetwork                    = string
    release_channel               = string
    project                       = string
    cluster_secondary_range_name  = string
    services_secondary_range_name = string
  })
}
