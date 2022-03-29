terraform {
  # backend "gcs" {
  #   bucket = "Your Google Storage Bucket"
  #   prefix = "gcp-gke"
  # }
  required_version = "~> 1.0"
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}

provider "google" {
  project = var.gcp_project_id
  region  = var.region
}


# /*
# APIs & Services
# */
# module "service" {
#   source     = "../modules/project/service"
# 
#   project_id = var.gcp_project_id
#   services = [
#     "cloudbuild",
#   ]
# }
# # output "service" {
# #   value = module.service
# # }




# cloudscheduler.

locals {
  apis = [
    "cloudbuild",
    "cloudscheduler",
  ]
} 

resource "google_project_service" "main" {

  for_each = toset(local.apis)

  project            = var.gcp_project_id
  service            = "${each.value}.googleapis.com"
  disable_on_destroy = false



  timeouts {
    create = "40m"
    update = "40m"
    delete = "40m"
  }
}







resource "google_cloudbuild_trigger" "main" {
  depends_on = [google_project_service.main]

  name        = "manual-build"

  source_to_build {
    repo_type = "GITHUB"
    uri       = "https://github.com/iganari/package-terraform"
    # ref       = "refs/heads/main"
    ref       = "feature/add-gcp-manual-build-trigger"
  }

  git_file_source {
    repo_type = "GITHUB"
    path      = "template/gcp-builds-trigger/cloudbuild.yaml"
    # uri       = "https://github.com/iganari/package-terraform"
    # revision  = "refs/heads/main"
    # revision  = "feature/add-gcp-manual-build-trigger"
  }
}
