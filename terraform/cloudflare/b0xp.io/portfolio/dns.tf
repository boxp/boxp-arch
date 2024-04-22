# Creates the CNAME record that routes b0xp.io to the cloudflare page.
resource "cloudflare_record" "top" {
  zone_id = var.zone_id
  name    = "@"
  value   = "shanghai-4t4.pages.dev"
  type    = "CNAME"
}

resource "cloudflare_record" "www" {
  zone_id = var.zone_id
  name    = "www"
  value   = "shanghai-4t4.pages.dev"
  type    = "CNAME"
}
