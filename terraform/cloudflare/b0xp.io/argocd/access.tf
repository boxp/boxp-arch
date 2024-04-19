# Creates an Access application to control who can connect.
resource "cloudflare_access_application" "argocd" {
  zone_id          = var.zone_id
  name             = "Access application for argocd.b0xp.io"
  domain           = "argocd.b0xp.io"
  session_duration = "24h"
}

data "cloudflare_access_identity_provider" "github" {
  zone_id = var.zone_id
  name    = "GitHub"
}

# Creates an Access policy for the application.
resource "cloudflare_access_policy" "argocd_policy" {
  application_id = cloudflare_access_application.argocd.id
  zone_id        = var.zone_id
  name           = "policy for argocd.b0xp.io"
  precedence     = "1"
  decision       = "allow"
  include {
    login_method = [data.cloudflare_access_identity_provider.github.id]
  }
}