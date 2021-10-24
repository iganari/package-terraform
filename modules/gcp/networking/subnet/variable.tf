variable "subnet" {
  type = object({
    name          = string
    network       = string
    ip_cidr_range = string
    region        = string
    description   = string
  })
}

variable "secondary_ip_range" {
  type = list(object({
    range_name    = string
    ip_cidr_range = string
  }))
}
