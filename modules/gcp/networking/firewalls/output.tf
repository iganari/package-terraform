output "main" {
  value = google_compute_firewall.main
}

output "self_link" {
  value = google_compute_firewall.main.self_link
}
