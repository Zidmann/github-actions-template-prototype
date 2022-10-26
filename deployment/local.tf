
locals {
  pubsub_name  = "pubsub-test-${var.component_name_suffix}"
  storage_name = "${var.project_id}-github-${var.component_name_suffix}"
}
