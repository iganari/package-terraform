variable "vpc" {
  type = object({
    name                            = string
    delete_default_routes_on_create = string
    auto_create_subnetworks         = string
  })
}
