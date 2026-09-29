# Cloudflare Zero Trust Gateway DNS Location
resource "cloudflare_zero_trust_dns_location" "managua" {
  account_id     = var.cloudflare_account_id
  name           = "Managua"
  client_default = true
  ecs_support    = false

  max_ttl = {
    mode = "inherit"
  }

  endpoints = {
    doh = {
      enabled       = true
      require_token = false # Disabled to allow DoH in TrackerControl and roaming devices without token error
    }
    dot = {
      enabled       = true
      require_token = false
    }
    ipv4 = {
      enabled = true
    }
    ipv6 = {
      enabled = true
    }
  }

  networks = [
    {
      network = "190.143.252.145/32"
    }
  ]

  lifecycle {
    ignore_changes = [
      endpoints.doh.networks,
      endpoints.dot.networks,
      endpoints.ipv6.networks,
    ]
  }
}

# Declarative import block for DNS Location
import {
  to = cloudflare_zero_trust_dns_location.managua
  id = "${var.cloudflare_account_id}/7192e5bc463e476c861b78061729f103"
}

# Cloudflare Zero Trust Gateway Firewall Policy (CGPS Filter Lists)
resource "cloudflare_zero_trust_gateway_policy" "cgps_filter_lists" {
  account_id  = var.cloudflare_account_id
  name        = "CGPS Filter Lists"
  description = "Filter lists created by Cloudflare Gateway Pi-hole Scripts. Avoid editing this rule. Changing the name of this rule will break the script."
  action      = "block"
  enabled     = true
  precedence  = 11070
  filters     = ["dns"]

  rule_settings = {
    block_reason = "Blocked by CGPS, check your filter lists if this was a mistake."
  }

  # ignore_changes on traffic because list IDs are dynamically populated and updated by the CGPS scripts
  lifecycle {
    ignore_changes = [
      traffic
    ]
  }
}

# Declarative import block for Gateway Policy
import {
  to = cloudflare_zero_trust_gateway_policy.cgps_filter_lists
  id = "${var.cloudflare_account_id}/5b1a0171-9458-4777-8c3e-b3369c6ecb73"
}
