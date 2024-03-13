migration "state" "import_ecr" {
  actions = [
    "import aws_ecr_repository.palserver palserver",
  ]
}
