variable "cloudflare_api_token" {
  type        = string
  sensitive   = true
  description = "Cloudflare API token with 'Workers Scripts Read/Write' permissions."
}

variable "cloudflare_account_id" {
  type        = string
  description = "The Cloudflare Account ID."
  default     = "a9244ae402534aaaed2072748a928351"
}

variable "worker_script_name" {
  type        = string
  description = "The name of the Cloudflare Worker script."
  default     = "serverless-dns"
}

variable "cloudflare_zone_id" {
  type        = string
  description = "The Zone ID for the managed domain."
  default     = "4f455953dacca24e5aa9f813e73d0d71"
}

variable "domain_name" {
  type        = string
  description = "The Cloudflare managed domain name."
  default     = "adeptsys.uk"
}

variable "subdomain" {
  type        = string
  description = "The subdomain to route to the Worker."
  default     = "dns"
}
