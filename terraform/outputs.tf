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

output "worker_custom_domain" {
  description = "The custom domain hostname routed to the Worker"
  value       = cloudflare_workers_custom_domain.worker_domain.hostname
}

output "gateway_location_id" {
  description = "Cloudflare Gateway DNS Location ID"
  value       = cloudflare_zero_trust_dns_location.managua.id
}

output "gateway_doh_subdomain" {
  description = "Cloudflare Gateway DoH Subdomain ID"
  value       = cloudflare_zero_trust_dns_location.managua.doh_subdomain
}

output "gateway_doh_url" {
  description = "Cloudflare Gateway DoH URL"
  value       = "https://${cloudflare_zero_trust_dns_location.managua.doh_subdomain}.cloudflare-gateway.com/dns-query"
}

output "gateway_dot_hostname" {
  description = "Cloudflare Gateway DoT Hostname"
  value       = "${cloudflare_zero_trust_dns_location.managua.doh_subdomain}.cloudflare-gateway.com"
}

