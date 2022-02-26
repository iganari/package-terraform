output "timestamp" {
  value = timestamp()
}

output "format_timestamp" {
  value = formatdate("YYYY-MM-DD-hh-mm", timestamp())
}
