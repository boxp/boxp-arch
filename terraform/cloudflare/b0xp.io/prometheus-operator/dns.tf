# Creates the CNAME record that routes grafana.b0xp.io to the tunnel.
resource "cloudflare_record" "grafana" {
  zone_id = var.zone_id
  name    = "grafana"
  value   = cloudflare_tunnel.prometheus_operator_tunnel.cname
  type    = "CNAME"
  proxied = true
}
