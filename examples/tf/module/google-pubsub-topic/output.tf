output "id" {
  value       = google_pubsub_topic.topic.id
  description = "The ID of the pubsub topic"
}

output "name" {
  value       = google_pubsub_topic.topic.name
  description = "The name of the pubsub topic"
}
