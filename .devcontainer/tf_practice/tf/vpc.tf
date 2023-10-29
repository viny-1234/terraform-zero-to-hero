provider "google" {
  # Configuration options
  project = "terrform-practice-gcp"
  region = "us-central1"
  zone = "us-central1-a"
  credentials = "terraform-gcp-accesskey.json"
}

resource "google_compute_network" "custom_vpc" {
  name                    = "my-custom-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "example_subnet" {
  name          = "my-subnet"
  network       = google_compute_network.custom_vpc.self_link
  region        = "us-central1" # or your desired region
  ip_cidr_range = "10.0.1.0/24"  # Specify your desired IP CIDR range for the subnet
  private_ip_google_access = true 
}

resource "google_compute_firewall" "allow-icmp" {
    name = "allow-icmp"
    network = google_compute_network.custom_vpc.self_link
    allow {
      protocol = "icmp"
    }
    source_ranges = ["171.76.86.175/32"]

    }
