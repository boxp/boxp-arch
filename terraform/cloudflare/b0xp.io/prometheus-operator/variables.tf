variable "account_id" {
    description = "The account ID of the Cloudflare account."
    type        = string
    default = "1984a4314b3e75f3bedce97c7a8e0c81"
}

variable "zone_id" {
    description = "The zone ID of the Cloudflare account."
    type        = string
    default = "ec593206d0ef695c3aae3a4cb3173264"
  
}

variable "tunnel_name" {
    description = "The name of the Cloudflare Tunnel."
    type        = string
    default = "prometheus-operator-tunnel"
  
}

variable "aws_account_id" {
  description = "AWS account id"
  type        = string

  default = "839695154978"
}
