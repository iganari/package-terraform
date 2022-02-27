output "timestamp" {
  value = timestamp()
}

# https://www.terraform.io/language/functions/formatdate
output "format_timestamp" {
  value = formatdate("YYYY-MM-DD-hh-mm", timestamp())
}
