module "pubsub" {
  source = "git@github.com:Zidmann/github-actions-template-prototype.git//examples/tf/module/google-pubsub-topic"

  name    = local.pubsub_name
  labels  = {}
  project = var.project_id
}
