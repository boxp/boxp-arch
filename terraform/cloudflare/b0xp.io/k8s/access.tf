# Creates an Access application to control who can connect.
resource "cloudflare_zero_trust_access_application" "k8s" {
  zone_id = var.zone_id
  name    = "Access application for k8s.b0xp.io"
  domain  = "k8s.b0xp.io"

  policies = [
    cloudflare_zero_trust_access_policy.github_actions_access.id
  ]
}

data "cloudflare_zero_trust_access_identity_provider" "github" {
  zone_id = var.zone_id
  name    = "GitHub"
}

resource "cloudflare_zero_trust_access_policy" "github_actions_access" {
  account_id = var.account_id
  name       = "GitHub Actions Access Policy"
  decision   = "allow"

  require {
    ip = var.allowed_github_actions_ip_ranges
  }

  include {
    login_method = [data.cloudflare_zero_trust_access_identity_provider.github.id]
  }
}
