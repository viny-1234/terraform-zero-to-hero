resource "google_compute_network" "custom_vpc" {
    name = "custom-vpc"
    auto_create_subnetworks = true
  
}
resource "google_compute_network" "auto_vpc" {
    name = "auto-vpc"
    auto_create_subnetworks = false
  
}
resource "google_compute_subnetwork" "sub-sg" {
    name = "sub-sg"
    network = google_compute_network.custom_vpc.id
    ip_cidr_range = "10.1.0.0/24"
    region = "asia-southeast1"
    private_ip_google_access = true 
  
}