tfmigrate {
  migration_dir = "./tfmigrate"
  history {
    storage "local" {
      path = "./tfplan.binary"
    }
  }
}
