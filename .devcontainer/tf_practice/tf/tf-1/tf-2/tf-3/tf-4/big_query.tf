provider "google" {
  # Configuration options
  project = "terrform-practice-gcp"
  region = "us-central1"
  zone = "us-central1-a"
  credentials = "terraform-gcp-accesskey.json"
}

resource "google_bigquery_dataset" "bq_dataset" {
    dataset_id = "ds_from_tf"
  
}
resource "google_bigquery_table" "table_tf" {
    table_id = "table_from_tf"
    dataset_id = google_bigquery_dataset.bq_dataset.dataset_id
  
}