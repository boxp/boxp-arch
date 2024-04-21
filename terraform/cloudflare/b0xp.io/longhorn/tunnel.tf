resource "random_password" "tunnel_secret" {
  length = 64
}

resource "cloudflare_tunnel" "longhorn_tunnel" {
  account_id = var.account_id
  name       = "cloudflare longhorn tunnel"
  secret     = sensitive(base64sha256(random_password.tunnel_secret.result))
}

# Creates the configuration for the tunnel.
resource "cloudflare_tunnel_config" "longhorn_tunnel" {
  tunnel_id  = cloudflare_tunnel.longhorn_tunnel.id
  account_id = var.account_id
  config {
    ingress_rule {
      hostname = cloudflare_record.longhorn.hostname
      service  = "http://longhorn-frontend:80"
    }
    ingress_rule {
      service = "http_status:404"
    }
  }
}

resource "aws_ssm_parameter" "longhorn_tunnel_token" {
  name        = "longhorn-tunnel-token"
  description = "for longhorn tunnel token"
  type        = "SecureString"
  value       = sensitive(cloudflare_tunnel.longhorn_tunnel.tunnel_token)
}
