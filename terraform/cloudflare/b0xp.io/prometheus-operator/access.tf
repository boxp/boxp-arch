# Creates an Access application to control who can connect.
resource "cloudflare_access_application" "grafana" {
  zone_id          = var.zone_id
  name             = "Access application for grafana.b0xp.io"
  domain           = "grafana.b0xp.io"
  session_duration = "24h"
}

data "cloudflare_access_identity_provider" "github" {
  zone_id = var.zone_id
  name    = "GitHub"
}

# Creates an Access policy for the application.
resource "cloudflare_access_policy" "grafana_policy" {
  application_id = cloudflare_access_application.grafana.id
  zone_id        = var.zone_id
  name           = "policy for grafana.b0xp.io"
  precedence     = "1"
  decision       = "allow"
  include {
    login_method = [data.cloudflare_access_identity_provider.github.id]
  }
}