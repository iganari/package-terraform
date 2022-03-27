terraform {
  backend "gcs" {
    bucket = "Your Google Storage Bucket"
    prefix = "gcp-gke"
  }
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


/*
APIs & Services
*/
module "service" {
  source     = "../modules/project/service"

  project_id = var.gcp_project_id
  services = [
    "compute",
    "container",
    "storage-component",
    "iam",
    "dns",
    "logging",
    "monitoring",
  ]
}
# output "service" {
#   value = module.service
# }

resource "google_cloudbuild_trigger" "manual-trigger" {
  name        = "manual-build"

  source_to_build {
    uri       = "https://hashicorp/terraform-provider-google-beta"
    ref       = "refs/heads/main"
    repo_type = "GITHUB"
  }

  git_file_source {
    path      = "cloudbuild.yaml"
    uri       = "https://hashicorp/terraform-provider-google-beta"
    revision  = "refs/heads/main"
    repo_type = "GITHUB"
  }
}
