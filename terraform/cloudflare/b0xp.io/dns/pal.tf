import {
  to = cloudflare_record.terraform_managed_resource_1e2fbbba66fdf0c6df71effb39d15b9c
  id = "${zone}/${cloudflare_record.terraform_managed_resource_1e2fbbba66fdf0c6df71effb39d15b9c.id}"
}

resource "cloudflare_record" "terraform_managed_resource_1e2fbbba66fdf0c6df71effb39d15b9c" {
  name    = "pal"
  proxied = true
  ttl     = 1
  type    = "CNAME"
  value   = "2416b3df-cdba-4370-a0c4-9a50aec1590c.cfargotunnel.com"
  zone_id = var.zone
}
