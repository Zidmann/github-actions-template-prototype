variable "bucket_list" {
  description = "The list of buckets to add the finalyze notification"
  type        = set(string)
  default     = []
}

variable "topic_id" {
  description = "The pub/sub topic ID where to send the message to notify the new files"
  type        = string
}

variable "event_types" {
  description = "The different event to survey to trigger a pubsub message"
  type        = set(string)
  default     = ["OBJECT_FINALIZE"]
}
