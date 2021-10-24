resource "google_container_cluster" "main" {
  name       = var.cluster.name
  location   = var.cluster.location
  network    = var.cluster.network
  subnetwork = var.cluster.subnetwork

  # enable_autopilot = false

  remove_default_node_pool = true
  initial_node_count       = 1 ### 必要なのか迷う

  release_channel {
    channel = var.cluster.release_channel
  }

  master_authorized_networks_config {
    dynamic "cidr_blocks" {
      for_each = var.master_authorized_networks_config_cidr_block

      content {
        display_name = cidr_blocks.value.display_name
        cidr_block   = cidr_blocks.value.cidr_block
      }
    }
  }

  networking_mode = "VPC_NATIVE"

  ip_allocation_policy {
    cluster_secondary_range_name  = var.cluster.cluster_secondary_range_name
    services_secondary_range_name = var.cluster.services_secondary_range_name
  }

  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = false
    master_ipv4_cidr_block  = "10.0.0.0/28"
  }

  vertical_pod_autoscaling {
    enabled = true
  }

  workload_identity_config {
    identity_namespace = "${var.cluster.project}.svc.id.goog"
  }

  timeouts {
    create = "30m"
    update = "30m"
    delete = "30m"
  }
}
