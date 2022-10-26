data "google_storage_project_service_account" "gcs_account" {
}

resource "google_pubsub_topic" "topic" {
  name    = var.name
  labels  = var.labels
  project = var.project
}

resource "google_pubsub_topic_iam_binding" "topic" {
  topic   = google_pubsub_topic.topic.id
  role    = "roles/pubsub.publisher"
  members = ["serviceAccount:${data.google_storage_project_service_account.gcs_account.email_address}"]
}
