variable "vpc" {
  type = object({
    name                            = string
    database_version = string
    region         = string
  })
}
