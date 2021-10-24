variable "node_pool" {
  type = object({
    name            = string
    cluster         = string
    node_locations  = list(string)
    node_count      = string
    machine_type    = string
    service_account = string
    max_surge       = string
    max_unavailable = string
  })
}
