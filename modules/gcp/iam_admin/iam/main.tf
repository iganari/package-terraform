resource "google_project_iam_member" "main" {
  for_each = toset(var.roles)
  # for_each = var.permissions.roles

  member = "serviceAccount:${var.email}"
  role   = each.value
}
