resource "aws_iam_user" "external_secrets_operator_user" {
  name = "exteral-secrets-operator-user" # ユーザー名を適切なものに変更してください
}

resource "aws_iam_role" "external_secrets_role" {
  name               = "external-secrets-role"
  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Principal" : {
          "Service" : "es.amazonaws.com"
        },
        "Action" : "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_policy_attachment" "external_secrets_policy_attachment" {
  name       = "external-secrets-policy-attachment"
  roles      = [aws_iam_role.external_secrets_role.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMReadOnlyAccess" # External Secrets OperatorがSSMにアクセスするためのポリシー
}

resource "aws_iam_user_policy_attachment" "attach" {
  user       = aws_iam_user.external_secrets_operator_user.name
  policy_arn = aws_iam_role.external_secrets_role.arn
}
