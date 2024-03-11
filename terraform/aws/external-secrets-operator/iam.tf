resource "aws_iam_group" "external_secrets_operator_group" {
  name = "external-secrets-operator-group"
}

resource "aws_iam_user" "external_secrets_operator_user" {
  name = "exteral-secrets-operator-user"
}

resource "aws_iam_group_membership" "external_secrets_operator_membership" {
  name  = "external-secrets-operator-membership"
  users = [aws_iam_user.external_secrets_operator_user.name]
  group = aws_iam_group.external_secrets_operator_group.name
}

resource "aws_iam_group_policy" "external_secrets_policy" {
  name  = "external-secrets-policy"
  group = aws_iam_group.external_secrets_operator_group.name

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "ssm:GetParameters"
        ],
        "Resource" : "*"
      }
    ]
  })
}