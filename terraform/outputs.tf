output "worker_id" {
  description = "The ID of the imported Cloudflare Worker"
  value       = cloudflare_worker.imported_worker.id
}

output "worker_name" {
  description = "The name of the imported Cloudflare Worker"
  value       = cloudflare_worker.imported_worker.name
}

output "subdomain_enabled" {
  description = "Whether the worker subdomain is enabled"
  value       = cloudflare_worker.imported_worker.subdomain.enabled
}
