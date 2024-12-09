# Creates an Access application to control who can connect.
resource "cloudflare_zero_trust_access_application" "k8s" {
  zone_id = var.zone_id
  name    = "Access application for k8s.b0xp.io"
  domain  = "k8s.b0xp.io"
}

data "cloudflare_zero_trust_access_identity_provider" "github" {
  zone_id = var.zone_id
  name    = "GitHub"
}

resource "cloudflare_zero_trust_access_policy" "github_actions_access" {
  application_id = cloudflare_zero_trust_access_application.k8s.id
  zone_id        = var.zone_id
  name           = "GitHub Actions Access Policy"
  decision       = "allow"
  precedence     = 1

  require {
    ip = var.allowed_github_actions_ip_ranges
  }

  include {
    github {
      identity_provider_id = data.cloudflare_zero_trust_access_identity_provider.github.id
    }
  }
}
