
locals {
  suffix       = "${var.component_name_suffix}" == "" ? "" : "-${var.component_name_suffix}"
  pubsub_name  = "pubsub-test${local.suffix}"
  storage_name = "${var.project_id}-github${local.suffix}"
}
