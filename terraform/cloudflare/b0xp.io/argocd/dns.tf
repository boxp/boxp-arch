# Creates the CNAME record that routes grafana.b0xp.io to the tunnel.
resource "cloudflare_record" "argocd" {
  zone_id = var.zone_id
  name    = "argocd"
  value   = cloudflare_tunnel.argocd_tunnel.cname
  type    = "CNAME"
  proxied = true
}
