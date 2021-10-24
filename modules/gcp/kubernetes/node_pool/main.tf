resource "google_container_node_pool" "main" {
  name    = var.node_pool.name
  cluster = var.node_pool.cluster

  node_locations = var.node_pool.node_locations
  node_count     = var.node_pool.node_count

  upgrade_settings {
    max_surge       = var.node_pool.max_surge
    max_unavailable = var.node_pool.max_surge
  }

  node_config {
    machine_type    = var.node_pool.machine_type
    service_account = var.node_pool.service_account
    oauth_scopes    = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
    workload_metadata_config {
      node_metadata = "GKE_METADATA_SERVER"
    }
  }

  timeouts {
    create = "30m"
    update = "30m"
    delete = "30m"
  }
}
