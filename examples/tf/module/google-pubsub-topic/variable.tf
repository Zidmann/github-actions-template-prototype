variable "name" {
  description = "The name of the pubsub topic"
  type        = string
}

variable "labels" {
  description = "A set of key/value labels to assign to the pubsub topic"
  type        = map(string)
  default     = {}
}

variable "project" {
  description = "The project ID where the pubsub topic will be created in"
  type        = string
  default     = null
}
