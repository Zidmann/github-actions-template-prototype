provider "google" {
  project = var.project_id
  region  = var.project_region
  zone    = var.project_zone
}

module "module" {
  source = "git@github.com:$GITHUB_REPOSITORY.git//module/dir1"

  project_id     = var.project_id
  project_region = var.project_region
  project_zone   = var.project_zone
}
