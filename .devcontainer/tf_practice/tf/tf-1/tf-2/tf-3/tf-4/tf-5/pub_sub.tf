provider "google" {
  # Configuration options
  project = "terrform-practice-gcp"
  region = "us-central1"
  zone = "us-central1-a"
  credentials = "terraform-gcp-accesskey.json"
}

resource "google_pubsub_topic" "topic_tf" {
    name = "topic_tf"
  
}

resource "google_pubsub_subscription" "sub_tf" {
    name = "sub_tf"
    topic = google_pubsub_topic.topic_tf.name
  
}
