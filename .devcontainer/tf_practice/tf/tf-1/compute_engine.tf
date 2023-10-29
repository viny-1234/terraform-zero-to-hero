provider "google" {
  # Configuration options
  project = "terrform-practice-gcp"
  region = "us-central1"
  zone = "us-central1-a"
  credentials = "terraform-gcp-accesskey.json"
}
resource "google_compute_instance" "gce-creation" {
    name = "gce-creation"
    machine_type = "n1-standard-1"
    zone = "us-central1-a"

    boot_disk {
      initialize_params {
        image = "debian-cloud/debian-10"
      }
    }
    network_interface {
      network = "default"
    }
  
}