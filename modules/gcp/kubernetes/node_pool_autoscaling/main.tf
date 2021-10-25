resource "google_container_node_pool" "main" {
  name    = var.node_pool_autoscaling.name
  cluster = var.node_pool_autoscaling.cluster

  node_locations = var.node_pool_autoscaling.node_locations
  node_count     = var.node_pool_autoscaling.node_count

  upgrade_settings {
    max_surge       = var.node_pool_autoscaling.max_surge
    max_unavailable = var.node_pool_autoscaling.max_surge
  }

  node_config {
    machine_type    = var.node_pool_autoscaling.machine_type
    service_account = var.node_pool_autoscaling.service_account
    oauth_scopes    = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
    workload_metadata_config {
      mode = "GKE_METADATA"
    }
  }

  autoscaling {
    min_node_count = var.node_pool_autoscaling.autoscaling_min
    max_node_count = var.node_pool_autoscaling.autoscaling_max
  }

  timeouts {
    create = "30m"
    update = "30m"
    delete = "30m"
  }
}
