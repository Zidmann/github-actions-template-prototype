output "id" {
  value       = google_storage_bucket.bucket.id
  description = "The ID of the bucket"
}

output "name" {
  value       = google_storage_bucket.bucket.name
  description = "The name of the bucket"
}

output "self_link" {
  value       = google_storage_bucket.bucket.self_link
  description = "The URI of the bucket"
}

output "url" {
  value       = google_storage_bucket.bucket.url
  description = "The URL of the bucket"
}
