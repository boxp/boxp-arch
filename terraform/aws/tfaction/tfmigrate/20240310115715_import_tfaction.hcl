migration "state" "import_tfaction" {
  actions = [
    "import aws_iam_role_policy_attachment.terraform_apply_admin terraform_apply_admin",
    "import aws_iam_role_policy_attachment.terraform_plan_readonly terraform_plan_readonly",
    "import aws_iam_role_policy_attachment.tfmigrate_plan_readonly tfmigrate_plan_readonly",
    "import aws_iam_role_policy_attachment.tfmigrate_apply_readonly tfmigrate_apply_readonly",
  ]
}
