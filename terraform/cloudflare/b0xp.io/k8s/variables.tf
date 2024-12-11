variable "account_id" {
  description = "The account ID of the Cloudflare account."
  type        = string
  default     = "1984a4314b3e75f3bedce97c7a8e0c81"
}

variable "zone_id" {
  description = "The zone ID of the Cloudflare account."
  type        = string
  default     = "ec593206d0ef695c3aae3a4cb3173264"
}

variable "service_token_id" {
  description = "The ID of the service token to include in the policy."
  type        = string
  default     = "04a75e03-ac20-467e-bf01-6333445089d1"
}
