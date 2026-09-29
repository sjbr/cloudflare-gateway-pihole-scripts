# Cloudflare Worker resource (Modern Cloudflare Provider v5)
resource "cloudflare_worker" "imported_worker" {
  account_id = var.cloudflare_account_id
  name       = var.worker_script_name

  subdomain = {
    enabled          = true
    previews_enabled = true
  }
}

# Declarative import block (Terraform >= 1.5)
import {
  to = cloudflare_worker.imported_worker
  id = "${var.cloudflare_account_id}/${var.worker_script_name}"
}

# Attach Custom Domain (e.g. dns.adeptsys.uk) to the Worker
resource "cloudflare_workers_custom_domain" "worker_domain" {
  account_id = var.cloudflare_account_id
  hostname   = "${var.subdomain}.${var.domain_name}"
  service    = cloudflare_worker.imported_worker.name
  zone_id    = var.cloudflare_zone_id
}
