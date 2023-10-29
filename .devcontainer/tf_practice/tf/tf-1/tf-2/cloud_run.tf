provider "google" {
  # Configuration options
  project = "terrform-practice-gcp"
  region = "us-central1"
  zone = "us-central1-a"
  credentials = "terraform-gcp-accesskey.json"
}

resource "google_cloud_run_service" "cloud_run" {
    name = "cloud-run-service"
    location = "us-central1"

    template {
      spec {
        containers {
          image = "us-docker.pkg.dev/cloudrun/container/hello"
        }
      }
    }
    traffic {
      percent = 100

    }
  
}