variable "project_id" {
  type        = string
  description = "The project ID where all the components will be built and will belonged"
}

variable "component_name_suffix" {
  type        = string
  default     = ""
  description = "The suffix which will be added at the end of the buckets and the service accounts"
}
