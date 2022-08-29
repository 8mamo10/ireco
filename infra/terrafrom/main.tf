terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.5.0"
    }
  }
  backend "gcs" {
    prefix = "tfstate/v1"
  }
}

provider "google" {
  project = var.project
  region  = var.region
  zone    = var.zone
}

resource "google_artifact_registry_repository" "ireco" {
  provider = google-beta

  location      = "asia-northeast1"
  repository_id = "ireco"
  description   = "ireco backend"
  format        = "DOCKER"
  project       = var.project
}
resource "google_cloud_run_service" "ireco" {
  name     = "ireco"
  project  = var.project
  location = var.region

  template {
    spec {
      containers {
        image = var.container_images
      }
    }
  }
}

resource "google_cloud_run_service" "ireco2" {
  name     = "ireco2"
  project  = var.project
  location = var.region

  template {
    spec {
      containers {
        image = var.container_images
      }
    }
  }
}
