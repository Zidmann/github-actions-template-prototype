provider "google" {
  project = var.project_id
  region  = var.project_region
  zone    = var.project_zone
}


resource "google_storage_bucket" "bucket" {
  name          = "zidmann-personal-test-prototype"
  location      = "EU"
  project       = var.project_id
  storage_class = "MULTI_REGIONAL"
}
