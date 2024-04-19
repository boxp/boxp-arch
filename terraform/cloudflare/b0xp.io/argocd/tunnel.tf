resource "random_password" "tunnel_secret" {
  length = 64
}

resource "cloudflare_tunnel" "argocd_tunnel" {
  account_id = var.account_id
  name       = "cloudflare argocd tunnel"
  secret     = sensitive(base64sha256(random_password.tunnel_secret.result))
}

# Creates the configuration for the tunnel.
resource "cloudflare_tunnel_config" "argocd_tunnel" {
  tunnel_id  = cloudflare_tunnel.argocd_tunnel.id
  account_id = var.account_id
  config {
    ingress_rule {
      hostname = cloudflare_record.argocd.hostname
      service  = "http://argocd-server:80"
    }
    ingress_rule {
      service = "http_status:404"
    }
  }
}

resource "aws_ssm_parameter" "argocd_tunnel_token" {
  name        = "argocd-tunnel-token"
  description = "for argocd tunnel token"
  type        = "SecureString"
  value       = sensitive(cloudflare_tunnel.argocd_tunnel.tunnel_token)
}
