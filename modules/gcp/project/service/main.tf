resource "google_project_service" "default" {
  project            = var.project_id
  service            = "cloudresourcemanager.googleapis.com"
  disable_on_destroy = false

  timeouts {
    create = "40m"
    update = "40m"
    delete = "40m"
  }
}

resource "google_project_service" "main" {
  depends_on = [google_project_service.default]

  for_each = toset(var.services)

  project            = var.project_id
  service            = "${each.value}.googleapis.com"
  disable_on_destroy = false

  timeouts {
    create = "40m"
    update = "40m"
    delete = "40m"
  }
}
