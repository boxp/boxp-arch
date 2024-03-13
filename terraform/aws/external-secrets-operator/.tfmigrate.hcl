tfmigrate {
  migration_dir = "./tfmigrate"
  history {
    storage "local" {
      path = "./history.json"
    }
  }
}
