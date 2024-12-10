# Creates an Access application to control who can connect.
resource "cloudflare_zero_trust_access_application" "k8s" {
  zone_id = var.zone_id
  name    = "Access application for k8s.b0xp.io"
  domain  = "k8s.b0xp.io"

  policies = [
    cloudflare_zero_trust_access_policy.github_actions_access.id
  ]
}

resource "cloudflare_zero_trust_access_policy" "github_actions_access" {
  account_id = var.account_id
  name       = "GitHub Actions Access Policy"
  decision   = "allow"
  
  include {
    service_token = [var.service_token_id]
  }
}
