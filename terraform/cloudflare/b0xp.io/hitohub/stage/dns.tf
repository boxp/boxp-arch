# Creates the CNAME record that routes hitohub-stage.b0xp.io to the tunnel.
resource "cloudflare_record" "hitohub_stage" {
  zone_id = var.zone_id
  name    = "hitohub-stage"
  value   = cloudflare_tunnel.hitohub_stage_tunnel.cname
  type    = "CNAME"
  proxied = true
}

# Creates the CNAME record that routes hitohub-stage.b0xp.io to the tunnel.
resource "cloudflare_record" "api_hitohub_stage" {
  zone_id = var.zone_id
  name    = "api-hitohub-stage"
  value   = cloudflare_tunnel.hitohub_stage_tunnel.cname
  type    = "CNAME"
  proxied = true
}
