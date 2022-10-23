provider "google" {
  project = var.project_id
  region  = var.project_region
  zone    = var.project_zone
}

module "module" {
  source = "git@github.com:$GITHUB_REPOSITORY.git//module/dir1"

  project = var.project_id
  region  = var.project_region
  zone    = var.project_zone
}
