terraform {
  backend "remote" {
    organization = "hakoniwa"

    workspaces {
      name = "cloudflare"
    }
  }

  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = ">= 4"
    }
  }
}
