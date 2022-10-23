provider "google" {
  project = var.project_id
  region  = var.project_region
  zone    = var.project_zone
}

module "module" {
  source = "$GITHUB_REPOSITORY/module/dir1"
}
