resource "google_storage_bucket" "GCS3" {
    name = "tf-cloud-storage-fromterraform"
    project = "terrform-practice-gcp"
    storage_class = "STANDARD"
    location = "US-CENTRAL1"

    labels = {
        env = "tf_env"
        dep = "compliance"
    }
    uniform_bucket_level_access = "true"

    lifecycle_rule {
      condition {
        age = "5"
      }
      action {
        type = "SetStorageClass"
        storage_class = "COLDLINE"
      }
    }
    retention_policy {
      is_locked = true
      retention_period = 864000
    }
}
