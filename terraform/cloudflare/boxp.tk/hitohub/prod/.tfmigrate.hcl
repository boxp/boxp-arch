tfmigrate {
  migration_dir = "./tfmigrate"
  history {
    storage "s3" {
      bucket = "tfaction-history"
      key    = "terraform/cloudflare/boxp.tk/hitohub/prod/history.json"
    }
  }
}
