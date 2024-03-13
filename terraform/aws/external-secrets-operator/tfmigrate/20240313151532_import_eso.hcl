migration "state" "import_eso" {
  actions = [
    "import aws_iam_policy.external_secret_policy arn:aws:iam::839695154978:policy/external_secret_policy",
    "import aws_iam_role.external_secrets_role external_secrets_role",
    "import aws_iam_role_policy_attachment.external_secrets_policy_attachment external_secrets_role/arn:aws:iam::839695154978:policy/external_secret_policy",
    "import aws_iam_user.external_secrets_user external_secrets_user",
  ]
}
