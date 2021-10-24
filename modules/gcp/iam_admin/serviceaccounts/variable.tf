variable "serviceaccounts" {
  type = object({
    account_id   = string
    display_name = string
  })
}
