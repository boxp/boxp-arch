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

variable "allowed_github_actions_ip_ranges" {
  description = "GitHub Actions IP ranges (can be obtained from GitHub documentation)"
  type        = list(string)
  default     = ["192.30.252.0/22", "185.199.108.0/22", "140.82.112.0/20"]
}
