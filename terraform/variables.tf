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
}
