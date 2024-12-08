# Creates an Access application to control who can connect.
resource "cloudflare_access_application" "k8s" {
  zone_id          = var.zone_id
  name             = "Access application for k8s.b0xp.io"
  domain           = "k8s.b0xp.io"
}

data "cloudflare_access_identity_provider" "github" {
  zone_id = var.zone_id
  name    = "GitHub"
}

resource "cloudflare_access_policy" "github_actions_access" {
  application_id = cloudflare_access_application.k8s_cluster_api.id
  account_id     = var.cloudflare_account_id
  name           = "GitHub Actions Access Policy"
  decision       = "allow"
  precedence     = 1

  include {
    ip = var.allowed_github_actions_ip_ranges
  }

  include {
    github {
      identity_provider_id = data.cloudflare_access_identity_provider.github.id
      email                = ["*"]
      subject              = var.allowed_github_oidc_subjects
    }
  }
}
