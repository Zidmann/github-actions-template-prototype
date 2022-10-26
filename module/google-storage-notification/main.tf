resource "google_storage_notification" "notification" {
  for_each = toset(var.bucket_list)

  bucket         = each.value
  payload_format = "JSON_API_V1"
  topic          = var.topic_id
  event_types    = var.event_types
}
