terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.0.0"
    }
  }
}

provider "google" {
  # Configuration options
  project = "terrform-practice-gcp"
  region = "us-central1"
  zone = "us-central1-a"
}

resource "google_storage_bucket" "GCS-1" {
    name = "bucket-creation-gcp"
    location = "US"
  
}