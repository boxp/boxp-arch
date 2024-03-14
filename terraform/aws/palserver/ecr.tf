# terraform planが非常に不安定になったのでkms keyはdefaultにする
#trivy:ignore:AVD-AWS-0057
resource "aws_ecr_repository" "palserver" {
  name                 = "palserver"
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  encryption_configuration {
    encryption_type = "KMS"
  }
}
