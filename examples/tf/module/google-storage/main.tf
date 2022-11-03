resource "google_storage_bucket" "bucket" {
  name          = var.name
  force_destroy   var.force_destroy
  location      = var.location
  project       = var.project
  storage_class = var.storage_class
  versioning {
    enabled = var.versioning_enabled
  }
  labels = var.labels
}
