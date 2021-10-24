variable "router" {
  type = object({
    name    = string
    network = string
    region  = string
  })
}

variable "address" {
  type = object({
    name = string
  })
}

variable "nat" {
  type = object({
    name   = string
    subnet = string
  })
}
