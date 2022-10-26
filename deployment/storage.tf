module "bucket" {
  source = "git@github.com:Zidmann/github-actions-template-prototype.git//module/google-storage"

  name          = local.storage_name
  location      = "EU"
  force_destroy = true
  project       = var.project_id
  labels        = {}
}

module "notification" {
  source = "git@github.com:Zidmann/github-actions-template-prototype.git//module/google-storage-notification"

  bucket_list = [local.storage_name]
  topic_id    = module.pubsub.id
}
