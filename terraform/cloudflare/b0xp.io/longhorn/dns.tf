# Creates the CNAME record that routes grafana.b0xp.io to the tunnel.
resource "cloudflare_record" "longhorn" {
  zone_id = var.zone_id
  name    = "longhorn"
  value   = cloudflare_tunnel.longhorn_tunnel.cname
  type    = "CNAME"
  proxied = true
}
