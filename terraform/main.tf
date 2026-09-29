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
