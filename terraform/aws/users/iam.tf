resource "aws_iam_group" "admin" {
  name = "admin"
  path = "/system/"
}

resource "aws_iam_group_policy_attachment" "admin_policy_attachment" {
  group      = aws_iam_group.admin.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_policy" "force_mfa" {
  name        = "force-mfa"
  path        = "/system/"
  description = "Policy that forces users to use MFA"

  # Policy Document
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Deny",
      "NotAction": "iam:*",
      "Resource": "*",
      "Condition": {"BoolIfExists": {"aws:MultiFactorAuthPresent": "false"}}
    },
    {
      "Effect": "Allow",
      "Action": "iam:CreateVirtualMFADevice",
      "Resource": "*"
    },
    {
      "Effect": "Allow",
      "Action": "iam:EnableMFADevice",
      "Resource": "*"
    },
    {
      "Effect": "Allow",
      "Action": "iam:ResyncMFADevice",
      "Resource": "*"
    },
    {
      "Effect": "Allow",
      "Action": "iam:ListVirtualMFADevices",
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_group_policy_attachment" "force_mfa_attachment" {
  group      = aws_iam_group.admin.name
  policy_arn = aws_iam_policy.force_mfa.arn
}
