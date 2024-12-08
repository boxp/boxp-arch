resource "cloudflare_tunnel" "k8s_tunnel" {
  account_id = var.account_id
  name       = "cloudflare k8s tunnel"
}

# Creates the configuration for the tunnel.
resource "cloudflare_tunnel_config" "k8s_tunnel" {
  tunnel_id  = cloudflare_tunnel.k8s_tunnel.id
  account_id = var.account_id
  config {
    ingress_rule {
      hostname = cloudflare_record.k8s.hostname
      service  = "tcp://kubernetes.default.svc.cluster.local:443"
    }
    ingress_rule {
      service = "http_status:404"
    }
  }
}
