tfmigrate {
  migration_dir = "./tfmigrate"
  history {
    storage "s3" {
      bucket = "tfaction-history"
      key    = "terraform/aws/k8s-ecr-token-updater/history.json"
    }
  }
}
