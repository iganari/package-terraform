variable "firewall" {
  type = object({
    name          = string
    network       = string
    source_ranges = list(string)
  })
}

variable "allow_tcp" {
  type    = list(string)
  default = null
}

variable "allow_udp" {
  type    = list(string)
  default = null
}
