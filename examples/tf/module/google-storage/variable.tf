variable "name" {
  description = "The unique name of the bucket"
  type        = string
}

variable "force_destroy" {
  description = "Delete all the containing files in the bucket if it is removed"
  type        = bool
  default     = false
}

variable "location" {
  description = "The location of the bucket"
  type        = string
  default     = "EU"
}

variable "project" {
  description = "The project ID where the bucket will be created in"
  type        = string
  default     = null
}

variable "storage_class" {
  description = "The storage class of the bucket"
  type        = string
  default     = "MULTI_REGIONAL"
}

variable "versioning_enabled" {
  description = "Enable/Disable the versioning to keep each version of a file in the bucket"
  type        = bool
  default     = false
}

variable "labels" {
  description = "A set of key/value labels to assign to the bucket"
  type        = map(string)
  default     = {}
}
