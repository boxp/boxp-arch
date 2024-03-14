resource "aws_iam_user" "k8s_ecr_token_updater_user" {
  name = "k8s-ecr-token-updater-user"
}

resource "aws_iam_policy" "ecr_pull_policy" {
  name        = "ECRPullPolicy"
  description = "Policy that allows pulling from ECR repositories"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "ecr:GetDownloadUrlForLayer",
        "ecr:BatchGetImage",
        "ecr:BatchCheckLayerAvailability",
        "ecr:GetAuthorizationToken"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_user_policy_attachment" "ecr_pull_user_policy_attachment" {
  user       = aws_iam_user.ecr_pull_user.name
  policy_arn = aws_iam_policy.ecr_pull_policy.arn
}
