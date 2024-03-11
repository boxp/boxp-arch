# External Secret OperatorがSSMを読み取るためのIAMポリシー
resource "aws_iam_policy" "external_secret_policy" {
  name        = "external_secret_policy"
  description = "Policy for accessing SSM parameters"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Action = [
        "ssm:GetParameter",
        "ssm:GetParameters",
        "ssm:GetParametersByPath"
      ],
      Resource = [
        "arn:aws:ssm:ap-northeast-1:839695154978:parameter/eso-dev-*",
        "arn:aws:ssm:ap-northeast-1:839695154978:parameter/eso-stage-*",
        "arn:aws:ssm:ap-northeast-1:839695154978:parameter/eso-prod-*"
      ]
    }]
  })
}

# External Secret OperatorがアタッチするIAMロール
resource "aws_iam_role" "external_secrets_role" {
  name = "external_secrets_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = {
        AWS = "*"
      },
      Action = "sts:AssumeRole"
    }]
  })
}

# 上記ポリシーをロールにアタッチ
resource "aws_iam_role_policy_attachment" "external_secrets_policy_attachment" {
  role       = aws_iam_role.external_secrets_role.name
  policy_arn = aws_iam_policy.external_secret_policy.arn
}

# External Secret Operatorが利用するIAMユーザー
resource "aws_iam_user" "external_secrets_user" {
  name = "external_secrets_user"
}
