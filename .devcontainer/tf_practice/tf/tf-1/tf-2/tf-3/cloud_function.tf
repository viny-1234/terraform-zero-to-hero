provider "google" {
  # Configuration options
  project = "terrform-practice-gcp"
  region = "us-central1"
  zone = "us-central1-a"
  credentials = "terraform-gcp-accesskey.json"
}

resource "google_storage_bucket" "cloud_func_bucket1" {
    name = "cloud_func_bucket1"
    location = "us-central1"
}

resource "google_storage_bucket_object" "srccode" {
    name = "index.zip"
    bucket = google_storage_bucket.cloud_func_bucket1.name
    source = "index.zip"
  
}
resource "google_cloudfunctions_function" "cloud_func" {
    name = "cloud_func"
    runtime = "nodejs20"
    description = "this is first terraform func"
  
    available_memory_mb = 128
    source_archive_bucket = google_storage_bucket.cloud_func_bucket1.name
    source_archive_object = google_storage_bucket_object.srccode.name

    trigger_http = true
    entry_point = "helloWorldtf"
}
resource "google_cloudfunctions_function_iam_member" "allowaccess" {
    region = google_cloudfunctions_function.cloud_func.region
    cloud_function = google_cloudfunctions_function.cloud_func.name

    role = "roles/cloudfunctions.invoker"
    member = "allUsers"
  
}