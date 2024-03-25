resource "aws_ecr_repository" "ecr" {
  name = lower("${var.App_Name}-${var.Name}-${var.Env_Type}")
  # image_tag_mutability = "MUTABLE"

  # image_scanning_configuration {
  #   scan_on_push = true
  # }
}

resource "aws_ecr_lifecycle_policy" "ecr" {
  repository = aws_ecr_repository.ecr.name

  policy = <<EOF
    {
        "rules": [
            {
                "rulePriority": 1,
                "description": "Keep last 2 untagged images",
                "selection": {
                    "tagStatus": "untagged",
                    "countType": "imageCountMoreThan",
                    "countNumber": 2
                },
                "action": {
                    "type": "expire"
                }
            }
        ]
    }
    EOF
}