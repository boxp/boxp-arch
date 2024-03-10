migration "state" "import_tfaction" {
  actions = [
    "import aws_iam_role_policy_attachment.terraform_apply_admin GitHubActions_Terraform_AWS_terraform_apply/arn:aws:iam::aws:policy/AdministratorAccess",
    "import aws_iam_role_policy_attachment.terraform_plan_readonly GitHubActions_Terraform_AWS_terraform_plan/arn:aws:iam::aws:policy/ReadOnlyAccess",
    "import aws_iam_role_policy_attachment.tfmigrate_plan_readonly GitHubActions_Terraform_AWS_tfmigrate_plan/arn:aws:iam::aws:policy/ReadOnlyAccess",
    "import aws_iam_role_policy_attachment.tfmigrate_apply_readonly GitHubActions_Terraform_AWS_tfmigrate_apply/arn:aws:iam::aws:policy/ReadOnlyAccess",
  ]
  force = true
}

