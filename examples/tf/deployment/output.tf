#----------------------------------------------------------------------------
output "bucket_id" {
  value       = module.bucket.id
  description = "The ID of the bucket"
}

output "bucket_name" {
  value       = module.bucket.name
  description = "The name of the bucket"
}

output "bucket_self_link" {
  value       = module.bucket.self_link
  description = "The URI of the bucket"
}

output "bucket_url" {
  value       = module.bucket.url
  description = "The URL of the bucket"
}
#----------------------------------------------------------------------------
output "pubsub_id" {
  value       = module.pubsub.id
  description = "The ID of the pubsub topic"
}

output "pubsub_name" {
  value       = module.pubsub.name
  description = "The name of the pubsub topic"
}
#----------------------------------------------------------------------------
